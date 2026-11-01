-- Task: remove subcategories "Computers & Electronics Service Plans" and "eBook Readers & Accessories"
-- together with their child categories (0 deals under both).

-- 1) Find the subcategory ids (expect 2 rows)
SELECT id, name
FROM public.sssubcategories
WHERE name IN (
  'Computers & Electronics Service Plans',
  'eBook Readers & Accessories'
);
-- Result:
--   9b0ac327-cec3-4f82-9513-0822d29e7e98  Computers & Electronics Service Plans
--   9735aef5-3efb-421d-9962-5fc0c4fc04d5  eBook Readers & Accessories

-- 2) Child categories mapped to those subcategory ids (expect 11 rows: 1 + 10)
SELECT c.id, c.name, c.subcategory_id
FROM public.ccchild_categories c
WHERE c.subcategory_id IN (
  '9b0ac327-cec3-4f82-9513-0822d29e7e98',
  '9735aef5-3efb-421d-9962-5fc0c4fc04d5'
)
ORDER BY c.subcategory_id, c.name;

-- 3) Delete those child categories (11 rows deleted)
DELETE FROM public.ccchild_categories
WHERE subcategory_id IN (
  '9b0ac327-cec3-4f82-9513-0822d29e7e98',
  '9735aef5-3efb-421d-9962-5fc0c4fc04d5'
)
RETURNING id, name, subcategory_id;

-- 4) Delete the two subcategories (run only after step 3)
DELETE FROM public.sssubcategories
WHERE id IN (
  '9b0ac327-cec3-4f82-9513-0822d29e7e98',
  '9735aef5-3efb-421d-9962-5fc0c4fc04d5'
)
RETURNING id, name;