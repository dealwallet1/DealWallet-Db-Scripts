
-- =====================================================
-- Update Nivea and RMSbeauty store image links
-- =====================================================

WITH logo_updates(store_name, image_link) AS (
    VALUES
    (
        'Nivea',
        'https://logos-world.net/wp-content/uploads/2020/12/Nivea-Logo.jpg'
    ),
    (
        'RMSbeauty',
        'https://www.rmsbeauty.com/cdn/shop/files/RMS-LOGO-BLACK.png?v=1676461026&width=252'
    )
),

updated AS (
    UPDATE public.stores AS s
    SET image_link = l.image_link
    FROM logo_updates AS l
    WHERE LOWER(TRIM(s.name)) = LOWER(TRIM(l.store_name))
      AND s.image_link IS DISTINCT FROM l.image_link
    RETURNING s.id, s.name, s.image_link
)

SELECT
    COUNT(*) AS updated_count,
    STRING_AGG(name, ', ') AS updated_stores
FROM updated;
