-- 1) PREVIEW (expect 1 row)
SELECT id, name, category_id AS old_category_id
FROM public.stores
WHERE LOWER(TRIM(name)) = 'coverscart';

-- 2) UPDATE (expect 1 row)
UPDATE public.stores
SET category_id = '2afd57d6-c614-4482-b9f1-78bbba75d335'
WHERE LOWER(TRIM(name)) = 'coverscart'
RETURNING id, name, category_id;