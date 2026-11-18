-- Verify existing Kapiva store record
SELECT *
FROM public.stores
WHERE name = 'Kapiva';

-- Update Kapiva store image
UPDATE public.stores
SET image_link = 'https://www.businessoutreach.in/wp-content/uploads/2024/09/kapiva-1.png'
WHERE name = 'Kapiva'
RETURNING id, name, image_link;