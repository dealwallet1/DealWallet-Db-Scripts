SELECT * FROM public.stores
WHERE name = '12Go Asia';

UPDATE public.stores
SET image_link = 'https://images.seeklogo.com/logo-png/63/1/12go-logo-png_seeklogo-637816.png'
WHERE name = '12Go Asia'
RETURNING id, name, image_link , logo;