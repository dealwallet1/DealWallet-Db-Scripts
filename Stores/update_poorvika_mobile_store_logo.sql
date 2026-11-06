SELECT * FROM public.stores
WHERE name = 'Poorvika Mobile';

UPDATE public.stores
SET image_link = 'https://mir-s3-cdn-cf.behance.net/project_modules/1400/e0d7e5103299599.5f4a7287b26c9.jpg'
WHERE name = 'Poorvika Mobile'
RETURNING id, name, image_link;