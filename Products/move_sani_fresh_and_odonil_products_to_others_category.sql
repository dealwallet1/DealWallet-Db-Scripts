SELECT id, name, categories_id
FROM public.products
WHERE name IN (
    'Sani Fresh Advanced Toilet Cleaner (Free Odonil 48g) - 1L',
    'Odonil Zipper Mix Pack (Rs 40 Off) - 50g (Pack of 5)',
    'Odonil Air Freshener Blocks Mix Pack (Rs 50 Off) - 72g',
    'Odonil Air Freshener Blocks Mix Pack (Rs 40 Off) - 48g'
)
ORDER BY name;


UPDATE public.products
SET categories_id = '5e3a37ea-428f-4c32-b8f3-e83d5099ab0b'
WHERE name IN (
    'Sani Fresh Advanced Toilet Cleaner (Free Odonil 48g) - 1L',
    'Odonil Zipper Mix Pack (Rs 40 Off) - 50g (Pack of 5)',
    'Odonil Air Freshener Blocks Mix Pack (Rs 50 Off) - 72g',
    'Odonil Air Freshener Blocks Mix Pack (Rs 40 Off) - 48g'
)
RETURNING id, name, categories_id;


SELECT id, name, categories_id
FROM public.products
WHERE name IN (
    'Sani Fresh Advanced Toilet Cleaner (Free Odonil 48g) - 1L',
    'Odonil Zipper Mix Pack (Rs 40 Off) - 50g (Pack of 5)',
    'Odonil Air Freshener Blocks Mix Pack (Rs 50 Off) - 72g',
    'Odonil Air Freshener Blocks Mix Pack (Rs 40 Off) - 48g'
)
AND categories_id = '5e3a37ea-428f-4c32-b8f3-e83d5099ab0b';