
-- ============================================================
-- DealWallet: Store Image Link Updates and Invalid Store Cleanup
-- Table: public.stores
-- Total image updates: 30
-- Store deletions: 2
-- ============================================================

BEGIN;

-- 1. Update store image links

UPDATE public.stores AS s
SET image_link = v.image_link
FROM (VALUES
    ('CakeZone', 'https://media.licdn.com/dms/image/v2/C560BAQE33fio5HeVdA/company-logo_200_200/company-logo_200_200/0/1662724811108/cakezone_logo?e=2147483647&v=beta&t=SxORV3Wo9Sq-PfjznUviLGb3WZoj5JHEzAq6B2X9-3o'),
    ('Allianz Assistance', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh0CWHNNL3zp5ogs807TqcpugS5e774-aAhvmyJflKTg&s=10'),
    ('Amrapali', 'https://www.chittorgarh.net/images/ipo/amrapali_capital_logo.png'),
    ('Sleepy Owl', 'https://sleepyowl.co/cdn/shop/files/logo_107a2c0c-7f30-46ef-b852-05b27807f310_110x@2x.png?v=1629351406'),
    ('Archies', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHkzcnELaUMFyuLHNnJ8I4xGSvZRz83VJpV7XGUuckLA&s=10'),
    ('Argos', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqMNgZ1Z8EFFmsIgO9Eku7BNbhkStyG44QtDrb-bcP3Q&s=10'),
    ('Atlys', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp1usiZGOHGUg8CqHErsDAGOgNx5p4jxB29RqBtRtWIg&s=10'),
    ('Barbeque Nation', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhwyEvvVob-JR20AaPP5UZML2K_E-w2djnKVYhZdYVoA&s=10'),
    ('Akool', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTR4gFgWX8tDJXauUNeVEmmJVKFeamPZ3sKfotlAPM69w&s=10'),
    ('Beatxp', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxD-2ylOh7SptpRC2_C3tDPnI9jp0P9VMm1t4C-sjjpA&s=10'),
    ('True Elements', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeCvy1ohNfttN_tGhWM7ToGK22xYnVldCFtS0azKwhYQ&s=10'),
    ('Blinglane', 'https://blinglane.com/cdn/shop/files/Blinglane_Logo_final_transparent_500-R-3.png?v=1794371664&width=1920'),
    ('BonOrganik', 'https://bonorganik.in/cdn/shop/files/Bonorganik_web_logo.png?v=1752747795'),
    ('CogniFit', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXngRk-uM4gnjCMBDdlsm_jSP--zRHXLby1YXylydd&s'),
    ('Coitonic', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnZU9n6dQTnS1KMlrcbMkHE_UZdSxq9n8RDZAU5RlQ2w&s=10'),
    ('Colors Queen', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeQjpHdsivEX4fiEBxCX5MdrSDCLbe5uZdnQLNtbOxJw&s'),
    ('Corel', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd4em7mgJ65rqxu6ccE_UEmyxhuU2w0NGsC5yXdOJ0A&s=10'),
    ('Creatify', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhbUefozidfcFWcSAOP5bG3IRoM7ly2uznU08Nhn89Mg&s=10'),
    ('Cromostyle', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRanD8meVHsqe3odaSaU1eLOhMXf2iauIsSQqFUaaMR3A&s'),
    ('Cybeart', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEobnQZAvjSerDfoLOnJFR5TNf2POSe7YCPbLVNyXbejQpZxsNR2__HcY&s=10'),
    ('DPauls', 'https://cdn.grabon.in/gograbon/images/merchant/1773237436220/dpauls-logo.jpg'),
    ('Edugorilla', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwjlb5qSjdEJRK0JZtgrwsW6zFkywqHmRTVTdZN8UpqOP2RpgYKqbzEQ&s'),
    ('Epson', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCqO6oLY8hathyPOvUP3ioAfAJ4R6WOIXwSb-Lw9cWvw&s=10'),
    ('Evoto', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTumPc2xPpz_TYI0pBlRBckrfi_YVJU16j8bxoVSWcL2Q&s'),
    ('Fastmail', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJsYl8pec9kWJfNdXG73hlJDnT3XwLHKaTi6m0hsZyXA&s=10'),

    -- Additional 5 stores
    ('Bonkers Corner', 'https://play-lh.googleusercontent.com/HAgF3XudT86JOdFgMzbAuarlW66oxTT-IgU9723gxMFUGsubSLuFfZNPd3405saI888'),
    ('Happilo', 'https://img-cdn.thepublive.com/fit-in/1280x960/filters:format(webp)/bmi/media/post_banners/5d70bfe3b097fc5c5cc146213b535774edfa03823d2f249a67c99f11639ddb4b.jpg'),
    ('Reliance Digital', 'https://seeklogo.com/images/R/reliance-digital-logo-0385CDAFF6-seeklogo.com.png'),
    ('Solara', 'https://www.solara.in/cdn/shop/files/HB_1.png?v=1687413187&width=2048'),
    ('Neemans', 'https://tse4.mm.bing.net/th/id/OIP.eOqWabNAG9AC3NvjSC7zJAHaHa?r=0&pid=Api&h=220&P=0')
) AS v(store_name, image_link)
WHERE s.name = v.store_name;

COMMIT;


-- 2. Delete invalid stores
-- TechZone Electronics: non-working store
-- Alamode: light-colored logo

DELETE FROM public.stores
WHERE name IN (
    'TechZone Electronics',
    'Alamode'
);


-- 3. Verify all 30 updated store image links

SELECT
    name,
    image_link
FROM public.stores
WHERE name IN (
    'CakeZone',
    'Allianz Assistance',
    'Amrapali',
    'Sleepy Owl',
    'Archies',
    'Argos',
    'Atlys',
    'Barbeque Nation',
    'Akool',
    'Beatxp',
    'True Elements',
    'Blinglane',
    'BonOrganik',
    'CogniFit',
    'Coitonic',
    'Colors Queen',
    'Corel',
    'Creatify',
    'Cromostyle',
    'Cybeart',
    'DPauls',
    'Edugorilla',
    'Epson',
    'Evoto',
    'Fastmail',
    'Bonkers Corner',
    'Happilo',
    'Reliance Digital',
    'Solara',
    'Neemans'
)
ORDER BY name;


-- 4. Verify deleted stores

SELECT id, name
FROM public.stores
WHERE name IN (
    'TechZone Electronics',
    'Alamode'
);
