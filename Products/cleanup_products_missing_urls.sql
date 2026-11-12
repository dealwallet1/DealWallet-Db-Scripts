-- Identify affected product
SELECT
    id,
    name,
    store_id,
    product_link,
    created_at
FROM public.products
WHERE product_link IS NULL
   OR TRIM(product_link) = '';

-- After confirming the product is invalid, delete its related history and product record in one transaction:

BEGIN;

CREATE TEMP TABLE missing_url_product_ids AS
SELECT id
FROM public.products
WHERE product_link IS NULL
   OR TRIM(product_link) = '';

DELETE FROM public.price_history
WHERE product_id IN (
    SELECT id FROM missing_url_product_ids
);

DELETE FROM public.products
WHERE id IN (
    SELECT id FROM missing_url_product_ids
);

SELECT COUNT(*) AS remaining_missing_url_products
FROM public.products
WHERE product_link IS NULL
   OR TRIM(product_link) = '';

-- COMMIT after verification
-- Otherwise: ROLLBACK;