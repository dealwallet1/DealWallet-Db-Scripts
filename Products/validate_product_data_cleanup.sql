-- Total and unique products
SELECT
    COUNT(*) AS total_products,
    COUNT(DISTINCT id) AS unique_products
FROM public.products;

-- Duplicate product URLs
SELECT
    COUNT(*) AS duplicate_url_records
FROM (
    SELECT
        store_id,
        LOWER(TRIM(product_link))
    FROM public.products
    WHERE product_link IS NOT NULL
      AND TRIM(product_link) <> ''
    GROUP BY
        store_id,
        LOWER(TRIM(product_link))
    HAVING COUNT(*) > 1
) d;

-- Missing product URLs
SELECT COUNT(*) AS missing_url_products
FROM public.products
WHERE product_link IS NULL
   OR TRIM(product_link) = '';