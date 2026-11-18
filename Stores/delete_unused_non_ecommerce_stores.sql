
-- ============================================================
-- Remove unused and non-e-commerce stores
-- Delete associated CueCoupons records first.
-- ============================================================

BEGIN;

-- 1. Delete associated CueCoupons records
DELETE FROM public.cue_coupons
WHERE store_id IN (
    SELECT id
    FROM public.stores
    WHERE LOWER(TRIM(name)) = ANY (ARRAY[
        'bokun',
        'cursor',
        'digitalocean',
        'dtdc',
        'durable',
        'environics',
        'fathom',
        'firecrawl',
        'gravity forms',
        'greythr',
        'hostarmada',
        'hunter',
        'hushed',
        'icons8',
        'iconscout',
        'icontact',
        'instamojo',
        'invent',
        'codashop',
        'coutloot',
        'fleek',
        'gamivo',
        'corel',
        'emergent',
        'dreamhost',
        'esd codes',
        'eduonix',
        'epic on',
        'hungama',
        'imyphone'
    ])
);

-- 2. Delete selected store records
DELETE FROM public.stores
WHERE LOWER(TRIM(name)) = ANY (ARRAY[
    'bokun',
    'cursor',
    'digitalocean',
    'dtdc',
    'durable',
    'environics',
    'fathom',
    'firecrawl',
    'gravity forms',
    'greythr',
    'hostarmada',
    'hunter',
    'hushed',
    'icons8',
    'iconscout',
    'icontact',
    'instamojo',
    'invent',
    'codashop',
    'coutloot',
    'fleek',
    'gamivo',
    'corel',
    'emergent',
    'dreamhost',
    'esd codes',
    'eduonix',
    'epic on',
    'hungama',
    'imyphone'
])
RETURNING id, name;

-- Verify returned rows before committing.
-- COMMIT;
-- ROLLBACK;
