import fs from "node:fs";
import path from "node:path";
const ws = path.resolve(process.cwd(), "..");
const out = path.resolve(process.cwd(), "supabase");
const batchSize = 4;
const skipStarts = ["notes-blog/",".agents/",".github/",".vscode/","计算机网络.worktrees/"];
const files = [];
function shouldSkip(rel){ return skipStarts.some((s)=>rel.startsWith(s)); }
function walk(d){
  for (const e of fs.readdirSync(d,{withFileTypes:true})){
    const f = path.join(d,e.name);
    const rel = path.relative(ws,f).split(path.sep).join("/");
    if (shouldSkip(rel)) continue;
    if (e.isDirectory()) { walk(f); continue; }
    if (e.isFile() && rel.toLowerCase().endsWith('.md')) files.push({f,rel});
  }
}
walk(ws);
files.sort((a,b)=>a.rel.localeCompare(b.rel,'zh-CN'));
const esc = (s)=>s.replace(/'/g,"''");
const b64 = (s)=>Buffer.from(s,'utf8').toString('base64');
const slug = (rel)=>rel.replace(/\.md$/i,'').replace(/\s+/g,'-');
const title = (rel,txt)=>{ const m=txt.match(/^#\s+(.+)$/m); return (m?.[1]?.trim())||path.basename(rel,'.md'); };
const excerpt = (txt)=>txt.replace(/\s+/g,' ').trim().slice(0,140);
let bi=0;
for(let i=0;i<files.length;i+=batchSize){
  bi++;
  const chunk=files.slice(i,i+batchSize);
  const lines=[`-- local import batch ${bi}`];
  for(const it of chunk){
    const txt=fs.readFileSync(it.f,'utf8');
    const t=title(it.rel,txt); const s=slug(it.rel); const ex=excerpt(txt);
    const tag = it.rel.split('/')[0] || 'notes';
    lines.push("insert into public.posts (slug,title,content,tags,excerpt)");
    lines.push("values (");
    lines.push(`  '${esc('local/'+s)}',`);
    lines.push(`  convert_from(decode('${b64(t)}','base64'),'UTF8'),`);
    lines.push(`  convert_from(decode('${b64(txt)}','base64'),'UTF8'),`);
    lines.push(`  '{"${esc(tag)}","本地导入"}'::text[],`);
    lines.push(`  convert_from(decode('${b64(ex)}','base64'),'UTF8')`);
    lines.push(")");
    lines.push("on conflict (slug) do update set");
    lines.push("  title=excluded.title,");
    lines.push("  content=excluded.content,");
    lines.push("  tags=excluded.tags,");
    lines.push("  excerpt=excluded.excerpt,");
    lines.push("  updated_at=now();");
    lines.push("");
  }
  fs.writeFileSync(path.join(out,`import_local_batch_${bi}.sql`),lines.join('\n'),'utf8');
}
console.log(JSON.stringify({count:files.length,batches:bi,batchFiles:Array.from({length:bi},(_,i)=>`import_local_batch_${i+1}.sql`)},null,2));
