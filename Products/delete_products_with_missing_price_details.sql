SELECT *
FROM public.price_history
WHERE NULLIF(BTRIM(price::TEXT), '') IS NULL
   OR NULLIF(BTRIM(original_price::TEXT), '') IS NULL
   OR NULLIF(BTRIM(discount::TEXT), '') IS NULL
ORDER BY name;


DELETE FROM public.price_history
WHERE NULLIF(BTRIM(price::TEXT), '') IS NULL
   OR NULLIF(BTRIM(original_price::TEXT), '') IS NULL
   OR NULLIF(BTRIM(discount::TEXT), '') IS NULL
RETURNING id, name, price, original_price, discount, store_id;


SELECT *
FROM public.price_products
WHERE NULLIF(BTRIM(price::TEXT), '') IS NULL
   OR NULLIF(BTRIM(original_price::TEXT), '') IS NULL
   OR NULLIF(BTRIM(discount::TEXT), '') IS NULL
ORDER BY name;


DELETE FROM public.price_products
WHERE NULLIF(BTRIM(price::TEXT), '') IS NULL
   OR NULLIF(BTRIM(original_price::TEXT), '') IS NULL
   OR NULLIF(BTRIM(discount::TEXT), '') IS NULL
RETURNING id, name, price, original_price, discount, store_id;