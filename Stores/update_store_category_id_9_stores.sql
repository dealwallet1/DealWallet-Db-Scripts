-- Task: set the correct category_id (parent category) for 9 stores.
-- stores.category_id points to parent_categories.id. Ids taken from parent_categories.csv.
--   Air Doctor, Vasustore        -> Health & Pharmacy
--   Colgate, Indulgeo Essentials -> Beauty & Personal Care
--   Della Adventure              -> Travel & Transportation
--   Flower Aura                  -> Retail & Shopping
--   Little Box India             -> Fashion & Lifestyle
--   Pot & Bloom                  -> Furniture & Home Decor
--   SonyLIV                      -> Entertainment & Subscriptions

-- 1) PREVIEW (expect 9 rows, each with a store id; a NULL store_id means the name did not match)
WITH fixes(store_name, category_id) AS (VALUES
  ('Air Doctor',          '5352c50c-a00f-4fa6-ad26-6ecec7e35d80'::uuid),
  ('Colgate',             '96b5c3bb-c9e4-4d0f-aaa7-975e6b0b48f5'::uuid),
  ('Della Adventure',     '32d9b7ab-1330-497b-ab05-276b80e7fdfe'::uuid),
  ('Flower Aura',         'a264cb33-226b-4495-8f78-d70a73c9f066'::uuid),
  ('Indulgeo Essentials', '96b5c3bb-c9e4-4d0f-aaa7-975e6b0b48f5'::uuid),
  ('Little Box India',    'adc60933-703a-4ba1-838f-dcf70e7b7cae'::uuid),
  ('Pot & Bloom',         '0774861f-0937-41d6-bda4-e7d9718c14d2'::uuid),
  ('SonyLIV',             'c76edd97-0d69-4f57-a311-96cf99b9ca91'::uuid),
  ('Vasustore',           '5352c50c-a00f-4fa6-ad26-6ecec7e35d80'::uuid)
)
SELECT f.store_name, s.id AS store_id, s.category_id AS old_category_id, f.category_id AS new_category_id
FROM fixes f
LEFT JOIN public.stores s ON LOWER(TRIM(s.name)) = LOWER(TRIM(f.store_name))
ORDER BY f.store_name;

-- 2) UPDATE (expect 9 rows)
WITH fixes(store_name, category_id) AS (VALUES
  ('Air Doctor',          '5352c50c-a00f-4fa6-ad26-6ecec7e35d80'::uuid),
  ('Colgate',             '96b5c3bb-c9e4-4d0f-aaa7-975e6b0b48f5'::uuid),
  ('Della Adventure',     '32d9b7ab-1330-497b-ab05-276b80e7fdfe'::uuid),
  ('Flower Aura',         'a264cb33-226b-4495-8f78-d70a73c9f066'::uuid),
  ('Indulgeo Essentials', '96b5c3bb-c9e4-4d0f-aaa7-975e6b0b48f5'::uuid),
  ('Little Box India',    'adc60933-703a-4ba1-838f-dcf70e7b7cae'::uuid),
  ('Pot & Bloom',         '0774861f-0937-41d6-bda4-e7d9718c14d2'::uuid),
  ('SonyLIV',             'c76edd97-0d69-4f57-a311-96cf99b9ca91'::uuid),
  ('Vasustore',           '5352c50c-a00f-4fa6-ad26-6ecec7e35d80'::uuid)
)
UPDATE public.stores s
SET category_id = f.category_id
FROM fixes f
WHERE LOWER(TRIM(s.name)) = LOWER(TRIM(f.store_name))
RETURNING s.id, s.name, s.category_id;