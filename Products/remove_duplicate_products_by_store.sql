WITH ranked_products AS (
    SELECT
        id,
        name,
        price,
        ROW_NUMBER() OVER (
            PARTITION BY LOWER(TRIM(name)), price
            ORDER BY id
        ) AS rn,
        COUNT(*) OVER (
            PARTITION BY LOWER(TRIM(name)), price
        ) AS duplicate_count
    FROM public.products
    WHERE store_id = '4249b406-3276-4e08-9337-0a20bd77bfa7'
      AND name IS NOT NULL
      AND price IS NOT NULL
)
SELECT id, name, price, rn, duplicate_count
FROM ranked_products
WHERE duplicate_count > 1
ORDER BY name, price, rn;



BEGIN;

CREATE TEMP TABLE duplicate_products_to_delete
ON COMMIT DROP AS
SELECT id
FROM (
    SELECT
        id,
        ROW_NUMBER() OVER (
            PARTITION BY LOWER(TRIM(name)), price
            ORDER BY id
        ) AS rn
    FROM public.products
    WHERE store_id = '4249b406-3276-4e08-9337-0a20bd77bfa7'
      AND name IS NOT NULL
      AND price IS NOT NULL
) ranked
WHERE rn > 1;

DELETE FROM public.price_history
WHERE product_id IN (
    SELECT id FROM duplicate_products_to_delete
);

DELETE FROM public.products
WHERE id IN (
    SELECT id FROM duplicate_products_to_delete
);

COMMIT;

