-- Task: set stores.image_link for 21 more stores (second list of manually collected logos).
-- Match: store name (case-insensitive, trimmed) = store name in the list.

-- 1) PREVIEW: stores found in the table with the old and new link.
--    A NULL id means the name does not exist in stores. One name must give one row.
WITH logos(store_name, url) AS (VALUES
  ('True Elements', 'https://media.licdn.com/dms/image/v2/D4D0BAQFdk9orQVuNvg/company-logo_200_200/B4DZpdPjldHwAM-/0/1762500950902/true_elements_te_loago?e=2147483647&v=beta&t=zdm0C9tU__6P07q_E_ocUfulRChlrxkMrE8p84xVSYU'),
  ('The Label Life', 'https://thelabellife.com/cdn/shop/files/TLL_logo_black.png?v=1771590254&width=500'),
  ('Rare Rabbit', 'https://thehouseofrare.com/cdn/shop/files/Frame_41820_480x.png?v=1720342909'),
  ('Remini', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQakPlGUqW6HcVXOs1B686fViMdAqTyK-fPbdp3TzrPBw&s=10'),
  ('Reliance Trends', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTldsRiTJjGv1sHZlTetOYjJlyfNVE8nuTeUh0a97j-Q&s=10'),
  ('Ramoji Film City', 'https://assets.simplotel.com/simplotel/image/upload/q_90,fl_progressive,w_189,f_auto,c_limit/ramoji-film-city/Group_48096799_1_22e297cd.png'),
  ('Parallels', 'https://www.parallels.com/static/pl/fileadmin/res/img/navigation/pl-logo-dk.png'),
  ('MyFlowerTree', 'https://d3cif2hu95s88v.cloudfront.net/live-site-2016/2026/header_img/logo.webp'),
  ('Mobikwik', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkpodZY552998CKt8Qqfr25wcqWvP2_SG9yN2wDDJn_w&s'),
  ('Marry Brown', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCz4PrbkRt1uElEDHZqYHVj1p-Jjs1tB2O_4TQ7K1iFg&s=10'),
  ('Million Cases', 'https://millioncases.com/cdn/shop/files/WhatsApp_Image_2026-05-01_at_4.31.28_PM.jpg?v=1777633319&width=440'),
  ('Kerala Spices Online', 'https://www.keralaspicesonline.com/wp-content/uploads/2024/11/kso-logo-for-app.webp'),
  ('IntrCity', 'https://images.railyatri.in/ry_images_prod/IC-LogoHorizontal2x-min-1611241993.png'),
  ('Glide', 'https://images.g2crowd.com/uploads/product/image/social_landscape/social_landscape_0e43785f68598369b62324206e64ff5b/glide-glide.png'),
  ('Hamercop', 'https://cdn.shopify.com/s/files/1/0534/9041/7860/files/4_2.jpg?v=1743573762'),
  ('Gumloop', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhTI8d7W0QWdXCKB6HLuhVg8m0LdTHF5C52Mbk_r5Nag&s'),
  ('Gingercrush', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9NxpIUXXK3bm7cKjq40of6wRDWlDHf5kDaPA3deUbkwq24aDg0VsoSDE&s=10'),
  ('Gladful', 'https://static.wixstatic.com/media/c2d396_6b9e3d8f0edf42b59af10f1e88963c52~mv2.png/v1/fill/w_568,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/LogoWOSmileNew.png'),
  ('Freedom', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoXOziyVXTTDxdWPgH6-S48SREMn-hYD6GoPsfs1UhPq8Gfy7dj1HxzjeV&s=10'),
  ('Fragkart', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNaNLEGa-yOOhrRgRgV4qVmo407-eVq67uRKvmKTi9sg&s'),
  ('Freecharge', 'https://upload.wikimedia.org/wikipedia/en/1/16/Freecharge_%28Indian_financial_services_company%29_2022_logo.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original')
)
SELECT l.store_name, s.id, s.name AS db_name, s.image_link AS old_image_link, l.url AS new_image_link
FROM logos l
LEFT JOIN public.stores s ON LOWER(TRIM(s.name)) = LOWER(l.store_name)
ORDER BY (s.id IS NULL) DESC, l.store_name;

-- 2) UPDATE image_link
WITH logos(store_name, url) AS (VALUES
  ('True Elements', 'https://media.licdn.com/dms/image/v2/D4D0BAQFdk9orQVuNvg/company-logo_200_200/B4DZpdPjldHwAM-/0/1762500950902/true_elements_te_loago?e=2147483647&v=beta&t=zdm0C9tU__6P07q_E_ocUfulRChlrxkMrE8p84xVSYU'),
  ('The Label Life', 'https://thelabellife.com/cdn/shop/files/TLL_logo_black.png?v=1771590254&width=500'),
  ('Rare Rabbit', 'https://thehouseofrare.com/cdn/shop/files/Frame_41820_480x.png?v=1720342909'),
  ('Remini', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQakPlGUqW6HcVXOs1B686fViMdAqTyK-fPbdp3TzrPBw&s=10'),
  ('Reliance Trends', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTldsRiTJjGv1sHZlTetOYjJlyfNVE8nuTeUh0a97j-Q&s=10'),
  ('Ramoji Film City', 'https://assets.simplotel.com/simplotel/image/upload/q_90,fl_progressive,w_189,f_auto,c_limit/ramoji-film-city/Group_48096799_1_22e297cd.png'),
  ('Parallels', 'https://www.parallels.com/static/pl/fileadmin/res/img/navigation/pl-logo-dk.png'),
  ('MyFlowerTree', 'https://d3cif2hu95s88v.cloudfront.net/live-site-2016/2026/header_img/logo.webp'),
  ('Mobikwik', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkpodZY552998CKt8Qqfr25wcqWvP2_SG9yN2wDDJn_w&s'),
  ('Marry Brown', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCz4PrbkRt1uElEDHZqYHVj1p-Jjs1tB2O_4TQ7K1iFg&s=10'),
  ('Million Cases', 'https://millioncases.com/cdn/shop/files/WhatsApp_Image_2026-05-01_at_4.31.28_PM.jpg?v=1777633319&width=440'),
  ('Kerala Spices Online', 'https://www.keralaspicesonline.com/wp-content/uploads/2024/11/kso-logo-for-app.webp'),
  ('IntrCity', 'https://images.railyatri.in/ry_images_prod/IC-LogoHorizontal2x-min-1611241993.png'),
  ('Glide', 'https://images.g2crowd.com/uploads/product/image/social_landscape/social_landscape_0e43785f68598369b62324206e64ff5b/glide-glide.png'),
  ('Hamercop', 'https://cdn.shopify.com/s/files/1/0534/9041/7860/files/4_2.jpg?v=1743573762'),
  ('Gumloop', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhTI8d7W0QWdXCKB6HLuhVg8m0LdTHF5C52Mbk_r5Nag&s'),
  ('Gingercrush', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9NxpIUXXK3bm7cKjq40of6wRDWlDHf5kDaPA3deUbkwq24aDg0VsoSDE&s=10'),
  ('Gladful', 'https://static.wixstatic.com/media/c2d396_6b9e3d8f0edf42b59af10f1e88963c52~mv2.png/v1/fill/w_568,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/LogoWOSmileNew.png'),
  ('Freedom', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoXOziyVXTTDxdWPgH6-S48SREMn-hYD6GoPsfs1UhPq8Gfy7dj1HxzjeV&s=10'),
  ('Fragkart', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNaNLEGa-yOOhrRgRgV4qVmo407-eVq67uRKvmKTi9sg&s'),
  ('Freecharge', 'https://upload.wikimedia.org/wikipedia/en/1/16/Freecharge_%28Indian_financial_services_company%29_2022_logo.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original')
)
UPDATE public.stores s
SET image_link = l.url
FROM logos l
WHERE LOWER(TRIM(s.name)) = LOWER(l.store_name)
RETURNING s.id, s.name, s.image_link;