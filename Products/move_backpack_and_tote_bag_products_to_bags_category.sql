SELECT id, name, categories_id
FROM public.products
WHERE name IN (
    'Fancy Men Backpacks',
    'Fancy Designer Kids Unisex Bags & Backpacks',
    'Gorgeous Attractive Women Backpacks',
    'Classy Men Backpacks',
    'Trendy Backpacks',
    'Fabric Women Tote Bags',
    'Backpacks',
    'Elegant Classy Women Backpacks',
    'Ravishing Alluring Women Backpacks',
    'Elegant Attractive Women Backpacks',
    'Ravishing Men Backpacks'
)
ORDER BY name;



UPDATE public.products
SET categories_id = '62c03fd8-f077-4f3e-8894-b6852afbd588'
WHERE name IN (
    'Fancy Men Backpacks',
    'Fancy Designer Kids Unisex Bags & Backpacks',
    'Gorgeous Attractive Women Backpacks',
    'Classy Men Backpacks',
    'Trendy Backpacks',
    'Fabric Women Tote Bags',
    'Backpacks',
    'Elegant Classy Women Backpacks',
    'Ravishing Alluring Women Backpacks',
    'Elegant Attractive Women Backpacks',
    'Ravishing Men Backpacks'
)
RETURNING id, name, categories_id;


SELECT id, name, categories_id
FROM public.products
WHERE name IN (
    'Fancy Men Backpacks',
    'Fancy Designer Kids Unisex Bags & Backpacks',
    'Gorgeous Attractive Women Backpacks',
    'Classy Men Backpacks',
    'Trendy Backpacks',
    'Fabric Women Tote Bags',
    'Backpacks',
    'Elegant Classy Women Backpacks',
    'Ravishing Alluring Women Backpacks',
    'Elegant Attractive Women Backpacks',
    'Ravishing Men Backpacks'
)
AND categories_id = '62c03fd8-f077-4f3e-8894-b6852afbd588';