import { supabaseServer } from "./supabase-server";

export interface DbPost {
    id: number;
    slug: string;
    title: string;
    content: string;
    tags: string[] | null;
    excerpt: string | null;
    created_at: string;
    updated_at: string;
}

const POST_FIELDS = "id,slug,title,content,tags,excerpt,created_at,updated_at";

export async function fetchPosts(): Promise<DbPost[]> {
    try {
        const { data, error } = await supabaseServer
            .from("posts")
            .select(POST_FIELDS)
            .order("updated_at", { ascending: false });

        if (error) {
            console.error(`Failed to load posts from Supabase: ${error.message}`);
            return [];
        }

        return (data ?? []) as DbPost[];
    } catch (error) {
        console.error("Failed to load posts from Supabase:", error);
        return [];
    }
}

export async function fetchPostBySlug(slug: string): Promise<DbPost | null> {
    try {
        const { data, error } = await supabaseServer
            .from("posts")
            .select(POST_FIELDS)
            .eq("slug", slug)
            .maybeSingle();

        if (error) {
            console.error(`Failed to load post from Supabase: ${error.message}`);
            return null;
        }

        return (data as DbPost | null) ?? null;
    } catch (error) {
        console.error("Failed to load post from Supabase:", error);
        return null;
    }
}

export function getPostDisplayDate(post: Pick<DbPost, "updated_at" | "created_at">): Date {
    return new Date(post.updated_at || post.created_at);
}

export function getPostSummary(post: Pick<DbPost, "excerpt" | "content">): string {
    if (post.excerpt && post.excerpt.trim().length > 0) {
        return post.excerpt;
    }

    const plain = post.content.replace(/[#>*`\-]/g, " ").replace(/\s+/g, " ").trim();
    return plain.length > 140 ? `${plain.slice(0, 140)}...` : plain;
}
