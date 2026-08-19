// ============ CONFIGURATION SUPABASE (partagée sur tout le site) ============
const SUPABASE_URL = 'https://pzycamkdwvpkyacvkzrs.supabase.co';
const SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_oaiKmvT1MCJUJ-WEMwzNtw_YJrwiDNs';

const supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_PUBLISHABLE_KEY);
