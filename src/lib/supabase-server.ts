import { createClient } from "@supabase/supabase-js";

const url = import.meta.env.PUBLIC_SUPABASE_URL;
const serviceRoleKey = import.meta.env.SUPABASE_SERVICE_ROLE_KEY;
const anonKey = import.meta.env.PUBLIC_SUPABASE_ANON_KEY;
const key = serviceRoleKey || anonKey;

if (!url || !key) {
    throw new Error(
        "Missing PUBLIC_SUPABASE_URL and (SUPABASE_SERVICE_ROLE_KEY or PUBLIC_SUPABASE_ANON_KEY)"
    );
}

export const supabaseServer = createClient(url, key, {
    auth: {
        persistSession: false,
        autoRefreshToken: false
    }
});
