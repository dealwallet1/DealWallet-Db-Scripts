-- Delete unwanted stores. Run section by section.
-- Reasons: Ajiogram (site deleted), Knowfashionstyle (foreign site), Sparrods & Co (US-based site),
-- Lenovo Pro Business (Lenovo already exists -> move data, then delete), Baggit (site stopped),
-- Watcho (irrelevant), PassPack (unwanted), Aks Clothing (site stopped)

-- ===== 1) PREVIEW: stores + coupons + products count (kosam check chey) =====
SELECT s.id, s.name,
  (SELECT COUNT(*) FROM public.cue_coupons c WHERE c.store_id = s.id) AS coupons,
  (SELECT COUNT(*) FROM public.products p WHERE p.store_id = s.id)   AS products
FROM public.stores s
WHERE s.name ILIKE ANY (ARRAY['AJIOGRAM','Knowfashionstyle','Sparrods%','Lenovo Pro Business','Baggit','Watcho','PassPack','Aks Clothing'])
   OR s.name ILIKE 'Lenovo'
ORDER BY s.name;
-- 'Lenovo' row okkate undali (canonical store). Rendu unte, step 2 mundu aapi naku cheppu.

-- ===== 2) Lenovo Pro Business: coupons + products ni Lenovo store ki move =====
UPDATE public.cue_coupons
SET store_id = (SELECT id FROM public.stores WHERE name ILIKE 'Lenovo'),
    company_name = 'Lenovo'
WHERE store_id IN (SELECT id FROM public.stores WHERE name ILIKE 'Lenovo Pro Business');

UPDATE public.products
SET store_id = (SELECT id FROM public.stores WHERE name ILIKE 'Lenovo')
WHERE store_id IN (SELECT id FROM public.stores WHERE name ILIKE 'Lenovo Pro Business');

-- ===== 3) DELETE (dependents first) =====
DELETE FROM public.price_history
WHERE product_id IN (
  SELECT p.id FROM public.products p
  WHERE p.store_id IN (SELECT id FROM public.stores WHERE name ILIKE ANY (ARRAY['AJIOGRAM','Knowfashionstyle','Sparrods%','Lenovo Pro Business','Baggit','Watcho','PassPack','Aks Clothing']))
);

DELETE FROM public.products
WHERE store_id IN (SELECT id FROM public.stores WHERE name ILIKE ANY (ARRAY['AJIOGRAM','Knowfashionstyle','Sparrods%','Lenovo Pro Business','Baggit','Watcho','PassPack','Aks Clothing']));

DELETE FROM public.cue_coupons
WHERE store_id IN (SELECT id FROM public.stores WHERE name ILIKE ANY (ARRAY['AJIOGRAM','Knowfashionstyle','Sparrods%','Lenovo Pro Business','Baggit','Watcho','PassPack','Aks Clothing']));

DELETE FROM public.stores
WHERE name ILIKE ANY (ARRAY['AJIOGRAM','Knowfashionstyle','Sparrods%','Lenovo Pro Business','Baggit','Watcho','PassPack','Aks Clothing'])
RETURNING id, name;
-- Expect 8 rows.