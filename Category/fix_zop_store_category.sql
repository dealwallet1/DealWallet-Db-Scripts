-- Task 6680: Incorrect Store Category Mapping - ZOP displayed under Baby & Kids
-- Fix: change category_id of the ZOP store.
-- f0be33e2-086a-4af2-a813-a2fe842638ed = Fashion & Lifestyle (categories table)

-- 1) Preview: current value (expect 1 row)
SELECT id, name, category_id
FROM public.stores
WHERE name = 'ZOP';

-- 2) Update
UPDATE public.stores
SET category_id = '87139e38-6efa-4363-8c51-f4059d23cac3'
WHERE name = 'ZOP'
RETURNING id, name, category_id;

-- 3) Verify: category name for the new id
SELECT s.id, s.name, s.category_id, k.name AS category_name
FROM public.stores s
LEFT JOIN public.categories k ON k.id = s.category_id
WHERE s.name = 'ZOP';