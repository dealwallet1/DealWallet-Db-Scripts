BEGIN;

WITH category_mapping(store_name, category_id) AS (
    VALUES
        ('Ourritual', '5352c50c-a00f-4fa6-ad26-6ecec7e35d80'::UUID), -- Health & Pharmacy
        ('Sparindia', '2db53905-91c9-4247-be3e-afcc4aec6112'::UUID), -- Groceries & Daily Essentials
        ('Aceblend', '5352c50c-a00f-4fa6-ad26-6ecec7e35d80'::UUID), -- Health & Pharmacy
        ('Muscletech', '51561884-f71d-4fb4-9c29-6aba2cf5406c'::UUID), -- Sports & Fitness
        ('Mother Sparsh', 'c741e857-9fc5-4f6f-a66c-2cfa9eed610e'::UUID), -- Baby & Kids
        ('Daily objects', '2afd57d6-c614-4482-b9f1-78bbba75d335'::UUID), -- Electronics & Technology
        ('Squarespace', '79f2782c-1b6d-40a0-a812-af097ef61a0e'::UUID), -- Software & Digital Services
        ('Rasayanam', '5352c50c-a00f-4fa6-ad26-6ecec7e35d80'::UUID), -- Health & Pharmacy
        ('Genspark', '79f2782c-1b6d-40a0-a812-af097ef61a0e'::UUID), -- Software & Digital Services
        ('Vaaree', '0774861f-0937-41d6-bda4-e7d9718c14d2'::UUID), -- Furniture & Home Decor
        ('Kerala Ayurveda', '5352c50c-a00f-4fa6-ad26-6ecec7e35d80'::UUID), -- Health & Pharmacy
        ('Proteition', '51561884-f71d-4fb4-9c29-6aba2cf5406c'::UUID), -- Sports & Fitness
        ('SciSpace', '79f2782c-1b6d-40a0-a812-af097ef61a0e'::UUID), -- Software & Digital Services
        ('Fytika', '5352c50c-a00f-4fa6-ad26-6ecec7e35d80'::UUID), -- Health & Pharmacy
        ('NYKD By Nykaa', 'adc60933-703a-4ba1-838f-dcf70e7b7cae'::UUID), -- Fashion & Lifestyle
        ('Fitspire', '51561884-f71d-4fb4-9c29-6aba2cf5406c'::UUID), -- Sports & Fitness
        ('Livspace', '0774861f-0937-41d6-bda4-e7d9718c14d2'::UUID), -- Furniture & Home Decor
        ('Fashiola', 'adc60933-703a-4ba1-838f-dcf70e7b7cae'::UUID), -- Fashion & Lifestyle
        ('Lifespan', '5352c50c-a00f-4fa6-ad26-6ecec7e35d80'::UUID), -- Health & Pharmacy
        ('Maspar', '0774861f-0937-41d6-bda4-e7d9718c14d2'::UUID), -- Furniture & Home Decor
        ('Cellspare', '2afd57d6-c614-4482-b9f1-78bbba75d335'::UUID), -- Electronics & Technology
        ('Healofy', 'c741e857-9fc5-4f6f-a66c-2cfa9eed610e'::UUID), -- Baby & Kids
        ('Victoria Secret', 'adc60933-703a-4ba1-838f-dcf70e7b7cae'::UUID), -- Fashion & Lifestyle
        ('Skore Condoms', '5352c50c-a00f-4fa6-ad26-6ecec7e35d80'::UUID) -- Health & Pharmacy
)
UPDATE public.stores AS s
SET category_id = cm.category_id
FROM category_mapping AS cm
WHERE LOWER(TRIM(s.name)) = LOWER(TRIM(cm.store_name))
  AND s.category_id IS DISTINCT FROM cm.category_id
RETURNING
    s.id,
    s.name,
    s.category_id;

-- Review the returned rows.
-- COMMIT;
-- ROLLBACK;