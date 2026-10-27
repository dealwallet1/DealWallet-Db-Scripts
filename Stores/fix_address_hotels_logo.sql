SELECT * FROM public.stores
WHERE name = 'Address Hotels';

UPDATE public.stores
SET image_link = 'updated link here'
WHERE name = 'Address Hotels'
RETURNING id, name, image_link;