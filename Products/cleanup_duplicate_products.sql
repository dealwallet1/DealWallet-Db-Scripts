BEGIN;

CREATE TEMP TABLE duplicate_product_ids AS
WITH ranked_products AS (
    SELECT
        id,
        ROW_NUMBER() OVER (
            PARTITION BY store_id, LOWER(TRIM(product_link))
            ORDER BY created_at ASC NULLS LAST, id ASC
        ) AS rn
    FROM public.products
    WHERE product_link IS NOT NULL
      AND TRIM(product_link) <> ''
)
SELECT id
FROM ranked_products
WHERE rn > 1;

-- Verify deletion count
SELECT COUNT(*) AS products_to_delete
FROM duplicate_product_ids;

-- Delete related price history
DELETE FROM public.price_history
WHERE product_id IN (
    SELECT id FROM duplicate_product_ids
);

-- Delete duplicate products
DELETE FROM public.products
WHERE id IN (
    SELECT id FROM duplicate_product_ids
);

-- Verify remaining products
SELECT COUNT(*) AS remaining_products
FROM public.products;

-- COMMIT only after verification
-- COMMIT;
-- Otherwise: ROLLBACK;