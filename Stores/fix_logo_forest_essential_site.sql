SELECT * FROM public.stores
WHERE name = 'Forest essentials';

UPDATE public.stores
SET image_link = 'https://www.brandcolorcode.com/media/forest-essentials-logo.png'
WHERE name = 'Forest essentials'
RETURNING id, name, image_link;