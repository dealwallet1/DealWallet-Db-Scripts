
-- =====================================================
-- Remove unwanted stores without associated coupons
-- Table: public.stores
-- Coupon reference: public.cue_coupons
-- =====================================================

-- Step 1: Preview stores and their coupon counts

WITH input_stores(store_name) AS (
    VALUES
    ('Bajaj finance'),
    ('kotak Mahindra bank'),
    ('Zomato gold'),
    ('The decor mart'),
    ('Happilo'),
    ('Flipkart Health plus'),
    ('swisee Healthness'),
    ('asaya'),
    ('avvatar'),
    ('bloom'),
    ('Brillare'),
    ('cahify screen pro'),
    ('cashify store'),
    ('charles and kaith'),
    ('culture circle'),
    ('etchcraft emporium'),
    ('jack and jones junior'),
    ('kleenest'),
    ('krisp'),
    ('Makemytriphotels'),
    ('mymuse'),
    ('nomad'),
    ('p&G shop'),
    ('Roote and herbs'),
    ('saturn by ghc'),
    ('step the hindu'),
    ('sweet truth'),
    ('tatacliqpaletee'),
    ('wow eats'),
    ('yaantra'),
    ('yoho'),
    ('zendesk'),
    ('gamma app'),
    ('amazon recharge'),
    ('flipkart flight'),
    ('trip.com')
)
SELECT
    i.store_name,
    s.id AS store_id,
    s.name AS database_store_name,
    COUNT(c.store_id) AS coupon_count,
    CASE
        WHEN s.id IS NULL THEN 'STORE NOT FOUND'
        WHEN COUNT(c.store_id) > 0 THEN 'KEEP'
        ELSE 'DELETE'
    END AS action
FROM input_stores i
LEFT JOIN public.stores s
    ON LOWER(TRIM(s.name)) = LOWER(TRIM(i.store_name))
LEFT JOIN public.cue_coupons c
    ON c.store_id = s.id
GROUP BY i.store_name, s.id, s.name
ORDER BY action, i.store_name;


-- Step 2: Delete stores without associated coupons
-- Execute only after verifying the preview results.
-- Check other foreign-key references before deletion.

WITH input_stores(store_name) AS (
    VALUES
    ('Bajaj finance'),
    ('kotak Mahindra bank'),
    ('Zomato gold'),
    ('The decor mart'),
    ('Happilo'),
    ('Flipkart Health plus'),
    ('swisee Healthness'),
    ('asaya'),
    ('avvatar'),
    ('bloom'),
    ('Brillare'),
    ('cahify screen pro'),
    ('cashify store'),
    ('charles and kaith'),
    ('culture circle'),
    ('etchcraft emporium'),
    ('jack and jones junior'),
    ('kleenest'),
    ('krisp'),
    ('Makemytriphotels'),
    ('mymuse'),
    ('nomad'),
    ('p&G shop'),
    ('Roote and herbs'),
    ('saturn by ghc'),
    ('step the hindu'),
    ('sweet truth'),
    ('tatacliqpaletee'),
    ('wow eats'),
    ('yaantra'),
    ('yoho'),
    ('zendesk'),
    ('gamma app'),
    ('amazon recharge'),
    ('flipkart flight'),
    ('trip.com')
)
DELETE FROM public.stores s
USING input_stores i
WHERE LOWER(TRIM(s.name)) = LOWER(TRIM(i.store_name))
AND NOT EXISTS (
    SELECT 1
    FROM public.cue_coupons c
    WHERE c.store_id = s.id
)
RETURNING s.id, s.name;


-- Step 3: Verify remaining stores

SELECT id, name
FROM public.stores
WHERE LOWER(TRIM(name)) IN (
    'bajaj finance',
    'kotak mahindra bank',
    'zomato gold',
    'the decor mart',
    'happilo',
    'flipkart health plus',
    'swisee healthness',
    'asaya',
    'avvatar',
    'bloom',
    'brillare',
    'cahify screen pro',
    'cashify store',
    'charles and kaith',
    'culture circle',
    'etchcraft emporium',
    'jack and jones junior',
    'kleenest',
    'krisp',
    'makemytriphotels',
    'mymuse',
    'nomad',
    'p&g shop',
    'roote and herbs',
    'saturn by ghc',
    'step the hindu',
    'sweet truth',
    'tatacliqpaletee',
    'wow eats',
    'yaantra',
    'yoho',
    'zendesk',
    'gamma app',
    'amazon recharge',
    'flipkart flight',
    'trip.com'
)
ORDER BY name;
