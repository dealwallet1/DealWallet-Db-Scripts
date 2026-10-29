-- 1) Preview: the 4 rows, with rn = 1 being the one that is kept
SELECT id, name, store_id, price, created_at,
       ROW_NUMBER() OVER (PARTITION BY store_id ORDER BY created_at, id) AS rn
FROM public.products
WHERE name = 'Fur Ball Story Digestive Care Liquid'
ORDER BY rn;

-- 2) Delete price_history of the 3 duplicates
DELETE FROM public.price_history
WHERE product_id IN (
  SELECT id FROM (
    SELECT id,
           ROW_NUMBER() OVER (PARTITION BY store_id ORDER BY created_at, id) AS rn
    FROM public.products
    WHERE name = 'Fur Ball Story Digestive Care Liquid'
  ) t WHERE rn > 1
);

-- 3) Delete the 3 duplicate products
DELETE FROM public.products
WHERE id IN (
  SELECT id FROM (
    SELECT id,
           ROW_NUMBER() OVER (PARTITION BY store_id ORDER BY created_at, id) AS rn
    FROM public.products
    WHERE name = 'Fur Ball Story Digestive Care Liquid'
  ) t WHERE rn > 1
)
RETURNING id, name;