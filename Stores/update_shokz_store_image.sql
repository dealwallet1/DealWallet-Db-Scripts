SQL Queries:

Step 1: Check the existing store record

SELECT *
FROM public.stores
WHERE name = 'Shokz';

Step 2: Update the store image

UPDATE public.stores
SET image_link = 'https://images.seeklogo.com/logo-png/50/1/shokz-logo-png_seeklogo-508691.png'
WHERE name = 'Shokz'
RETURNING id, name, image_link;