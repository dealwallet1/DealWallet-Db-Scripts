SELECT * FROM public.stores
WHERE name = 'Cosmic Byte'


UPDATE public.stores
SET image_link = 'https://cdn.browsercam.com/img/com.vajro.thecosmicbyte-header.png'
WHERE name = 'Cosmic Byte'
RETURNING id, name, image_link;


SELECT * FROM public.stores
WHERE name = 'Bonkers Corner'


UPDATE public.stores
SET image_link = 'https://play-lh.googleusercontent.com/HAgF3XudT86JOdFgMzbAuarlW66oxTT-IgU9723gxMFUGsubSLuFfZNPd3405saI888'
WHERE name = 'Bonkers Corner'
RETURNING id, name, image_link;