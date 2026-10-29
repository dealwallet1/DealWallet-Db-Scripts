SELECT id, name, image_link
FROM public.stores
WHERE name = 'Jeena Sikho';

UPDATE public.stores
SET image_link = 'https://jeenasikho.com/wp-content/uploads/2025/06/logo.png'
WHERE name = 'Jeena Sikho'
RETURNING id, name, image_link;