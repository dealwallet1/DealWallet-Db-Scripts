
-- =====================================================
-- Delete unwanted Spaces store from DealWallet
-- =====================================================

-- 1. Preview Spaces store and its references
SELECT
    s.id,
    s.name,
    COUNT(DISTINCT p.id) AS product_count,
    COUNT(DISTINCT cc.id) AS coupon_count
FROM public.stores s
LEFT JOIN public.products p
    ON p.store_id = s.id
LEFT JOIN public.cue_coupons cc
    ON cc.store_id = s.id
WHERE LOWER(TRIM(s.name)) = 'spaces'
GROUP BY s.id, s.name;

-- 2. Delete associated coupons and store
BEGIN;

DELETE FROM public.cue_coupons
WHERE store_id IN (
    SELECT id
    FROM public.stores
    WHERE LOWER(TRIM(name)) = 'spaces'
);

DELETE FROM public.stores
WHERE LOWER(TRIM(name)) = 'spaces'
RETURNING id, name;

-- Verify the returned rows.
-- COMMIT;
-- ROLLBACK;
