SELECT * FROM public.stores
WHERE name = 'Fireflies';

UPDATE public.stores
SET image_link = 'https://mms.businesswire.com/media/20250915520061/en/2578240/22/Fireflies_logo_-_full.jpg'
WHERE name = 'Fireflies'
RETURNING id, name, image_link;