-- Add 32 child categories under 3 subcategories (ccchild_categories)
-- ASSUMPTION: ccchild_categories has columns id, name, subcategory_id. If the insert errors, run section 1 and send me the result.

-- ===== 1) Schema check =====
SELECT table_name, column_name, data_type, column_default
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name IN ('ccchild_categories', 'category_id_mapping')
ORDER BY table_name, ordinal_position;

-- ===== 2) Parent subcategories: each name must return exactly 1 row =====
SELECT s.id, s.name, COUNT(*) OVER (PARTITION BY s.name) AS same_name_rows
FROM public.sssubcategories s
WHERE s.name IN ('Cell Phones & Accessories', 'Computers & Accessories', 'Video Projectors');

-- ===== 3) PREVIEW: new children (already existing ones are skipped) =====
WITH new_children(sub_name, child_name) AS (VALUES
  ('Cell Phones & Accessories', 'Mobiles'),
  ('Cell Phones & Accessories', 'Mobile Camera Lens Protectors'),
  ('Cell Phones & Accessories', 'Cases & Covers'),
  ('Cell Phones & Accessories', 'Power Banks'),
  ('Cell Phones & Accessories', 'Mobile Holders'),
  ('Cell Phones & Accessories', 'Mobile Flashes'),
  ('Cell Phones & Accessories', 'Mods'),
  ('Cell Phones & Accessories', 'Mobile Body Panels'),
  ('Cell Phones & Accessories', 'Mobile Battery'),
  ('Cell Phones & Accessories', 'Screen Expander For Phones'),
  ('Cell Phones & Accessories', 'Mobile Pouches'),
  ('Cell Phones & Accessories', 'Mobile Spare Parts'),
  ('Cell Phones & Accessories', 'Earphone Cable Organizers'),
  ('Cell Phones & Accessories', 'Mobile Cables'),
  ('Cell Phones & Accessories', 'Mobile Enhancements'),
  ('Cell Phones & Accessories', 'Anti Radiation Stickers & Chips'),
  ('Cell Phones & Accessories', 'Charging Pads'),
  ('Cell Phones & Accessories', 'Styling & Maintenance'),
  ('Cell Phones & Accessories', 'Selfie Sticks'),
  ('Cell Phones & Accessories', 'Power Bank Pouches'),
  ('Cell Phones & Accessories', 'Headphone Splitters'),
  ('Cell Phones & Accessories', 'Anti Dust Plugs'),
  ('Cell Phones & Accessories', 'Batteries'),
  ('Cell Phones & Accessories', 'Screen Guards'),
  ('Cell Phones & Accessories', 'Headphone Pouches & Cases'),
  ('Cell Phones & Accessories', 'Mobile Phone Lens'),
  ('Cell Phones & Accessories', 'Headphone Stands'),
  ('Cell Phones & Accessories', 'Cable Drop Clips'),
  ('Cell Phones & Accessories', 'Mobile Chargers'),
  ('Computers & Accessories', 'Computers'),
  ('Computers & Accessories', 'Laptop Accessories'),
  ('Video Projectors', 'Projectors')
)
SELECT n.sub_name, n.child_name,
       EXISTS (SELECT 1 FROM public.ccchild_categories c JOIN public.sssubcategories s ON s.id = c.subcategory_id
               WHERE s.name = n.sub_name AND c.name = n.child_name) AS already_exists
FROM new_children n
ORDER BY n.sub_name, n.child_name;

-- ===== 4) INSERT =====
WITH new_children(sub_name, child_name) AS (VALUES
  ('Cell Phones & Accessories', 'Mobiles'),
  ('Cell Phones & Accessories', 'Mobile Camera Lens Protectors'),
  ('Cell Phones & Accessories', 'Cases & Covers'),
  ('Cell Phones & Accessories', 'Power Banks'),
  ('Cell Phones & Accessories', 'Mobile Holders'),
  ('Cell Phones & Accessories', 'Mobile Flashes'),
  ('Cell Phones & Accessories', 'Mods'),
  ('Cell Phones & Accessories', 'Mobile Body Panels'),
  ('Cell Phones & Accessories', 'Mobile Battery'),
  ('Cell Phones & Accessories', 'Screen Expander For Phones'),
  ('Cell Phones & Accessories', 'Mobile Pouches'),
  ('Cell Phones & Accessories', 'Mobile Spare Parts'),
  ('Cell Phones & Accessories', 'Earphone Cable Organizers'),
  ('Cell Phones & Accessories', 'Mobile Cables'),
  ('Cell Phones & Accessories', 'Mobile Enhancements'),
  ('Cell Phones & Accessories', 'Anti Radiation Stickers & Chips'),
  ('Cell Phones & Accessories', 'Charging Pads'),
  ('Cell Phones & Accessories', 'Styling & Maintenance'),
  ('Cell Phones & Accessories', 'Selfie Sticks'),
  ('Cell Phones & Accessories', 'Power Bank Pouches'),
  ('Cell Phones & Accessories', 'Headphone Splitters'),
  ('Cell Phones & Accessories', 'Anti Dust Plugs'),
  ('Cell Phones & Accessories', 'Batteries'),
  ('Cell Phones & Accessories', 'Screen Guards'),
  ('Cell Phones & Accessories', 'Headphone Pouches & Cases'),
  ('Cell Phones & Accessories', 'Mobile Phone Lens'),
  ('Cell Phones & Accessories', 'Headphone Stands'),
  ('Cell Phones & Accessories', 'Cable Drop Clips'),
  ('Cell Phones & Accessories', 'Mobile Chargers'),
  ('Computers & Accessories', 'Computers'),
  ('Computers & Accessories', 'Laptop Accessories'),
  ('Video Projectors', 'Projectors')
)
INSERT INTO public.ccchild_categories (id, name, subcategory_id)
SELECT gen_random_uuid(), n.child_name, s.id
FROM new_children n
JOIN public.sssubcategories s ON s.name = n.sub_name
WHERE NOT EXISTS (
  SELECT 1 FROM public.ccchild_categories c
  WHERE c.subcategory_id = s.id AND c.name = n.child_name
)
RETURNING id, name, subcategory_id;