-- Task: remove the "FASHION COLOUR" subcategory (and its child categories) from sssubcategories.

-- 1) Preview: the subcategory, its parent and child count (expect 1 row)
SELECT s.id, s.name, p.name AS parent_name,
  (SELECT COUNT(*) FROM public.ccchild_categories c WHERE c.subcategory_id = s.id) AS children
FROM public.sssubcategories s
LEFT JOIN public.ppparent_categories p ON p.id = s.parent_category_id
WHERE s.name ILIKE 'FASHION COLOUR';

-- 2) List its child categories (check before deleting)
SELECT c.id, c.name
FROM public.ccchild_categories c
JOIN public.sssubcategories s ON s.id = c.subcategory_id
WHERE s.name ILIKE 'FASHION COLOUR';

-- 3) Delete the child categories first
DELETE FROM public.ccchild_categories
WHERE subcategory_id IN (
  SELECT id FROM public.sssubcategories WHERE name ILIKE 'FASHION COLOUR'
)
RETURNING id, name;

-- 4) Delete the subcategory (expect 1 row)
DELETE FROM public.sssubcategories
WHERE name ILIKE 'FASHION COLOUR'
RETURNING id, name;

-- 5) Verify: no colour-related subcategory named FASHION COLOUR remains (expect 0 rows)
SELECT id, name FROM public.sssubcategories
WHERE name ILIKE 'FASHION COLOUR';