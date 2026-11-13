BEGIN;

-- 1. SEARCH: price_history
SELECT id, name, image_link
FROM public.price_history
WHERE image_link = 'https://yardleyoflondon.com/cdn/shop/files/Logo.png?v=1745318552&width=540';

-- 2. SEARCH: products
SELECT id, name, image_link
FROM public.products
WHERE image_link = 'https://yardleyoflondon.com/cdn/shop/files/Logo.png?v=1745318552&width=540';

-- 3. DELETE: price_history FIRST
DELETE FROM public.price_history
WHERE image_link = 'https://yardleyoflondon.com/cdn/shop/files/Logo.png?v=1745318552&width=540'
RETURNING id, name, image_link;

-- 4. DELETE: products NEXT
DELETE FROM public.products
WHERE image_link = 'https://yardleyoflondon.com/cdn/shop/files/Logo.png?v=1745318552&width=540'
RETURNING id, name, image_link;

-- 5. FINAL VERIFICATION: Both tables
SELECT
    'price_history' AS table_name,
    COUNT(*) AS remaining_records
FROM public.price_history
WHERE image_link = 'https://yardleyoflondon.com/cdn/shop/files/Logo.png?v=1745318552&width=540'

UNION ALL

SELECT
    'products' AS table_name,
    COUNT(*) AS remaining_records
FROM public.products
WHERE image_link = 'https://yardleyoflondon.com/cdn/shop/files/Logo.png?v=1745318552&width=540';

COMMIT;