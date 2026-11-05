SELECT id, name, categories_id
FROM public.products
WHERE name IN (
    'Maxi Maxi Toothbrush M-6688 Pack of 12',
    'Maxi Angular Soft Toothbrush(Pack Of 6)'
);


Move the two toothbrush products to the Others category

UPDATE public.products
SET categories_id = '5e3a37ea-428f-4c32-b8f3-e83d5099ab0b'
WHERE name IN (
    'Maxi Maxi Toothbrush M-6688 Pack of 12',
    'Maxi Angular Soft Toothbrush(Pack Of 6)'
)
RETURNING id, name, categories_id;