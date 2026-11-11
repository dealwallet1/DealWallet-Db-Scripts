-- 1) Check the link: the subcategory, its parent and current children (expect 1 row)
SELECT s.id, s.name AS subcategory, p.id AS parent_id, p.name AS parent_name,
  (SELECT COUNT(*) FROM public.ccchild_categories c WHERE c.subcategory_id = s.id) AS children
FROM public.sssubcategories s
JOIN public.ppparent_categories p ON p.id = s.parent_category_id
WHERE s.id = '6e27c0ab-9372-43c0-a899-d628fd3311b3'
  AND p.id = 'fee63a2b-3522-4a01-b2c9-5e18e199e093';

-- 2) Insert the two child categories (expect 2 rows)
INSERT INTO public.ccchild_categories (id, name, subcategory_id)
SELECT gen_random_uuid(), v.name, s.id
FROM (VALUES ('Smart Phones'), ('Keypad Phones')) AS v(name)
JOIN public.sssubcategories s
  ON s.id = '6e27c0ab-9372-43c0-a899-d628fd3311b3'
 AND s.parent_category_id = 'fee63a2b-3522-4a01-b2c9-5e18e199e093'
WHERE NOT EXISTS (
  SELECT 1 FROM public.ccchild_categories c
  WHERE c.subcategory_id = s.id AND c.name ILIKE v.name
)
RETURNING id, name, subcategory_id;

-- 3) Verify (expect 2 rows)
SELECT c.id, c.name AS child, s.name AS subcategory, p.name AS parent_name
FROM public.ccchild_categories c
JOIN public.sssubcategories s ON s.id = c.subcategory_id
JOIN public.ppparent_categories p ON p.id = s.parent_category_id
WHERE s.id = '6e27c0ab-9372-43c0-a899-d628fd3311b3'
  AND c.name IN ('Smart Phones', 'Keypad Phones');