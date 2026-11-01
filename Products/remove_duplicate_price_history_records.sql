
-- =====================================================
-- Task: Remove Duplicate Records from Price History
-- Table: public.price_history
-- Duplicate criteria:
-- product_id + normalized name + price
-- =====================================================


-- STEP 1: Identify duplicate records
-- Retain one record and display the remaining duplicates.

WITH ranked_prices AS (
    SELECT
        id,
        product_id,
        name,
        price,
        original_price,
        store_id,
        ROW_NUMBER() OVER (
            PARTITION BY
                product_id,
                LOWER(TRIM(name)),
                price
            ORDER BY id
        ) AS rn,
        COUNT(*) OVER (
            PARTITION BY
                product_id,
                LOWER(TRIM(name)),
                price
        ) AS duplicate_count
    FROM public.price_history
    WHERE product_id IS NOT NULL
      AND name IS NOT NULL
      AND TRIM(name) <> ''
      AND price IS NOT NULL
)
SELECT
    id,
    product_id,
    name,
    price,
    original_price,
    store_id,
    rn,
    duplicate_count
FROM ranked_prices
WHERE rn > 1
ORDER BY name, price, rn;


-- STEP 2: Delete duplicate records
-- Retain one record from each duplicate group.

BEGIN;

WITH ranked_prices AS (
    SELECT
        id,
        ROW_NUMBER() OVER (
            PARTITION BY
                product_id,
                LOWER(TRIM(name)),
                price
            ORDER BY id
        ) AS rn
    FROM public.price_history
    WHERE product_id IS NOT NULL
      AND name IS NOT NULL
      AND TRIM(name) <> ''
      AND price IS NOT NULL
)
DELETE FROM public.price_history AS ph
USING ranked_prices AS rp
WHERE ph.id = rp.id
  AND rp.rn > 1
RETURNING
    ph.id,
    ph.product_id,
    ph.name,
    ph.price;

COMMIT;
