
-- ============================================================
-- Update incorrect store logos in DealWallet
-- 11 store logo image updates
-- ============================================================

BEGIN;

-- 1. Preview existing store records
WITH logos(store_name, image_link) AS (
    VALUES
    ('Buds And Berries', 'https://www.budsandberries.in/cdn/shop/files/Cavinkare_-_Buds_Berries_-_Logo_250x.png?v=1728275258'),
    ('Cityfurnish', 'https://bookface-images.s3.amazonaws.com/logos/607220fc282a93753498d72fe8fe826b4707c28a.png'),
    ('Cover it Up', 'https://offerurl.com/images/coveritup_logo.png'),
    ('Eloura', 'https://eloura.com.ag/cdn/shop/files/imgi_2_oie_lOGxHrJdNeGU_630e6a17-bac3-4cea-9800-a40648182890.png?v=1752329037'),
    ('Good Monk', 'https://www.goodmonk.in/cdn/shop/files/Artboard_7_copy_2.png?v=1700115655&width=135'),
    ('Liberty Shoes', 'https://i.pinimg.com/originals/e7/3e/03/e73e03bda040c0793b9cf5bbdbbb02d2.jpg'),
    ('Prince Jewellery', 'https://princejewellery.com/wp-content/uploads/2025/11/prince-logo-1.png'),
    ('Zenith Nutrition', 'https://tse2.mm.bing.net/th/id/OIP.EpIzVNqnMVwCKveEFBOhqQHaBv?r=0&pid=Api&h=220&P=0'),
    ('Steadfast Nutrition', 'https://steadfastnutrition.in/cdn/shop/files/Logo1.jpg?v=1716271115'),
    ('Aramya', 'https://play-lh.googleusercontent.com/O8uBVnuReJiaVNtWKe9jTJvm4XhT8d6Ovj15VyqaHqaFnlJNgyWdNO5hNnHp4XGK5hZh'),
    ('RMSbeauty', 'https://www.rmsbeauty.com/cdn/shop/files/RMS-LOGO-BLACK.png?v=1676461026&width=252')
)
SELECT
    l.store_name,
    s.id,
    s.name AS db_name,
    s.image_link AS old_image_link,
    l.image_link AS new_image_link
FROM logos l
LEFT JOIN public.stores s
    ON LOWER(TRIM(s.name)) = LOWER(TRIM(l.store_name))
ORDER BY l.store_name;

-- 2. Update store image links
UPDATE public.stores AS s
SET image_link = v.image_link
FROM (
    VALUES
    ('Buds And Berries', 'https://www.budsandberries.in/cdn/shop/files/Cavinkare_-_Buds_Berries_-_Logo_250x.png?v=1728275258'),
    ('Cityfurnish', 'https://bookface-images.s3.amazonaws.com/logos/607220fc282a93753498d72fe8fe826b4707c28.png'),
    ('Cover it Up', 'https://offerurl.com/images/coveritup_logo.png'),
    ('Eloura', 'https://eloura.com.ag/cdn/shop/files/imgi_2_oie_lOGxHrJdNeGU_630e6a17-bac3-4cea-9800-a40648182890.png?v=1752329037'),
    ('Good Monk', 'https://www.goodmonk.in/cdn/shop/files/Artboard_7_copy_2.png?v=1700115655&width=135'),
    ('Liberty Shoes', 'https://i.pinimg.com/originals/e7/3e/03/e73e03bda040c0793b9cf5bbdbbb02d2.jpg'),
    ('Prince Jewellery', 'https://princejewellery.com/wp-content/uploads/2025/11/prince-logo-1.png'),
    ('Zenith Nutrition', 'https://tse2.mm.bing.net/th/id/OIP.EpIzVNqnMVwCKveEFBOhqQHaBv?r=0&pid=Api&h=220&P=0'),
    ('Steadfast Nutrition', 'https://steadfastnutrition.in/cdn/shop/files/Logo1.jpg?v=1716271115'),
    ('Aramya', 'https://play-lh.googleusercontent.com/O8uBVnuReJiaVNtWKe9jTJvm4XhT8d6Ovj15VyqaHqaFnlJNgyWdNO5hNnHp4XGK5hZh'),
    ('RMSbeauty', 'https://www.rmsbeauty.com/cdn/shop/files/RMS-LOGO-BLACK.png?v=1676461026&width=252')
) AS v(store_name, image_link)
WHERE LOWER(TRIM(s.name)) = LOWER(TRIM(v.store_name))
RETURNING s.id, s.name, s.image_link;

-- Verify all 11 stores before committing.
-- COMMIT;
-- ROLLBACK;
