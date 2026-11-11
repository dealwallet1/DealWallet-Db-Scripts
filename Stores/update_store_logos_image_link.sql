-- Task: set stores.image_link for 37 stores whose logo link was collected manually.
-- Match: store name (case-insensitive, trimmed) = name before "logo" in the list.

-- 1) PREVIEW: stores found in the table with the old and new link.
--    Names with no row here do not exist in stores (check the spelling). One name must give one row.
WITH logos(store_name, url) AS (VALUES
  ('Lot Mobiles', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbYQopTF1oSH-Td1aKFxSllMd3rQTQSwIKh-8ZhJBKyowDtxwsrKxORP2o&s=10'),
  ('Revolve', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBDD0n-Cy3r5K3o_51hJUmM0_DLRxa8r1hwnuPuJW7Yw&s=10'),
  ('Sarees Bazaar', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFUCJoa7a38OD08vBdNncLfg4eNDBWT0chd7o8EAg5LE7awMJiGTzrAtIy&s=10'),
  ('Sylvi', 'https://sylvi.in/cdn/shop/files/Sylvi_Logo_Horizontal_b98e1642-a658-4df5-9ace-cd987eba372f_400x.png'),
  ('Westside', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUPBVjWHLPM-aRBTnyajOEdSjeqqhAfdGjLY-0mktLXw&s=10'),
  ('Ripped Up Nutrition', 'https://play-lh.googleusercontent.com/WWrYk2NPI2j7NrPILOsSqmh-NRGS_bX9gtZMIhUrTYyqQ028FSr5g0kgbtuvJFFNFXyhYCFZapv3-dLsPQMdkw=s0-br30'),
  ('Titan Eye+', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxna_Ylmk_Z0sCixaQeegRTVj9_MgeEmwcZNUbuph22Q&s=10'),
  ('AskCodi', 'https://cdn.techjockey.com/ae/assets/images/techjockey/products/1234_AskCodi.jpg'),
  ('Bullet Micro Drama', 'https://cdn.grabon.in/gograbon/images/merchant/1773381285109/bulletmicrodrama-logo.jpg'),
  ('Chana Jor', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8ONX_t_ZKuXTl852Obr700a__4MLGjmpARFRiYiblCQ&s=10'),
  ('EazyDiner', 'https://restaurantindia.s3.ap-south-1.amazonaws.com/s3fs-public/news9529.jpg'),
  ('Everstylish', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_oUplPMz0TP_MOnYb3MxsC4exQjT23RMCry4lbzlhhw&s=10'),
  ('Fineshare', 'https://cdn.prod.website-files.com/64f605bdfa749671fed117a9/65578321158dcfc617deb121_Finshare.png'),
  ('flam', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi3zu3sR63k47P8To-PlIAuNYW210PPE-n5kDRTKSZ4f6an2dy44W2hVo&s=10'),
  ('Rail Yatri', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcE4eweWJNk5KAsQhYbs43CzdcJVr21WYgQ3kaZm7XrkQHAvRTkd1pAMA&s=10'),
  ('Lufthansa', 'https://www.logo.wine/a/logo/Lufthansa/Lufthansa-Logo.wine.svg'),
  ('Studds', 'https://s3-eu-west-1.amazonaws.com/tpd/logos/617d2bfe150165c2590b405c/0x0.png'),
  ('Garmin', 'https://images.seeklogo.com/logo-png/5/1/garmin-logo-png_seeklogo-59292.png'),
  ('Autodesk', 'https://brand.autodesk.com/wp-content/uploads/2025/02/logo-02-variations-primary-421x237@2x.png'),
  ('Zokudo', 'https://cdn.grabon.in/gograbon/images/merchant/1773237646685/zokudo-logo.jpg'),
  ('Zomunk', 'https://cdn.grabon.in/gograbon/images/merchant/1773237647007/zomunk-logo.jpg'),
  ('Zink London', 'https://zinklondon.in/cdn/shop/files/1000120039.png?v=1735380928&width=642'),
  ('Zeligate', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5Vao9z5YSTPbNjVJjD11ns2LaN-pnggZzBThEuvgZjA&s=10'),
  ('XNote', 'https://xnote.ai/cdn/shop/files/Group_80.svg?v=6349748840288061049'),
  ('Woollen wear', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvmcFMhDFUjcsBfbI4CAPiI0ICygiSPitLdY8v1PyptA&s'),
  ('WinZip', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGe0aDiFiPEcy9FYxv0ZE8BMbMkphKhl4-aN7lBUJlMA&s'),
  ('VStar', 'https://media.licdn.com/dms/image/v2/C510BAQG3cDfVkFCoaQ/company-logo_200_200/company-logo_200_200/0/1631390481091?e=2147483647&v=beta&t=3mGUh1NK91n4eiZwo2ycAqIkqLkQZ3pP9cG87v3xw1s'),
  ('Vista Social', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShZsmnM06satkZq5G6cW1Q0aBXvR4ttc-RNVViBTVnDw&s=10'),
  ('Unreal Speech', 'https://iaperfecta.com/wp-content/uploads/2025/03/Unreal-Speech-logo.jpg'),
  ('TunnelBear', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIZjwKHtSNaOIiepU9yeL-Zhhwa8NiuTppoqj2wcTvFA&s=10'),
  ('Tru Hair', 'https://truhairandskin.com/cdn/shop/files/TRU-HairSkin-LOGO.webp?v=1684384824'),
  ('Tring', 'https://images.seeklogo.com/logo-png/66/1/tring-by-pegadaian-logo-png_seeklogo-668769.png'),
  ('Thordata', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHu4wJLqDZwn0ED134adMbsInNaFcmw_a9WTHo-7pTVA&s=10'),
  ('The Purple Tree', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqbjFjeryQbg-NGOR9kKYx5Klwqcl-0Tn0sH5ADfpFNzXtKQCNzDQd9vU&s=10'),
  ('Textline', 'https://cdn-public.softwarereviews.com/production/logos/offerings/10732/original/textline-removebg-preview.png?1688502053'),
  ('Tata Studi', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXIxtETsGum3ZEBmd7xaNu6BVKTTk5q0mPLlF1I5IkA7EAugpJvWeS7n0t&s=10'),
  ('TaskBucks', 'https://play-lh.googleusercontent.com/sYLDiZLSxRmplZuADh2zCG0iT3u_CWWe756-AJjRZvyplYUCLi8rBQVR_Xj0lv6JW3MfZ1ClHqOQBx7idxb7qw')
)
SELECT l.store_name, s.id, s.name AS db_name, s.image_link AS old_image_link, l.url AS new_image_link
FROM logos l
LEFT JOIN public.stores s ON LOWER(TRIM(s.name)) = LOWER(l.store_name)
ORDER BY (s.id IS NULL) DESC, l.store_name;

-- 2) UPDATE image_link
WITH logos(store_name, url) AS (VALUES
  ('Lot Mobiles', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbYQopTF1oSH-Td1aKFxSllMd3rQTQSwIKh-8ZhJBKyowDtxwsrKxORP2o&s=10'),
  ('Revolve', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBDD0n-Cy3r5K3o_51hJUmM0_DLRxa8r1hwnuPuJW7Yw&s=10'),
  ('Sarees Bazaar', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFUCJoa7a38OD08vBdNncLfg4eNDBWT0chd7o8EAg5LE7awMJiGTzrAtIy&s=10'),
  ('Sylvi', 'https://sylvi.in/cdn/shop/files/Sylvi_Logo_Horizontal_b98e1642-a658-4df5-9ace-cd987eba372f_400x.png'),
  ('Westside', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUPBVjWHLPM-aRBTnyajOEdSjeqqhAfdGjLY-0mktLXw&s=10'),
  ('Ripped Up Nutrition', 'https://play-lh.googleusercontent.com/WWrYk2NPI2j7NrPILOsSqmh-NRGS_bX9gtZMIhUrTYyqQ028FSr5g0kgbtuvJFFNFXyhYCFZapv3-dLsPQMdkw=s0-br30'),
  ('Titan Eye+', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxna_Ylmk_Z0sCixaQeegRTVj9_MgeEmwcZNUbuph22Q&s=10'),
  ('AskCodi', 'https://cdn.techjockey.com/ae/assets/images/techjockey/products/1234_AskCodi.jpg'),
  ('Bullet Micro Drama', 'https://cdn.grabon.in/gograbon/images/merchant/1773381285109/bulletmicrodrama-logo.jpg'),
  ('Chana Jor', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8ONX_t_ZKuXTl852Obr700a__4MLGjmpARFRiYiblCQ&s=10'),
  ('EazyDiner', 'https://restaurantindia.s3.ap-south-1.amazonaws.com/s3fs-public/news9529.jpg'),
  ('Everstylish', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_oUplPMz0TP_MOnYb3MxsC4exQjT23RMCry4lbzlhhw&s=10'),
  ('Fineshare', 'https://cdn.prod.website-files.com/64f605bdfa749671fed117a9/65578321158dcfc617deb121_Finshare.png'),
  ('flam', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi3zu3sR63k47P8To-PlIAuNYW210PPE-n5kDRTKSZ4f6an2dy44W2hVo&s=10'),
  ('Rail Yatri', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcE4eweWJNk5KAsQhYbs43CzdcJVr21WYgQ3kaZm7XrkQHAvRTkd1pAMA&s=10'),
  ('Lufthansa', 'https://www.logo.wine/a/logo/Lufthansa/Lufthansa-Logo.wine.svg'),
  ('Studds', 'https://s3-eu-west-1.amazonaws.com/tpd/logos/617d2bfe150165c2590b405c/0x0.png'),
  ('Garmin', 'https://images.seeklogo.com/logo-png/5/1/garmin-logo-png_seeklogo-59292.png'),
  ('Autodesk', 'https://brand.autodesk.com/wp-content/uploads/2025/02/logo-02-variations-primary-421x237@2x.png'),
  ('Zokudo', 'https://cdn.grabon.in/gograbon/images/merchant/1773237646685/zokudo-logo.jpg'),
  ('Zomunk', 'https://cdn.grabon.in/gograbon/images/merchant/1773237647007/zomunk-logo.jpg'),
  ('Zink London', 'https://zinklondon.in/cdn/shop/files/1000120039.png?v=1735380928&width=642'),
  ('Zeligate', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5Vao9z5YSTPbNjVJjD11ns2LaN-pnggZzBThEuvgZjA&s=10'),
  ('XNote', 'https://xnote.ai/cdn/shop/files/Group_80.svg?v=6349748840288061049'),
  ('Woollen wear', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvmcFMhDFUjcsBfbI4CAPiI0ICygiSPitLdY8v1PyptA&s'),
  ('WinZip', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGe0aDiFiPEcy9FYxv0ZE8BMbMkphKhl4-aN7lBUJlMA&s'),
  ('VStar', 'https://media.licdn.com/dms/image/v2/C510BAQG3cDfVkFCoaQ/company-logo_200_200/company-logo_200_200/0/1631390481091?e=2147483647&v=beta&t=3mGUh1NK91n4eiZwo2ycAqIkqLkQZ3pP9cG87v3xw1s'),
  ('Vista Social', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShZsmnM06satkZq5G6cW1Q0aBXvR4ttc-RNVViBTVnDw&s=10'),
  ('Unreal Speech', 'https://iaperfecta.com/wp-content/uploads/2025/03/Unreal-Speech-logo.jpg'),
  ('TunnelBear', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIZjwKHtSNaOIiepU9yeL-Zhhwa8NiuTppoqj2wcTvFA&s=10'),
  ('Tru Hair', 'https://truhairandskin.com/cdn/shop/files/TRU-HairSkin-LOGO.webp?v=1684384824'),
  ('Tring', 'https://images.seeklogo.com/logo-png/66/1/tring-by-pegadaian-logo-png_seeklogo-668769.png'),
  ('Thordata', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHu4wJLqDZwn0ED134adMbsInNaFcmw_a9WTHo-7pTVA&s=10'),
  ('The Purple Tree', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqbjFjeryQbg-NGOR9kKYx5Klwqcl-0Tn0sH5ADfpFNzXtKQCNzDQd9vU&s=10'),
  ('Textline', 'https://cdn-public.softwarereviews.com/production/logos/offerings/10732/original/textline-removebg-preview.png?1688502053'),
  ('Tata Studi', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXIxtETsGum3ZEBmd7xaNu6BVKTTk5q0mPLlF1I5IkA7EAugpJvWeS7n0t&s=10'),
  ('TaskBucks', 'https://play-lh.googleusercontent.com/sYLDiZLSxRmplZuADh2zCG0iT3u_CWWe756-AJjRZvyplYUCLi8rBQVR_Xj0lv6JW3MfZ1ClHqOQBx7idxb7qw')
)
UPDATE public.stores s
SET image_link = l.url
FROM logos l
WHERE LOWER(TRIM(s.name)) = LOWER(l.store_name)
RETURNING s.id, s.name, s.image_link;