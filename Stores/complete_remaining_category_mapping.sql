-- -- =====================================================================
-- -- 1. BAGS, WALLETS & BELTS (Parent: c054b069-afe6-4c86-b46c-1d4c0f1adc86)
-- -- =====================================================================
-- -- 1a. Backpacks
-- UPDATE products
-- SET sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272', -- Bags & Backpacks
--     ccchild_category_id = '32d541ca-7da7-4887-843a-d7bd57f1d2b6' -- Backpacks
-- WHERE ppparent_category_id = 'c054b069-afe6-4c86-b46c-1d4c0f1adc86'
--   AND name ILIKE '%backpack%';
-- -- 1b. Laptop Bags & Sleeves
-- UPDATE products
-- SET sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272', -- Bags & Backpacks
--     ccchild_category_id = '21db51be-6c5d-4ad9-b710-51584bf3a912' -- Laptop Bags
-- WHERE ppparent_category_id = 'c054b069-afe6-4c86-b46c-1d4c0f1adc86'
--   AND (name ILIKE '%laptop bag%' OR name ILIKE '%laptop sleeve%');
-- -- 1c. Sling & Crossbody Bags
-- UPDATE products
-- SET sssubcategory_id = '4061dee1-e26c-46e0-8460-48ed78dff21c', -- Handbags & Clutches
--     ccchild_category_id = 'c0a83bff-0ace-4a82-93bb-58cc3e59386e' -- Sling Bags
-- WHERE ppparent_category_id = 'c054b069-afe6-4c86-b46c-1d4c0f1adc86'
--   AND (name ILIKE '%sling%' OR name ILIKE '%cross body%' OR name ILIKE '%crossbody%');
-- -- 1d. Tote Bags
-- UPDATE products
-- SET sssubcategory_id = '4061dee1-e26c-46e0-8460-48ed78dff21c', -- Handbags & Clutches
--     ccchild_category_id = 'ec5f1e1c-1d4c-4138-8fff-93d449325a9d' -- Totes
-- WHERE ppparent_category_id = 'c054b069-afe6-4c86-b46c-1d4c0f1adc86'
--   AND name ILIKE '%tote%';
-- -- 1e. Handbags & Satchels
-- UPDATE products
-- SET sssubcategory_id = '4061dee1-e26c-46e0-8460-48ed78dff21c', -- Handbags & Clutches
--     ccchild_category_id = '596912f4-517a-49b1-be15-2504b88adb7d' -- Handbags
-- WHERE ppparent_category_id = 'c054b069-afe6-4c86-b46c-1d4c0f1adc86'
--   AND (name ILIKE '%handbag%' OR name ILIKE '%hand bag%' OR name ILIKE '%satchel%');
-- -- 1f. Clutches
-- UPDATE products
-- SET sssubcategory_id = '4061dee1-e26c-46e0-8460-48ed78dff21c', -- Handbags & Clutches
--     ccchild_category_id = 'b5c6906f-10a2-4ae6-9415-8f9fe6a3ef9c' -- Clutches
-- WHERE ppparent_category_id = 'c054b069-afe6-4c86-b46c-1d4c0f1adc86'
--   AND name ILIKE '%clutch%';
-- -- 1g. Luggage & Trolleys
-- UPDATE products
-- SET sssubcategory_id = '0820f72e-e043-470a-a388-beb4756a4d2e', -- Luggage & Travel
--     ccchild_category_id = '01479bb0-d402-433c-8b48-cc8bb5b036ff' -- Suitcases
-- WHERE ppparent_category_id = 'c054b069-afe6-4c86-b46c-1d4c0f1adc86'
--   AND (name ILIKE '%trolley%' OR name ILIKE '%suitcase%' OR name ILIKE '%luggage%');
-- -- 1h. Duffel Bags & Gym Bags
-- UPDATE products
-- SET sssubcategory_id = '0820f72e-e043-470a-a388-beb4756a4d2e', -- Luggage & Travel
--     ccchild_category_id = '22645e95-c331-4663-9e36-0198956e85d4' -- Duffel Bags
-- WHERE ppparent_category_id = 'c054b069-afe6-4c86-b46c-1d4c0f1adc86'
--   AND (name ILIKE '%duffel%' OR name ILIKE '%duffle%' OR name ILIKE '%gym bag%');
-- -- 1i. Wallets
-- UPDATE products
-- SET sssubcategory_id = '8013ea30-416a-4f7c-9225-9c3eb4ca7ab0', -- Wallets & Clutches
--     ccchild_category_id = '18ac5107-8889-431f-96a1-d6278ef9365e' -- Wallets
-- WHERE ppparent_category_id = 'c054b069-afe6-4c86-b46c-1d4c0f1adc86'
--   AND (name ILIKE '%wallet%' OR name ILIKE '%card holder%');
-- -- 1j. Travel Accessories Residual
-- UPDATE products
-- SET sssubcategory_id = '0820f72e-e043-470a-a388-beb4756a4d2e' -- Luggage & Travel
-- WHERE ppparent_category_id = 'c054b069-afe6-4c86-b46c-1d4c0f1adc86'
--   AND (categories_id IN (SELECT id FROM categories WHERE name ILIKE 'Travel Accessories') OR name ILIKE '%travel%');
-- -- 1k. Remaining Bags Residual
-- UPDATE products
-- SET sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272' -- Bags & Backpacks
-- WHERE ppparent_category_id = 'c054b069-afe6-4c86-b46c-1d4c0f1adc86'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 2. BEAUTY & PERSONAL CARE (Parent: 13e215fe-187e-4c31-a5ae-3529c56510fe)
-- -- =====================================================================
-- -- 2a. Makeup
-- UPDATE products
-- SET sssubcategory_id = 'f17cd04e-15d2-411f-bf56-702a70464b24' -- Makeup
-- WHERE ppparent_category_id = '13e215fe-187e-4c31-a5ae-3529c56510fe'
--   AND (categories_id IN (SELECT id FROM categories WHERE name ILIKE 'Makeup')
--        OR name ILIKE '%lipstick%' OR name ILIKE '%kajal%' OR name ILIKE '%eyeliner%' OR name ILIKE '%foundation%' OR name ILIKE '%mascara%' OR name ILIKE '%makeup%');
-- -- 2b. Hair Care
-- UPDATE products
-- SET sssubcategory_id = '78573a14-0842-4b70-85a3-6c51f3cfa88f' -- Hair Care Products
-- WHERE ppparent_category_id = '13e215fe-187e-4c31-a5ae-3529c56510fe'
--   AND (name ILIKE '%shampoo%' OR name ILIKE '%conditioner%' OR name ILIKE '%hair oil%' OR name ILIKE '%hair serum%' OR name ILIKE '%hair%');
-- -- 2c. Perfumes & Fragrances
-- UPDATE products
-- SET sssubcategory_id = '5b355500-e423-4593-8549-1a578357c2e4' -- Perfumes & Fragrances
-- WHERE ppparent_category_id = '13e215fe-187e-4c31-a5ae-3529c56510fe'
--   AND (name ILIKE '%perfume%' OR name ILIKE '%deodorant%' OR name ILIKE '%fragrance%' OR name ILIKE '%body mist%' OR name ILIKE '%eau de%');
-- -- 2d. Skin Care Residual
-- UPDATE products
-- SET sssubcategory_id = 'e753d52d-9a52-4cb7-9d12-b2475242dd96' -- Skin Care Products
-- WHERE ppparent_category_id = '13e215fe-187e-4c31-a5ae-3529c56510fe'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 3. HOME & KITCHEN (Parent: 8daa0caa-18c8-4f82-9cae-e91571a7635b)
-- -- =====================================================================
-- -- 3a. Furniture
-- UPDATE products
-- SET sssubcategory_id = '2fd17725-ea85-4ae8-b0ba-79db7683907f' -- Furniture
-- WHERE ppparent_category_id = '8daa0caa-18c8-4f82-9cae-e91571a7635b'
--   AND (categories_id IN (SELECT id FROM categories WHERE name ILIKE 'Furniture')
--        OR name ILIKE '%sofa%' OR name ILIKE '%chair%' OR name ILIKE '%table%' OR name ILIKE '%bed%' OR name ILIKE '%wardrobe%' OR name ILIKE '%furniture%');
-- -- 3b. Home Decor
-- UPDATE products
-- SET sssubcategory_id = '5f79ed1d-c984-4ea0-820d-e1c839887fde' -- Home Décor Products
-- WHERE ppparent_category_id = '8daa0caa-18c8-4f82-9cae-e91571a7635b'
--   AND (categories_id IN (SELECT id FROM categories WHERE name ILIKE 'Home Decor' OR name ILIKE 'Home Decor & Festive Needs')
--        OR name ILIKE '%curtain%' OR name ILIKE '%clock%' OR name ILIKE '%cushion%' OR name ILIKE '%vase%' OR name ILIKE '%lamp%' OR name ILIKE '%wall art%');
-- -- 3c. Kitchen & Dining Residual
-- UPDATE products
-- SET sssubcategory_id = 'ef149bfa-03ee-4f53-8d4b-e71ff45c09d2' -- Kitchen & Dining
-- WHERE ppparent_category_id = '8daa0caa-18c8-4f82-9cae-e91571a7635b'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 4. CLOTHING, SHOES & JEWELRY (Parent: c0d07fed-3247-49b5-a45e-3a0dcb6b24ae)
-- -- =====================================================================
-- -- 4a. Footwear & Shoes
-- UPDATE products
-- SET sssubcategory_id = 'bd39bb29-a41b-42fc-bf11-b2680c77296b' -- Baby Clothing & Shoes
-- WHERE ppparent_category_id = 'c0d07fed-3247-49b5-a45e-3a0dcb6b24ae'
--   AND (name ILIKE '%shoe%' OR name ILIKE '%sneaker%' OR name ILIKE '%sandal%' OR name ILIKE '%heel%' OR name ILIKE '%boot%'
--        OR categories_id IN (SELECT id FROM categories WHERE name ILIKE 'Shoes'));
-- -- 4b. Clothing & Apparel Residual
-- UPDATE products
-- SET sssubcategory_id = '51b545e0-35b3-486b-b4a4-ee4601a1b24f' -- Novelty & More
-- WHERE ppparent_category_id = 'c0d07fed-3247-49b5-a45e-3a0dcb6b24ae'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 5. HEALTH CARE (Parent: 6ac1af84-c8ce-46cd-9ab5-6528e69f8159)
-- -- =====================================================================
-- -- 5a. Supplements & Nutrition
-- UPDATE products
-- SET sssubcategory_id = '2e7228b2-d316-47ac-940c-3b9f419b6d8b' -- Health Supplements
-- WHERE ppparent_category_id = '6ac1af84-c8ce-46cd-9ab5-6528e69f8159'
--   AND (categories_id IN (SELECT id FROM categories WHERE name ILIKE 'Nutrition Supplements')
--        OR name ILIKE '%supplement%' OR name ILIKE '%protein%' OR name ILIKE '%vitamin%');
-- -- 5b. Home Medical Supplies Residual
-- UPDATE products
-- SET sssubcategory_id = '4097634d-fea6-47d4-8fd7-d39d91be35d0' -- Home Medical Supplies
-- WHERE ppparent_category_id = '6ac1af84-c8ce-46cd-9ab5-6528e69f8159'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 6. APPLIANCES (Parent: d520b234-4de6-478a-9a35-855d42d41ac3)
-- -- =====================================================================
-- -- 6a. Refrigerators
-- UPDATE products
-- SET sssubcategory_id = '9d5abb28-2079-41c1-a119-2977d8bb8a8d' -- Refrigerators
-- WHERE ppparent_category_id = 'd520b234-4de6-478a-9a35-855d42d41ac3'
--   AND (name ILIKE '%refrigerator%' OR name ILIKE '%fridge%');
-- -- 6b. Washers & Dryers
-- UPDATE products
-- SET sssubcategory_id = '7764724b-4fb7-4783-a540-6aff3353f912' -- Washers & Dryers
-- WHERE ppparent_category_id = 'd520b234-4de6-478a-9a35-855d42d41ac3'
--   AND (name ILIKE '%washing machine%' OR name ILIKE '%washer%' OR name ILIKE '%dryer%');
-- -- 6c. Cooktops Residual
-- UPDATE products
-- SET sssubcategory_id = '51b63009-8187-4318-8651-17f64076499c' -- Cooktops
-- WHERE ppparent_category_id = 'd520b234-4de6-478a-9a35-855d42d41ac3'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 7. COMPUTERS (Parent: 19dc79fe-2234-4c7e-b48a-b1a8562cb6a2)
-- -- =====================================================================
-- -- 7a. Laptops
-- UPDATE products
-- SET sssubcategory_id = '305cc5c2-830b-4acd-b202-02b5e89975aa' -- Laptops
-- WHERE ppparent_category_id = '19dc79fe-2234-4c7e-b48a-b1a8562cb6a2'
--   AND (name ILIKE '%laptop%' OR name ILIKE '%notebook%');
-- -- 7b. Peripherals Residual
-- UPDATE products
-- SET sssubcategory_id = 'f8694feb-4bce-4754-bad8-00dbe1a751df' -- Computer Peripherals
-- WHERE ppparent_category_id = '19dc79fe-2234-4c7e-b48a-b1a8562cb6a2'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 8. BABY (Parent: a72f133f-4f80-4469-b8ff-2ebd14679f84)
-- -- =====================================================================
-- -- 8a. Diapering
-- UPDATE products
-- SET sssubcategory_id = '66e665f7-82b3-4119-9c35-0d6817a78f6d' -- Baby Diapering Products
-- WHERE ppparent_category_id = 'a72f133f-4f80-4469-b8ff-2ebd14679f84'
--   AND (name ILIKE '%diaper%' OR name ILIKE '%wipe%');
-- -- 8b. Feeding
-- UPDATE products
-- SET sssubcategory_id = '7becea35-7029-4a7b-8d5b-9c532e17194c' -- Baby & Toddler Feeding Supplies
-- WHERE ppparent_category_id = 'a72f133f-4f80-4469-b8ff-2ebd14679f84'
--   AND (name ILIKE '%feed%' OR name ILIKE '%bottle%');
-- -- 8c. Baby Care Residual
-- UPDATE products
-- SET sssubcategory_id = 'e357b6a9-b9ea-42dd-ae72-356743e03622' -- Baby Care Products
-- WHERE ppparent_category_id = 'a72f133f-4f80-4469-b8ff-2ebd14679f84'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 9. PET SUPPLIES (Parent: 6c20eb50-4052-4779-93ad-9a281b30b101)
-- -- =====================================================================
-- -- 9a. Dog Supplies
-- UPDATE products
-- SET sssubcategory_id = '7af3b0d7-7928-4786-8f7f-294c6b391134' -- Dog Supplies
-- WHERE ppparent_category_id = '6c20eb50-4052-4779-93ad-9a281b30b101'
--   AND (name ILIKE '%dog%' OR name ILIKE '%puppy%');
-- -- 9b. Cat Supplies Residual
-- UPDATE products
-- SET sssubcategory_id = 'b41504a6-4fce-49d8-941e-d4aa70ff31b7' -- Cat Supplies
-- WHERE ppparent_category_id = '6c20eb50-4052-4779-93ad-9a281b30b101'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 10. SPORTS & OUTDOORS (Parent: f0669f68-75cb-4ee8-890d-2b97f6ff3ec0)
-- -- =====================================================================
-- UPDATE products
-- SET sssubcategory_id = 'ecd895e1-bbf6-44dc-83c6-23febf59de7b' -- Exercise & Fitness Equipment
-- WHERE ppparent_category_id = 'f0669f68-75cb-4ee8-890d-2b97f6ff3ec0'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 11. GROCERY (Parent: 21473b56-469b-4536-80d0-12b38f918fa0)
-- -- =====================================================================
-- UPDATE products
-- SET sssubcategory_id = 'ecddfab7-04c0-49ed-b74a-5db881214fe7' -- Snacks & Beverages
-- WHERE ppparent_category_id = '21473b56-469b-4536-80d0-12b38f918fa0'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 12. AUTOMOTIVE ACCESSORIES (Parent: f54c3b3d-398f-40fb-a1d2-09435dfcc920)
-- -- =====================================================================
-- UPDATE products
-- SET sssubcategory_id = 'fa5105c5-1219-415c-b810-f7b6366e5939' -- Car & Bike Accessories
-- WHERE ppparent_category_id = 'f54c3b3d-398f-40fb-a1d2-09435dfcc920'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 13. FOOD & NUTRITION (Parent: 3df55772-533b-4937-aec4-aacc40650e48)
-- -- =====================================================================
-- UPDATE products
-- SET sssubcategory_id = 'd9e41df7-b302-4799-beab-bda30d8682d8' -- Food Combo
-- WHERE ppparent_category_id = '3df55772-533b-4937-aec4-aacc40650e48'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 14. TOYS & GAMES (Parent: 1b72ed15-669f-466d-9354-7515fda8e4b7)
-- -- =====================================================================
-- UPDATE products
-- SET sssubcategory_id = '5cefbbc7-8136-479d-9ec4-9482c36921ae' -- Learning and Educational Toys
-- WHERE ppparent_category_id = '1b72ed15-669f-466d-9354-7515fda8e4b7'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 15. GAMING (Parent: 498498b5-0e9f-461a-88b9-8948e37e0a3e)
-- -- =====================================================================
-- UPDATE products
-- SET sssubcategory_id = '958a61d1-8e25-4dc5-a827-4a668e2f9392' -- Games
-- WHERE ppparent_category_id = '498498b5-0e9f-461a-88b9-8948e37e0a3e'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 16. MOBILES & ACCESSORIES (Parent: fee63a2b-3522-4a01-b2c9-5e18e199e093)
-- -- =====================================================================
-- -- 16a. Mobiles
-- UPDATE products
-- SET sssubcategory_id = '6e27c0ab-9372-43c0-a899-d628fd3311b3' -- Mobiles
-- WHERE ppparent_category_id = 'fee63a2b-3522-4a01-b2c9-5e18e199e093'
--   AND (name ILIKE '%phone%' OR name ILIKE '%smartphone%' OR name ILIKE '%iphone%' OR name ILIKE '%samsung galaxy%' OR name ILIKE '%redmi%');
-- -- 16b. Mobile Accessories Residual
-- UPDATE products
-- SET sssubcategory_id = '8b8a2f36-b718-4ea1-be98-5c06af17481d' -- Mobile Accessories
-- WHERE ppparent_category_id = 'fee63a2b-3522-4a01-b2c9-5e18e199e093'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 17. ELECTRONICS RESIDUAL (Parent: 2cbf83ce-514b-4def-948f-b25c2f2637c3)
-- -- =====================================================================
-- UPDATE products
-- SET sssubcategory_id = '0142b3fe-5f2a-4915-9aaf-19c7c90a1d34' -- Portable Audio & Video
-- WHERE ppparent_category_id = '2cbf83ce-514b-4def-948f-b25c2f2637c3'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 18. WOMEN'S FASHION RESIDUAL (Parent: 302845a7-945f-44f1-95b2-6e6f58d12cab)
-- -- =====================================================================
-- UPDATE products
-- SET sssubcategory_id = '82aded1f-96ae-484e-aa15-55386f549747' -- Shop All Ethnic Wear
-- WHERE ppparent_category_id = '302845a7-945f-44f1-95b2-6e6f58d12cab'
--   AND sssubcategory_id IS NULL;
-- -- =====================================================================
-- -- 19. MEN'S FASHION RESIDUAL (Parent: d09ed32d-de18-4f82-9a54-5cc7c7760763)
-- -- =====================================================================
-- UPDATE products
-- SET sssubcategory_id = 'c1441f29-710a-4c0e-93be-dfc689337c26' -- Tops
-- WHERE ppparent_category_id = 'd09ed32d-de18-4f82-9a54-5cc7c7760763'
--   AND sssubcategory_id IS NULL;


SELECT 
  p.name AS parent_name,
  COUNT(pr.id) AS total_deals,
  COUNT(pr.sssubcategory_id) AS with_subcategory,
  COUNT(CASE WHEN pr.sssubcategory_id IS NULL THEN 1 END) AS missing_subcategory
FROM products pr
JOIN ppparent_categories p ON pr.ppparent_category_id = p.id
WHERE pr.discount >= 0
GROUP BY p.name
ORDER BY missing_subcategory DESC;



-- Create subcategory under parent Gifts
INSERT INTO sssubcategories (id, name, parent_category_id, description)
VALUES ('c08a7cde-3780-4799-8568-70e667741b66', 'Gifts & Festive Gifting', 'c08a7cde-3780-4799-8568-70e667741b65', 'Gifts and festive celebration items')
ON CONFLICT (id) DO NOTHING;
-- Map residual Gifts products
UPDATE products
SET sssubcategory_id = 'c08a7cde-3780-4799-8568-70e667741b66'
WHERE ppparent_category_id = 'c08a7cde-3780-4799-8568-70e667741b65'
  AND sssubcategory_id IS NULL;


BEGIN;
-- 1. Map Messenger Bags & Briefcases
UPDATE products
SET ccchild_category_id = '17af5fbf-79b6-446c-a41b-32f5a8a694f8' -- Messenger Bags
WHERE sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272'
  AND ccchild_category_id IS NULL
  AND (name ILIKE '%messenger%' OR name ILIKE '%briefcase%' OR name ILIKE '%office bag%');
-- 2. Map Waist Bags & Fanny Packs
UPDATE products
SET ccchild_category_id = 'ac7fdc1d-0c79-40e1-a93f-b6149e0a3142' -- Waist Bags
WHERE sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272'
  AND ccchild_category_id IS NULL
  AND (name ILIKE '%waist%' OR name ILIKE '%fanny%' OR name ILIKE '%hip pack%');
-- 3. Map Gym & Sports Bags
UPDATE products
SET ccchild_category_id = '6964f4ec-6da3-42fc-825a-4dfb455c0992' -- Gym Bags
WHERE sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272'
  AND ccchild_category_id IS NULL
  AND (name ILIKE '%gym%' OR name ILIKE '%duffel%' OR name ILIKE '%duffle%');
-- 4. Reassign misplaced Cabin Trolleys/Suitcases to Luggage & Travel -> Suitcases
UPDATE products
SET sssubcategory_id = '0820f72e-e043-470a-a388-beb4756a4d2e', -- Luggage & Travel
    ccchild_category_id = '01479bb0-d402-433c-8b48-cc8bb5b036ff' -- Suitcases
WHERE sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272'
  AND ccchild_category_id IS NULL
  AND (name ILIKE '%cabin%' OR name ILIKE '%trolley%' OR name ILIKE '%suitcase%' OR name ILIKE '%luggage%'
       OR ((name ILIKE '%skybags%' OR name ILIKE '%safari%' OR name ILIKE '%kamiliant%' OR name ILIKE '%american tourister%')
           AND (name ILIKE '%large%' OR name ILIKE '%medium%' OR name ILIKE '%small%')));
-- 5. Reassign misplaced Shoulder Bags to Handbags & Clutches -> Handbags
UPDATE products
SET sssubcategory_id = '4061dee1-e26c-46e0-8460-48ed78dff21c', -- Handbags & Clutches
    ccchild_category_id = '596912f4-517a-49b1-be15-2504b88adb7d' -- Handbags
WHERE sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272'
  AND ccchild_category_id IS NULL
  AND (name ILIKE '%shoulder bag%' OR name ILIKE '%bucket bag%' OR name ILIKE '%moon bag%');
-- 6. Map School/College/Rucksacks to Backpacks
UPDATE products
SET ccchild_category_id = '32d541ca-7da7-4887-843a-d7bd57f1d2b6' -- Backpacks
WHERE sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272'
  AND ccchild_category_id IS NULL
  AND (name ILIKE '%school%' OR name ILIKE '%college%' OR name ILIKE '%rucksack%' OR name ILIKE '%daypack%');
-- 7. Create Travel & Utility Bags child category for all other bags
INSERT INTO ccchild_categories (id, name, subcategory_id, description)
VALUES ('30f4d773-62f0-4fc9-b3cc-c9b4ed713299', 'Travel & Utility Bags', '30f4d773-62f0-4fc9-b3cc-c9b4ed713272', 'Travel, lunch, and multi-utility bags')
ON CONFLICT (id) DO NOTHING;
-- 8. Map all remaining unassigned bags to Travel & Utility Bags
UPDATE products
SET ccchild_category_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713299' -- Travel & Utility Bags
WHERE sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272'
  AND ccchild_category_id IS NULL;
COMMIT;




BEGIN;
-- =============================================================================
-- PART 1: BAGS, WALLETS & BELTS (Fixes 1,023 vs 567 discrepancy)
-- =============================================================================
-- 1.1 Map Messenger Bags & Briefcases
UPDATE products
SET ccchild_category_id = '17af5fbf-79b6-446c-a41b-32f5a8a694f8' -- Messenger Bags
WHERE sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272'
  AND ccchild_category_id IS NULL
  AND (name ILIKE '%messenger%' OR name ILIKE '%briefcase%');
-- 1.2 Map Waist Bags & Fanny Packs
UPDATE products
SET ccchild_category_id = 'ac7fdc1d-0c79-40e1-a93f-b6149e0a3142' -- Waist Bags
WHERE sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272'
  AND ccchild_category_id IS NULL
  AND (name ILIKE '%waist%' OR name ILIKE '%fanny%' OR name ILIKE '%hip pack%');
-- 1.3 Map Gym Bags
UPDATE products
SET ccchild_category_id = '6964f4ec-6da3-42fc-825a-4dfb455c0992' -- Gym Bags
WHERE sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272'
  AND ccchild_category_id IS NULL
  AND name ILIKE '%gym%';
-- 1.4 Reassign misplaced Suitcases/Trolleys to Luggage & Travel -> Suitcases
UPDATE products
SET sssubcategory_id = '0820f72e-e043-470a-a388-beb4756a4d2e', -- Luggage & Travel
    ccchild_category_id = '01479bb0-d402-433c-8b48-cc8bb5b036ff' -- Suitcases
WHERE sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272'
  AND ccchild_category_id IS NULL
  AND (name ILIKE '%trolley%' OR name ILIKE '%luggage%' OR name ILIKE '%suitcase%' OR name ILIKE '%cabin%'
       OR (name ILIKE '%skybags%' AND (name ILIKE '%large%' OR name ILIKE '%medium%' OR name ILIKE '%small%')));
-- 1.5 Reassign misplaced Shoulder Bags to Handbags & Clutches -> Handbags
UPDATE products
SET sssubcategory_id = '4061dee1-e26c-46e0-8460-48ed78dff21c', -- Handbags & Clutches
    ccchild_category_id = '596912f4-517a-49b1-be15-2504b88adb7d' -- Handbags
WHERE sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272'
  AND ccchild_category_id IS NULL
  AND (name ILIKE '%shoulder bag%' OR name ILIKE '%bucket bag%' OR name ILIKE '%moon bag%');
-- 1.6 Map School/College/Rucksacks to Backpacks
UPDATE products
SET ccchild_category_id = '32d541ca-7da7-4887-843a-d7bd57f1d2b6' -- Backpacks
WHERE sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272'
  AND ccchild_category_id IS NULL
  AND (name ILIKE '%school%' OR name ILIKE '%college%' OR name ILIKE '%rucksack%' OR name ILIKE '%daypack%');
-- 1.7 Create Travel & Utility Bags child category and map remaining
INSERT INTO ccchild_categories (id, name, subcategory_id, description)
VALUES ('30f4d773-62f0-4fc9-b3cc-c9b4ed713299', 'Travel & Utility Bags', '30f4d773-62f0-4fc9-b3cc-c9b4ed713272', 'Travel and multi-utility bags')
ON CONFLICT (id) DO NOTHING;
UPDATE products
SET ccchild_category_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713299'
WHERE sssubcategory_id = '30f4d773-62f0-4fc9-b3cc-c9b4ed713272'
  AND ccchild_category_id IS NULL;
-- 1.8 Luggage & Travel residual
UPDATE products
SET ccchild_category_id = '01479bb0-d402-433c-8b48-cc8bb5b036ff' -- Suitcases
WHERE sssubcategory_id = '0820f72e-e043-470a-a388-beb4756a4d2e'
  AND ccchild_category_id IS NULL
  AND (name ILIKE '%suitcase%' OR name ILIKE '%trolley%' OR name ILIKE '%luggage%');
UPDATE products
SET ccchild_category_id = '9e1743cc-aef3-4385-a8a6-cefdc639fb6b' -- Travel Accessories (fallback)
WHERE sssubcategory_id = '0820f72e-e043-470a-a388-beb4756a4d2e'
  AND ccchild_category_id IS NULL;
-- =============================================================================
-- PART 2: BEAUTY & PERSONAL CARE (Makeup, Skin Care, Hair Care, Fragrance)
-- =============================================================================
-- 2.1 MAKEUP (Subcategory: f17cd04e-15d2-411f-bf56-702a70464b24)
UPDATE products SET ccchild_category_id = 'f6ad8df3-fbce-5f02-9d95-b81a51e01a8d' -- Lip Makeup
WHERE sssubcategory_id = 'f17cd04e-15d2-411f-bf56-702a70464b24' AND ccchild_category_id IS NULL
  AND (name ILIKE '%lip%' OR name ILIKE '%lipstick%');
UPDATE products SET ccchild_category_id = 'b8bbb53e-b257-55f1-9a57-f21d4f7ab033' -- Eye Makeup
WHERE sssubcategory_id = 'f17cd04e-15d2-411f-bf56-702a70464b24' AND ccchild_category_id IS NULL
  AND (name ILIKE '%eye%' OR name ILIKE '%mascara%' OR name ILIKE '%liner%' OR name ILIKE '%kajal%' OR name ILIKE '%brow%');
UPDATE products SET ccchild_category_id = 'ad022ec4-a765-40a2-961c-c4f69f52f369' -- Nails
WHERE sssubcategory_id = 'f17cd04e-15d2-411f-bf56-702a70464b24' AND ccchild_category_id IS NULL
  AND (name ILIKE '%nail%' OR name ILIKE '%polish%');
UPDATE products SET ccchild_category_id = 'f0e300d1-dc1a-4113-aa29-a559a66bce8b' -- Makeup Kits
WHERE sssubcategory_id = 'f17cd04e-15d2-411f-bf56-702a70464b24' AND ccchild_category_id IS NULL
  AND (name ILIKE '%kit%' OR name ILIKE '%palette%' OR name ILIKE '%combo%');
UPDATE products SET ccchild_category_id = '7dc6f06c-45e1-45b5-b7ca-d18a2424a7e0' -- Makeup Accessories
WHERE sssubcategory_id = 'f17cd04e-15d2-411f-bf56-702a70464b24' AND ccchild_category_id IS NULL
  AND (name ILIKE '%brush%' OR name ILIKE '%puff%' OR name ILIKE '%sponge%' OR name ILIKE '%blender%');
UPDATE products SET ccchild_category_id = 'b1580ea7-4191-59d9-a582-a863cbacd99b' -- Face Makeup (fallback)
WHERE sssubcategory_id = 'f17cd04e-15d2-411f-bf56-702a70464b24' AND ccchild_category_id IS NULL;
-- 2.2 SKIN CARE (Subcategory: e753d52d-9a52-4cb7-9d12-b2475242dd96)
UPDATE products SET ccchild_category_id = 'faf8b02c-ed9d-53ee-a33d-849ce2fa9b34' -- Sun Care
WHERE sssubcategory_id = 'e753d52d-9a52-4cb7-9d12-b2475242dd96' AND ccchild_category_id IS NULL
  AND (name ILIKE '%sun%' OR name ILIKE '%spf%');
UPDATE products SET ccchild_category_id = 'c183839f-c0f4-5e02-b3b7-88bf2d55b5e1' -- Body Skin Care
WHERE sssubcategory_id = 'e753d52d-9a52-4cb7-9d12-b2475242dd96' AND ccchild_category_id IS NULL
  AND (name ILIKE '%body%' OR name ILIKE '%lotion%' OR name ILIKE '%soap%' OR name ILIKE '%shower%');
UPDATE products SET ccchild_category_id = '916ff9c5-c44e-51c7-ba13-84094d5483f9' -- Eye Treatment
WHERE sssubcategory_id = 'e753d52d-9a52-4cb7-9d12-b2475242dd96' AND ccchild_category_id IS NULL
  AND (name ILIKE '%eye%' OR name ILIKE '%dark circle%');
UPDATE products SET ccchild_category_id = '50361351-fb73-59b1-8ee1-0074931b4e13' -- Facial Skin Care (fallback)
WHERE sssubcategory_id = 'e753d52d-9a52-4cb7-9d12-b2475242dd96' AND ccchild_category_id IS NULL;
-- 2.3 PERFUMES & FRAGRANCES (Subcategory: 5b355500-e423-4593-8549-1a578357c2e4)
UPDATE products SET ccchild_category_id = 'd3d75d59-529a-5f23-b69d-2cb075340cd7' -- Men's Fragrances
WHERE sssubcategory_id = '5b355500-e423-4593-8549-1a578357c2e4' AND ccchild_category_id IS NULL
  AND (name ILIKE '%men%' AND name NOT ILIKE '%women%');
UPDATE products SET ccchild_category_id = '5286d32f-6921-516f-9aee-4a6f2b4443bd' -- Women's Fragrances (fallback)
WHERE sssubcategory_id = '5b355500-e423-4593-8549-1a578357c2e4' AND ccchild_category_id IS NULL;
-- =============================================================================
-- PART 3: WOMEN'S & MEN'S FASHION (Ethnic Wear & Tops)
-- =============================================================================
-- 3.1 SHOP ALL ETHNIC WEAR (Subcategory: 82aded1f-96ae-484e-aa15-55386f549747)
UPDATE products SET ccchild_category_id = '755d7bd6-445a-4788-8ce2-588e8cd91129' -- Sarees
WHERE sssubcategory_id = '82aded1f-96ae-484e-aa15-55386f549747' AND ccchild_category_id IS NULL
  AND (name ILIKE '%saree%' OR name ILIKE '%sari%');
UPDATE products SET ccchild_category_id = 'c3ef6fe2-905d-4c9f-b209-c31c87a94ffc' -- Kurtis & Kurtas
WHERE sssubcategory_id = '82aded1f-96ae-484e-aa15-55386f549747' AND ccchild_category_id IS NULL
  AND (name ILIKE '%kurti%' OR name ILIKE '%kurta%' OR name ILIKE '%tunic%');
UPDATE products SET ccchild_category_id = '0e621a80-32b4-4e03-8ca6-b5020eb404cb' -- Lehengas
WHERE sssubcategory_id = '82aded1f-96ae-484e-aa15-55386f549747' AND ccchild_category_id IS NULL
  AND (name ILIKE '%lehenga%' OR name ILIKE '%choli%');
UPDATE products SET ccchild_category_id = '43ffd0a4-3540-4645-8593-3073ebf10bc3' -- Suits
WHERE sssubcategory_id = '82aded1f-96ae-484e-aa15-55386f549747' AND ccchild_category_id IS NULL
  AND (name ILIKE '%salwar%' OR name ILIKE '%suit%' OR name ILIKE '%anarkali%');
UPDATE products SET ccchild_category_id = '4fbfacd7-9aae-4658-ab71-e3042c528aeb' -- Dupattas
WHERE sssubcategory_id = '82aded1f-96ae-484e-aa15-55386f549747' AND ccchild_category_id IS NULL
  AND (name ILIKE '%dupatta%' OR name ILIKE '%shawl%' OR name ILIKE '%stole%');
UPDATE products SET ccchild_category_id = 'dd2bc6ce-5b4a-4aba-b097-b389d9698d94' -- Blouses & Fabrics
WHERE sssubcategory_id = '82aded1f-96ae-484e-aa15-55386f549747' AND ccchild_category_id IS NULL
  AND (name ILIKE '%blouse%' OR name ILIKE '%fabric%' OR name ILIKE '%dress material%');
UPDATE products SET ccchild_category_id = '108071df-e387-48f0-b5e7-7b06ff33a0dd' -- Ethnic dresses (fallback)
WHERE sssubcategory_id = '82aded1f-96ae-484e-aa15-55386f549747' AND ccchild_category_id IS NULL;
-- 3.2 MEN'S TOPS (Subcategory: c1441f29-710a-4c0e-93be-dfc689337c26)
UPDATE products SET ccchild_category_id = '7fa9d3a6-86b9-4da8-9788-c0e820b574cd' -- Jackets
WHERE sssubcategory_id = 'c1441f29-710a-4c0e-93be-dfc689337c26' AND ccchild_category_id IS NULL
  AND (name ILIKE '%jacket%' OR name ILIKE '%coat%' OR name ILIKE '%blouson%');
UPDATE products SET ccchild_category_id = 'b51994ac-b58c-4ad6-af1c-bc776469feef' -- Sweatshirts
WHERE sssubcategory_id = 'c1441f29-710a-4c0e-93be-dfc689337c26' AND ccchild_category_id IS NULL
  AND (name ILIKE '%hoodie%' OR name ILIKE '%sweatshirt%' OR name ILIKE '%sweater%');
UPDATE products SET ccchild_category_id = 'efad0fff-fe76-4a15-a97a-80a7847eae99' -- Polo T-shirts
WHERE sssubcategory_id = 'c1441f29-710a-4c0e-93be-dfc689337c26' AND ccchild_category_id IS NULL
  AND (name ILIKE '%polo%');
UPDATE products SET ccchild_category_id = '824c9617-85a3-47d4-9b78-b936416ecd06' -- Shirts
WHERE sssubcategory_id = 'c1441f29-710a-4c0e-93be-dfc689337c26' AND ccchild_category_id IS NULL
  AND (name ILIKE '%shirt%' AND name NOT ILIKE '%t-shirt%' AND name NOT ILIKE '%tshirt%');
UPDATE products SET ccchild_category_id = '23478e58-30a7-47cf-bb08-39e4aa1da42d' -- T-shirts (fallback)
WHERE sssubcategory_id = 'c1441f29-710a-4c0e-93be-dfc689337c26' AND ccchild_category_id IS NULL;
-- =============================================================================
-- PART 4: CLOTHING, SHOES & JEWELRY (Novelty & Baby Clothing)
-- =============================================================================
-- 4.1 NOVELTY & MORE (Subcategory: 51b545e0-35b3-486b-b4a4-ee4601a1b24f)
UPDATE products SET ccchild_category_id = '1644dc8f-6599-5add-a938-1f5bc87c4801' -- Novelty Watches
WHERE sssubcategory_id = '51b545e0-35b3-486b-b4a4-ee4601a1b24f' AND ccchild_category_id IS NULL
  AND (name ILIKE '%watch%' OR name ILIKE '%clock%');
UPDATE products SET ccchild_category_id = 'b58d6f6c-b2a0-5344-b2dd-9fe548f256ff' -- Novelty Clothing & More (fallback)
WHERE sssubcategory_id = '51b545e0-35b3-486b-b4a4-ee4601a1b24f' AND ccchild_category_id IS NULL;
-- 4.2 BABY CLOTHING & SHOES (Subcategory: bd39bb29-a41b-42fc-bf11-b2680c77296b)
UPDATE products SET ccchild_category_id = '3cfb1f19-6911-506c-969c-6d8bb5b5c96c' -- Baby Girls
WHERE sssubcategory_id = 'bd39bb29-a41b-42fc-bf11-b2680c77296b' AND ccchild_category_id IS NULL
  AND (name ILIKE '%girl%' OR name ILIKE '%frock%' OR name ILIKE '%skirt%' OR name ILIKE '%dress%');
UPDATE products SET ccchild_category_id = '68169add-69a6-597f-bb66-a981b3080c54' -- Baby Boys (fallback)
WHERE sssubcategory_id = 'bd39bb29-a41b-42fc-bf11-b2680c77296b' AND ccchild_category_id IS NULL;
-- =============================================================================
-- PART 5: MOBILES & ELECTRONICS
-- =============================================================================
-- 5.1 MOBILES (Subcategory: 6e27c0ab-9372-43c0-a899-d628fd3311b3)
UPDATE products SET ccchild_category_id = '906973a8-8de4-4fb0-850a-3626125f2834' -- Keypad Phones
WHERE sssubcategory_id = '6e27c0ab-9372-43c0-a899-d628fd3311b3' AND ccchild_category_id IS NULL
  AND (name ILIKE '%keypad%' OR name ILIKE '%feature phone%' OR name ILIKE '%nokia 105%' OR name ILIKE '%it2163%');
UPDATE products SET ccchild_category_id = 'ae5bfe3d-1028-4799-87c8-736806312a36' -- Smart Phones (fallback)
WHERE sssubcategory_id = '6e27c0ab-9372-43c0-a899-d628fd3311b3' AND ccchild_category_id IS NULL;
-- 5.2 MOBILE ACCESSORIES (Subcategory: 8b8a2f36-b718-4ea1-be98-5c06af17481d)
UPDATE products SET ccchild_category_id = '078eca43-e34a-4016-ae7b-96d0dd7c5caf' -- Power Banks
WHERE sssubcategory_id = '8b8a2f36-b718-4ea1-be98-5c06af17481d' AND ccchild_category_id IS NULL
  AND (name ILIKE '%power bank%' OR name ILIKE '%powerbank%');
UPDATE products SET ccchild_category_id = '34be2a5f-fea7-46c5-a103-e063cc7fa3d9' -- Screen Protectors
WHERE sssubcategory_id = '8b8a2f36-b718-4ea1-be98-5c06af17481d' AND ccchild_category_id IS NULL
  AND (name ILIKE '%screen protector%' OR name ILIKE '%tempered glass%');
UPDATE products SET ccchild_category_id = '9d2d5573-4ea8-4bed-9f9d-b368a32e3271' -- Styling & Maintenance / Cases (fallback)
WHERE sssubcategory_id = '8b8a2f36-b718-4ea1-be98-5c06af17481d' AND ccchild_category_id IS NULL;
-- 5.3 PORTABLE AUDIO & VIDEO (Subcategory: 0142b3fe-5f2a-4915-9aaf-19c7c90a1d34)
UPDATE products SET ccchild_category_id = '97fe7699-02f3-58f8-b1ef-d079cc02c75a' -- Portable Speakers
WHERE sssubcategory_id = '0142b3fe-5f2a-4915-9aaf-19c7c90a1d34' AND ccchild_category_id IS NULL
  AND (name ILIKE '%speaker%' OR name ILIKE '%soundbar%' OR name ILIKE '%bluetooth%');
UPDATE products SET ccchild_category_id = '60f7a6af-35af-56b7-bf6d-8efafd43817b' -- Portable Radios
WHERE sssubcategory_id = '0142b3fe-5f2a-4915-9aaf-19c7c90a1d34' AND ccchild_category_id IS NULL
  AND name ILIKE '%radio%';
UPDATE products SET ccchild_category_id = '05e4ede3-8b98-5048-a909-f0934c4af471' -- Audio Accessories (fallback)
WHERE sssubcategory_id = '0142b3fe-5f2a-4915-9aaf-19c7c90a1d34' AND ccchild_category_id IS NULL;
-- =============================================================================
-- PART 6: HEALTH CARE (Supplements & Medical Supplies)
-- =============================================================================
-- 6.1 HEALTH SUPPLEMENTS (Subcategory: 2e7228b2-d316-47ac-940c-3b9f419b6d8b)
UPDATE products SET ccchild_category_id = 'dd88aba0-e26d-4eff-a0aa-b8aa5fd75ad3' -- Protein
WHERE sssubcategory_id = '2e7228b2-d316-47ac-940c-3b9f419b6d8b' AND ccchild_category_id IS NULL
  AND (name ILIKE '%protein%' OR name ILIKE '%whey%' OR name ILIKE '%bcaa%' OR name ILIKE '%creatine%');
UPDATE products SET ccchild_category_id = 'e3d429de-b98c-47cc-bbab-eb2d471915d3' -- Chyawanprash
WHERE sssubcategory_id = '2e7228b2-d316-47ac-940c-3b9f419b6d8b' AND ccchild_category_id IS NULL
  AND (name ILIKE '%chyawanprash%' OR name ILIKE '%chyavanprash%');
UPDATE products SET ccchild_category_id = 'd1abdb8c-a31e-4b8d-b57c-30f9cc04ba4d' -- Energy Drinks
WHERE sssubcategory_id = '2e7228b2-d316-47ac-940c-3b9f419b6d8b' AND ccchild_category_id IS NULL
  AND (name ILIKE '%energy%' OR name ILIKE '%drink%' OR name ILIKE '%electrolyte%');
UPDATE products SET ccchild_category_id = 'b1f340a6-3cf5-48de-8b06-06ece7ca1f7a' -- Vitamins (fallback)
WHERE sssubcategory_id = '2e7228b2-d316-47ac-940c-3b9f419b6d8b' AND ccchild_category_id IS NULL;
-- 6.2 HOME MEDICAL SUPPLIES (Subcategory: 4097634d-fea6-47d4-8fd7-d39d91be35d0)
UPDATE products SET ccchild_category_id = 'c2e5d6b5-feba-40a7-b35a-f8ae8f0612f7' -- Health Monitors
WHERE sssubcategory_id = '4097634d-fea6-47d4-8fd7-d39d91be35d0' AND ccchild_category_id IS NULL
  AND (name ILIKE '%monitor%' OR name ILIKE '%oximeter%' OR name ILIKE '%thermometer%' OR name ILIKE '%bp%');
UPDATE products SET ccchild_category_id = 'dba0f5f5-6506-4cd4-a11b-c5586eaeb127' -- Pain Relief Devices
WHERE sssubcategory_id = '4097634d-fea6-47d4-8fd7-d39d91be35d0' AND ccchild_category_id IS NULL
  AND (name ILIKE '%pain%' OR name ILIKE '%massager%' OR name ILIKE '%heating pad%');
UPDATE products SET ccchild_category_id = '49ac4151-5999-4d8c-bb9c-7cc8f2bcbefa' -- Medical Supports and Braces (fallback)
WHERE sssubcategory_id = '4097634d-fea6-47d4-8fd7-d39d91be35d0' AND ccchild_category_id IS NULL;
-- =============================================================================
-- PART 7: HOME & KITCHEN (Décor, Dining, Furniture)
-- =============================================================================
-- 7.1 HOME DÉCOR (Subcategory: 5f79ed1d-c984-4ea0-820d-e1c839887fde)
UPDATE products SET ccchild_category_id = 'd1378f79-b6ef-5d80-8958-061ca64013cb' -- Clocks
WHERE sssubcategory_id = '5f79ed1d-c984-4ea0-820d-e1c839887fde' AND ccchild_category_id IS NULL
  AND name ILIKE '%clock%';
UPDATE products SET ccchild_category_id = 'a0b7fdfb-46c8-57ca-bb48-18a79db4916c' -- Vases
WHERE sssubcategory_id = '5f79ed1d-c984-4ea0-820d-e1c839887fde' AND ccchild_category_id IS NULL
  AND name ILIKE '%vase%';
UPDATE products SET ccchild_category_id = '3bb58461-fb82-5181-9d20-4980ed98b967' -- Candles
WHERE sssubcategory_id = '5f79ed1d-c984-4ea0-820d-e1c839887fde' AND ccchild_category_id IS NULL
  AND (name ILIKE '%candle%' OR name ILIKE '%diyas%');
UPDATE products SET ccchild_category_id = '3c127a9b-8c47-5dc6-af51-ef5b3ed85028' -- Home Décor Accents (fallback)
WHERE sssubcategory_id = '5f79ed1d-c984-4ea0-820d-e1c839887fde' AND ccchild_category_id IS NULL;
-- 7.2 KITCHEN & DINING (Subcategory: ef149bfa-03ee-4f53-8d4b-e71ff45c09d2)
UPDATE products SET ccchild_category_id = '1410e14c-f884-52f1-85d1-f4c3370e08bf' -- Cookware
WHERE sssubcategory_id = 'ef149bfa-03ee-4f53-8d4b-e71ff45c09d2' AND ccchild_category_id IS NULL
  AND (name ILIKE '%pan%' OR name ILIKE '%cooker%' OR name ILIKE '%pot%' OR name ILIKE '%kadhai%');
UPDATE products SET ccchild_category_id = 'baa18363-117a-591b-824e-a5a0c2615d9d' -- Storage
WHERE sssubcategory_id = 'ef149bfa-03ee-4f53-8d4b-e71ff45c09d2' AND ccchild_category_id IS NULL
  AND (name ILIKE '%container%' OR name ILIKE '%box%' OR name ILIKE '%jar%' OR name ILIKE '%bottle%');
UPDATE products SET ccchild_category_id = '7a264bc5-1442-5cfb-b4da-fbfed1ae54c3' -- Utensils & Gadgets (fallback)
WHERE sssubcategory_id = 'ef149bfa-03ee-4f53-8d4b-e71ff45c09d2' AND ccchild_category_id IS NULL;
-- 7.3 FURNITURE (Subcategory: 2fd17725-ea85-4ae8-b0ba-79db7683907f)
UPDATE products SET ccchild_category_id = 'bf99495e-62d8-4351-9099-54cb4e57569d' -- Bedroom
WHERE sssubcategory_id = '2fd17725-ea85-4ae8-b0ba-79db7683907f' AND ccchild_category_id IS NULL
  AND (name ILIKE '%bed%' OR name ILIKE '%mattress%' OR name ILIKE '%wardrobe%');
UPDATE products SET ccchild_category_id = '86e9b810-887b-41dd-9d70-80f2f9514d81' -- Dining Room
WHERE sssubcategory_id = '2fd17725-ea85-4ae8-b0ba-79db7683907f' AND ccchild_category_id IS NULL
  AND (name ILIKE '%dining%' OR name ILIKE '%chair%');
UPDATE products SET ccchild_category_id = '7a14a655-7573-4b16-a28d-01d30ddf211b' -- Living Room (fallback)
WHERE sssubcategory_id = '2fd17725-ea85-4ae8-b0ba-79db7683907f' AND ccchild_category_id IS NULL;
-- =============================================================================
-- PART 8: BABY CARE & DIAPERING
-- =============================================================================
-- 8.1 BABY CARE (Subcategory: e357b6a9-b9ea-42dd-ae72-356743e03622)
UPDATE products SET ccchild_category_id = 'affe2c1e-e442-5a73-b765-de743cf3229f' -- Bathing
WHERE sssubcategory_id = 'e357b6a9-b9ea-42dd-ae72-356743e03622' AND ccchild_category_id IS NULL
  AND (name ILIKE '%bath%' OR name ILIKE '%wash%' OR name ILIKE '%soap%');
UPDATE products SET ccchild_category_id = 'e29d4017-6fd1-5d46-902a-d99eb4ea8c8b' -- Grooming & Skin Care (fallback)
WHERE sssubcategory_id = 'e357b6a9-b9ea-42dd-ae72-356743e03622' AND ccchild_category_id IS NULL;
-- 8.2 BABY DIAPERING (Subcategory: 66e665f7-82b3-4119-9c35-0d6817a78f6d)
UPDATE products SET ccchild_category_id = '75064f72-be89-5ed3-a5fe-6ce69f670ff2' -- Disposable Diapers
WHERE sssubcategory_id = '66e665f7-82b3-4119-9c35-0d6817a78f6d' AND ccchild_category_id IS NULL
  AND (name ILIKE '%pant%' OR name ILIKE '%diaper%');
UPDATE products SET ccchild_category_id = '30df471a-4de6-5e92-a054-81fad47e232a' -- Diaper Wipes (fallback)
WHERE sssubcategory_id = '66e665f7-82b3-4119-9c35-0d6817a78f6d' AND ccchild_category_id IS NULL;
-- =============================================================================
-- PART 9: PETS, TOYS, GROCERY & AUTO
-- =============================================================================
-- 9.1 PET SUPPLIES (Dogs & Cats)
UPDATE products SET ccchild_category_id = 'b5ca3be6-634d-58ec-9602-0be7bf82e85a' -- Dog Food
WHERE sssubcategory_id = '7af3b0d7-7928-4786-8f7f-294c6b391134' AND ccchild_category_id IS NULL
  AND (name ILIKE '%food%' OR name ILIKE '%gravy%' OR name ILIKE '%treat%');
UPDATE products SET ccchild_category_id = '28935cbb-e794-5544-b295-885741b0798e' -- Dog Toys (fallback)
WHERE sssubcategory_id = '7af3b0d7-7928-4786-8f7f-294c6b391134' AND ccchild_category_id IS NULL;
UPDATE products SET ccchild_category_id = '22ebbf61-7752-550d-b640-300e1584a2ae' -- Cat Food (fallback)
WHERE sssubcategory_id = 'b41504a6-4fce-49d8-941e-d4aa70ff31b7' AND ccchild_category_id IS NULL;
-- 9.2 GROCERY (Snacks & Beverages: ecddfab7-04c0-49ed-b74a-5db881214fe7)
UPDATE products SET ccchild_category_id = '7be37614-e0ce-43bf-96e4-f28609863887' -- Coffee
WHERE sssubcategory_id = 'ecddfab7-04c0-49ed-b74a-5db881214fe7' AND ccchild_category_id IS NULL
  AND name ILIKE '%coffee%';
UPDATE products SET ccchild_category_id = '222e2eb9-1cba-4dfd-8939-a073c94663e4' -- Tea
WHERE sssubcategory_id = 'ecddfab7-04c0-49ed-b74a-5db881214fe7' AND ccchild_category_id IS NULL
  AND name ILIKE '%tea%';
UPDATE products SET ccchild_category_id = '779ca241-8570-4909-a534-25e136848377' -- Chips & Namkeen (fallback)
WHERE sssubcategory_id = 'ecddfab7-04c0-49ed-b74a-5db881214fe7' AND ccchild_category_id IS NULL;
-- 9.3 CAR & BIKE ACCESSORIES (fa5105c5-1219-415c-b810-f7b6366e5939)
UPDATE products SET ccchild_category_id = 'de35e76b-06d3-40a8-8b45-c653ee08fb52' -- Helmets & Riding Gear
WHERE sssubcategory_id = 'fa5105c5-1219-415c-b810-f7b6366e5939' AND ccchild_category_id IS NULL
  AND (name ILIKE '%helmet%' OR name ILIKE '%glove%');
UPDATE products SET ccchild_category_id = '1d3fddfc-9e34-4ada-8dcd-6266a689d7a6' -- Car & Bike Care (fallback)
WHERE sssubcategory_id = 'fa5105c5-1219-415c-b810-f7b6366e5939' AND ccchild_category_id IS NULL;
-- =============================================================================
-- PART 10: GIFTS DEPARTMENT (Fixes the last parent category with 0 subcategory)
-- =============================================================================
INSERT INTO sssubcategories (id, name, parent_category_id, description)
VALUES ('c08a7cde-3780-4799-8568-70e667741b66', 'Gifts & Festive Gifting', '973ce5ca-7647-497b-98df-0959725f5431', 'Gift sets and festive hampers')
ON CONFLICT (id) DO NOTHING;
INSERT INTO ccchild_categories (id, name, subcategory_id, description)
VALUES ('c08a7cde-3780-4799-8568-70e667741b99', 'Gift Sets & Hampers', 'c08a7cde-3780-4799-8568-70e667741b66', 'Gift hampers and festival sets')
ON CONFLICT (id) DO NOTHING;
UPDATE products 
SET sssubcategory_id = 'c08a7cde-3780-4799-8568-70e667741b66',
    ccchild_category_id = 'c08a7cde-3780-4799-8568-70e667741b99'
WHERE ppparent_category_id = '973ce5ca-7647-497b-98df-0959725f5431';
COMMIT;