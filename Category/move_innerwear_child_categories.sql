-- Task 6633: add missing child categories in women's fashion
-- Move the child categories Bras, Panties and Shapewear from "Lingerie & Lounge Sets"
-- to the "Innerwear" subcategory under Women's Fashion.
-- Lingerie & Lounge Sets id: 286a0229-20b0-43bd-aa13-51c61791936d

-- 1) Check all "Innerwear" subcategories with their parent and child count.
--    Result: 3 rows, one each under Kids Wear (0 children), Men's Fashion (5), Women's Fashion (0).
--    They are separate subcategories, not duplicates, so nothing is deleted.
SELECT s.id, s.name, p.name AS parent_name,
  (SELECT COUNT(*) FROM public.ccchild_categories c WHERE c.subcategory_id = s.id) AS children
FROM public.sssubcategories s
LEFT JOIN public.ppparent_categories p ON p.id = s.parent_category_id
WHERE s.name ILIKE 'Innerwear'
ORDER BY p.name;

-- 2) Preview the 3 children to move (expect 3 rows, all in Lingerie & Lounge Sets)
SELECT id, name, subcategory_id
FROM public.ccchild_categories
WHERE id IN (
  '46fccc28-b392-43fb-8556-5426ed9d1daa',   -- Bras
  'a2c498e3-a6df-432a-878a-a51fd1f0ed32',   -- Panties
  '5a093bc6-97d4-4f21-ba81-fb07ce11b45e'    -- Shapewear
);

-- 3) Move them to Innerwear under Women's Fashion (expect 3 rows)
--    Runs only if exactly one such Innerwear exists and the children are still in Lingerie & Lounge Sets.
UPDATE public.ccchild_categories
SET subcategory_id = (
  SELECT s.id
  FROM public.sssubcategories s
  JOIN public.ppparent_categories p ON p.id = s.parent_category_id
  WHERE s.name ILIKE 'Innerwear' AND p.name ILIKE 'Women%Fashion%'
)
WHERE id IN (
  '46fccc28-b392-43fb-8556-5426ed9d1daa',
  'a2c498e3-a6df-432a-878a-a51fd1f0ed32',
  '5a093bc6-97d4-4f21-ba81-fb07ce11b45e'
)
AND subcategory_id = '286a0229-20b0-43bd-aa13-51c61791936d'
AND (
  SELECT COUNT(*)
  FROM public.sssubcategories s
  JOIN public.ppparent_categories p ON p.id = s.parent_category_id
  WHERE s.name ILIKE 'Innerwear' AND p.name ILIKE 'Women%Fashion%'
) = 1
RETURNING id, name, subcategory_id;

-- 4) Verify: Bras, Panties and Shapewear now sit under Innerwear / Women's Fashion (executed, confirmed)
SELECT c.name AS child, s.name AS subcategory, p.name AS parent_name
FROM public.ccchild_categories c
JOIN public.sssubcategories s ON s.id = c.subcategory_id
LEFT JOIN public.ppparent_categories p ON p.id = s.parent_category_id
WHERE c.id IN (
  '46fccc28-b392-43fb-8556-5426ed9d1daa',
  'a2c498e3-a6df-432a-878a-a51fd1f0ed32',
  '5a093bc6-97d4-4f21-ba81-fb07ce11b45e'
);

-- 5) Optional: Lingerie & Lounge Sets should keep its other 4 children
--    (Lingerie Sets, Camisoles, Sleepwear & Robes, Swimwear)
SELECT c.name AS child
FROM public.ccchild_categories c
WHERE c.subcategory_id = '286a0229-20b0-43bd-aa13-51c61791936d'
ORDER BY c.name;