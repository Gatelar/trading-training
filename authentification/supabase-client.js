// ============ CONFIGURATION SUPABASE ============
// La clé "publishable" est faite pour être visible côté client, pas de risque
// à ce qu'elle soit dans le code source.

const SUPABASE_URL = 'https://pzycamkdwvpkyacvkzrs.supabase.co';
const SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_oaiKmvT1MCJUJ-WEMwzNtw_YJrwiDNs';

const supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_PUBLISHABLE_KEY);
