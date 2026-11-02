SELECT * FROM public.stores
WHERE name = 'Lakme'


UPDATE public.stores
SET image_link = 'https://logos-world.net/wp-content/uploads/2020/09/Lakme-Logo-2011-2019.png'
WHERE name = 'Lakme'
RETURNING id, name, image_link;


SELECT * FROM public.stores
WHERE name = 'Body Cupid'

UPDATE public.stores
SET image_link = 'https://play-lh.googleusercontent.com/HAgF3XudT86JOdFgMzbAuarlW66oxTT-IgU9723gxMFUGsubSLuFfZNPd3405saI888'
WHERE name = 'Body Cupid'
RETURNING id, name, image_link;