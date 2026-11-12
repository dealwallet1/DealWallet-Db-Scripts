SELECT
    COUNT(*) AS total_products,
    COUNT(DISTINCT (
        store_id,
        LOWER(TRIM(product_link))
    )) AS unique_store_product_urls,
    COUNT(*) - COUNT(DISTINCT (
        store_id,
        LOWER(TRIM(product_link))
    )) AS duplicate_url_records
FROM public.products
WHERE product_link IS NOT NULL
  AND TRIM(product_link) <> '';