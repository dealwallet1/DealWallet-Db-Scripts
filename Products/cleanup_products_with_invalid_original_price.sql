1. Check records in price_history

SELECT id, name, price, original_price, store_id
FROM public.price_history
WHERE original_price IS NULL
   OR BTRIM(original_price::TEXT) = ''
   OR BTRIM(original_price::TEXT) ~ '^[-+]?0+(\.0+)?$'
ORDER BY name;


2. Check records in products

SELECT id, name, price, original_price, store_id
FROM public.products
WHERE original_price IS NULL
   OR BTRIM(original_price::TEXT) = ''
   OR BTRIM(original_price::TEXT) ~ '^[-+]?0+(\.0+)?$'
ORDER BY name;


3. Delete — First price_history, next products
BEGIN;

-- Identify products that must be deleted
CREATE TEMP TABLE products_to_delete
ON COMMIT DROP AS
SELECT id
FROM public.products
WHERE original_price IS NULL
   OR BTRIM(original_price::TEXT) = ''
   OR BTRIM(original_price::TEXT) ~ '^[-+]?0+(\.0+)?$';

-- First: Delete invalid price history records
-- Also remove all history linked to products being deleted
DELETE FROM public.price_history ph
WHERE ph.original_price IS NULL
   OR BTRIM(ph.original_price::TEXT) = ''
   OR BTRIM(ph.original_price::TEXT) ~ '^[-+]?0+(\.0+)?$'
   OR ph.product_id IN (
       SELECT id FROM products_to_delete
   );

-- Next: Delete products
DELETE FROM public.products
WHERE id IN (
    SELECT id FROM products_to_delete
)
RETURNING id, name, price, original_price, store_id;

COMMIT;