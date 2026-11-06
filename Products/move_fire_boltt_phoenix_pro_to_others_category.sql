SELECT id, name, categories_id
FROM public.products
WHERE name = 'Fire-Boltt Phoenix Pro';


UPDATE public.products
SET categories_id = '5e3a37ea-428f-4c32-b8f3-e83d5099ab0b'
WHERE name = 'Fire-Boltt Phoenix Pro'
RETURNING id, name, categories_id;

SELECT id, name, categories_id
FROM public.products
WHERE name = 'Fire-Boltt Phoenix Pro';