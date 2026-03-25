const fs = require("fs");
const path = require("path");
const { createClient } = require("@supabase/supabase-js");

function loadEnv(filePath) {
  const env = {};
  if (!fs.existsSync(filePath)) {
    return env;
  }
  const lines = fs.readFileSync(filePath, "utf8").split(/\r?\n/);
  for (const line of lines) {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith("#")) {
      continue;
    }
    const idx = trimmed.indexOf("=");
    if (idx === -1) {
      continue;
    }
    const key = trimmed.slice(0, idx).trim();
    let value = trimmed.slice(idx + 1).trim();
    if ((value.startsWith('"') && value.endsWith('"')) || (value.startsWith("'") && value.endsWith("'"))) {
      value = value.slice(1, -1);
    }
    env[key] = value;
  }
  return env;
}

function decodeBase64Utf8(value) {
  return Buffer.from(value, "base64").toString("utf8");
}

function parseTags(tagLiteral) {
  const trimmed = tagLiteral.trim();
  if (!trimmed.startsWith("{") || !trimmed.endsWith("}")) {
    return [];
  }
  const inner = trimmed.slice(1, -1).trim();
  if (!inner) {
    return [];
  }
  return inner.split(",").map((part) => part.trim().replace(/^"|"$/g, ""));
}

function parseSqlRows(sql) {
  const pattern = /insert into public\.posts[\s\S]*?values\s*\(\s*'([^']+)'\s*,\s*convert_from\(decode\('([^']+)'\s*,\s*'base64'\)\s*,\s*'UTF8'\)\s*,\s*convert_from\(decode\('([^']+)'\s*,\s*'base64'\)\s*,\s*'UTF8'\)\s*,\s*'(\{[^']*\})'::text\[\]\s*,\s*convert_from\(decode\('([^']+)'\s*,\s*'base64'\)\s*,\s*'UTF8'\)\s*\)\s*on conflict/gi;
  const rows = [];
  let match = null;
  while ((match = pattern.exec(sql)) !== null) {
    const slug = match[1];
    const title = decodeBase64Utf8(match[2]);
    const content = decodeBase64Utf8(match[3]);
    const tags = parseTags(match[4]);
    const excerpt = decodeBase64Utf8(match[5]);
    rows.push({ slug, title, content, tags, excerpt });
  }
  return rows;
}

async function main() {
  const repoRoot = path.resolve(__dirname, "..");
  const env = loadEnv(path.join(repoRoot, ".env"));
  const url = env.PUBLIC_SUPABASE_URL || process.env.PUBLIC_SUPABASE_URL;
  const anonKey = env.PUBLIC_SUPABASE_ANON_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY;
  const serviceRoleKey = env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SERVICE_ROLE_KEY;
  console.log(
    "Loaded SUPABASE_SERVICE_ROLE_KEY length:",
    serviceRoleKey ? String(serviceRoleKey).length : 0
  );
  const authEmail = env.SUPABASE_EMAIL || process.env.SUPABASE_EMAIL;
  const authPassword = env.SUPABASE_PASSWORD || process.env.SUPABASE_PASSWORD;

  if (!url || (!anonKey && !serviceRoleKey)) {
    throw new Error("Missing PUBLIC_SUPABASE_URL and a Supabase key (SUPABASE_SERVICE_ROLE_KEY or PUBLIC_SUPABASE_ANON_KEY).");
  }

  const sqlPath = path.join(repoRoot, "supabase", "import_local_batch_7.sql");
  const sql = fs.readFileSync(sqlPath, "utf8");
  const rows = parseSqlRows(sql);

  if (!rows.length) {
    throw new Error("No rows found in import_local_batch_7.sql.");
  }

  const key = serviceRoleKey || anonKey;
  if (!serviceRoleKey) {
    console.warn("SUPABASE_SERVICE_ROLE_KEY not found; using anon key which may be blocked by RLS.");
  } else {
    console.log("SUPABASE_SERVICE_ROLE_KEY detected for batch import.");
  }

  const supabase = createClient(url, key);

  if (!serviceRoleKey && authEmail && authPassword) {
    const { error: authError } = await supabase.auth.signInWithPassword({
      email: authEmail,
      password: authPassword,
    });
    if (authError) {
      throw authError;
    }
  }
  const { error } = await supabase.from("posts").upsert(rows, { onConflict: "slug" });
  if (error) {
    throw error;
  }

  console.log(`Imported ${rows.length} rows from batch 7.`);
}

main().catch((err) => {
  console.error("Batch 7 import failed:", err && err.message ? err.message : err);
  if (err && err.cause) {
    console.error("Cause:", err.cause);
  }
  process.exit(1);
});
