-- 1) Preview (expect 7 rows; more if a name has duplicates)
SELECT id, name, store_id
FROM public.products
WHERE store_id = 'ce25f4d7-bf28-4453-a927-daf2bdf6ab6d'
  AND name IN (
    'Radiance D-Tan Face Wash + Radiance D-Tan Face Scrub Combo',
    'Glopure Lightening Scrub 120 gm + Glopure Lightening Facewash 120 gm Combo',
    'WINTER ESSENTIAL COMBO 4',
    'Phytonight Night Cream and Phytolight Day Cream Combo',
    'Papayaclean Anti Blemish Face Wash + Papaya Cleansing Bar Combo',
    'WINTER ESSENTIAL COMBO 1',
    'WINTER ESSENTIAL COMBO 3'
  );

-- 2) Delete price_history of these products
DELETE FROM public.price_history
WHERE product_id IN (
  SELECT id FROM public.products
  WHERE store_id = 'ce25f4d7-bf28-4453-a927-daf2bdf6ab6d'
    AND name IN (
      'Radiance D-Tan Face Wash + Radiance D-Tan Face Scrub Combo',
      'Glopure Lightening Scrub 120 gm + Glopure Lightening Facewash 120 gm Combo',
      'WINTER ESSENTIAL COMBO 4',
      'Phytonight Night Cream and Phytolight Day Cream Combo',
      'Papayaclean Anti Blemish Face Wash + Papaya Cleansing Bar Combo',
      'WINTER ESSENTIAL COMBO 1',
      'WINTER ESSENTIAL COMBO 3'
    )
);

-- 3) Delete the products
DELETE FROM public.products
WHERE store_id = 'ce25f4d7-bf28-4453-a927-daf2bdf6ab6d'
  AND name IN (
    'Radiance D-Tan Face Wash + Radiance D-Tan Face Scrub Combo',
    'Glopure Lightening Scrub 120 gm + Glopure Lightening Facewash 120 gm Combo',
    'WINTER ESSENTIAL COMBO 4',
    'Phytonight Night Cream and Phytolight Day Cream Combo',
    'Papayaclean Anti Blemish Face Wash + Papaya Cleansing Bar Combo',
    'WINTER ESSENTIAL COMBO 1',
    'WINTER ESSENTIAL COMBO 3'
  )
RETURNING id, name;