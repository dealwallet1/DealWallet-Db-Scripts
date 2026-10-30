SELECT id, name, price, store_id
FROM public.products
WHERE price >= 1
  AND price < 10
ORDER BY price ASC;


BEGIN;

-- First delete related price history
DELETE FROM public.price_history
WHERE product_id IN (
    SELECT id
    FROM public.products
    WHERE price >= 1
      AND price < 10
);

-- Next delete products
DELETE FROM public.products
WHERE price >= 1
  AND price < 10;

COMMIT;