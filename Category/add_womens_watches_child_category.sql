-- Task: add a child category "Women's Watches" under the Watches subcategory in Women's Fashion.
-- A first attempt matched the subcategory by name only. It inserted nothing, because "Watches"
-- exists under several parents (Women's Fashion, Men's Fashion, Accessories, Jewellery & Accessories).
-- The final insert below targets the Women's Fashion parent only.

-- 1) Find every watch-related subcategory with its parent and child count
--    Result: 10 rows. Women's Fashion > Watches has 0 children.
SELECT s.id, s.name, p.name AS parent_name,
  (SELECT COUNT(*) FROM public.ccchild_categories c WHERE c.subcategory_id = s.id) AS children
FROM public.sssubcategories s
LEFT JOIN public.ppparent_categories p ON p.id = s.parent_category_id
WHERE s.name ILIKE '%watch%';

-- 2) Check the target row (expect exactly 1 row, 0 children)
SELECT s.id, s.name, p.name AS parent_name,
  (SELECT COUNT(*) FROM public.ccchild_categories c WHERE c.subcategory_id = s.id) AS children
FROM public.sssubcategories s
JOIN public.ppparent_categories p ON p.id = s.parent_category_id
WHERE s.name ILIKE 'Watches' AND p.name ILIKE 'Women%Fashion%';

-- 3) Insert the child category (expect 1 row)
--    Inserts only if exactly one Women's Fashion > Watches exists and the child is not there yet.
INSERT INTO public.ccchild_categories (id, name, subcategory_id)
SELECT gen_random_uuid(), 'Women''s Watches', s.id
FROM public.sssubcategories s
JOIN public.ppparent_categories p ON p.id = s.parent_category_id
WHERE s.name ILIKE 'Watches' AND p.name ILIKE 'Women%Fashion%'
  AND (
    SELECT COUNT(*)
    FROM public.sssubcategories s2
    JOIN public.ppparent_categories p2 ON p2.id = s2.parent_category_id
    WHERE s2.name ILIKE 'Watches' AND p2.name ILIKE 'Women%Fashion%'
  ) = 1
  AND NOT EXISTS (
    SELECT 1 FROM public.ccchild_categories c
    WHERE c.subcategory_id = s.id AND c.name ILIKE 'Women%s Watches'
  )
RETURNING id, name, subcategory_id;

-- 4) Verify (expect 1 row: Women's Watches / Watches / Women's Fashion)
SELECT c.id, c.name, s.name AS subcategory, p.name AS parent_name
FROM public.ccchild_categories c
JOIN public.sssubcategories s ON s.id = c.subcategory_id
JOIN public.ppparent_categories p ON p.id = s.parent_category_id
WHERE c.name ILIKE 'Women%s Watches';