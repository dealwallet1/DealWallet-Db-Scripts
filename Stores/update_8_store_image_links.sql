BEGIN;

UPDATE public.stores AS s
SET image_link = v.image_link
FROM (VALUES
    (
        'Bonkers Corner',
        'https://play-lh.googleusercontent.com/HAgF3XudT86JOdFgMzbAuarlW66oxTT-IgU9723gxMFUGsubSLuFfZNPd3405saI888'
    ),
    (
        'Happilo',
        'https://img-cdn.thepublive.com/fit-in/1280x960/filters:format(webp)/bmi/media/post_banners/5d70bfe3b097fc5c5cc146213b535774edfa03823d2f249a67c99f11639ddb4b.jpg'
    ),
    (
        'Reliance Digital',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1TBBiGMA5D-xe19tLX983B4Z-d73jvcE_BYm7nIkulytKimhwDMn_KX0&s=10'
    ),
    (
        'Solara',
        'https://www.solara.in/cdn/shop/files/HB_1.png?v=1687413187&width=2048'
    ),
    (
        'Neemans',
        'https://tse4.mm.bing.net/th/id/OIP.eOqWabNAG9AC3NvjSC7zJAHaHa?r=0&pid=Api&h=220&P=0'
    ),
    (
        'Jack & Jones Junior',
        'https://www.infinitimall.com/wp-content/uploads/2022/01/jackjones_junior_logo-Inifniti-Mall.png'
    ),
    (
        'P&G Shop',
        'https://images.ctfassets.net/oggad6svuzkv/3IhRGTbqeFSOUfJL51dHXc/9e340ccc529d6f1fdc5d799b9a05628b/P_G_Logo.png'
    ),
    (
        'Sepoy & Co.',
        'https://cdn.shopify.com/s/files/1/0028/4888/2753/files/logo_e7c27e36-2cd2-435b-af99-cb1d3f2a6fc1.png?height=628&pad_color=fff&v=1570523936&width=1200'
    )
) AS v(store_name, image_link)
WHERE s.name = v.store_name;

COMMIT;

-- Verify updated store image links
SELECT name, image_link
FROM public.stores
WHERE name IN (
    'Bonkers Corner',
    'Happilo',
    'Reliance Digital',
    'Solara',
    'Neemans',
    'Jack & Jones Junior',
    'P&G Shop',
    'Sepoy & Co.'
)
ORDER BY name;