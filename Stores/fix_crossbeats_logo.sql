SELECT * FROM public.stores
WHERE name = 'Crossbeats';

UPDATE public.stores
SET image_link = 'https://tse2.mm.bing.net/th/id/OIP.RZ5rC-lpB4jfUjLrYDeeuAHaD5?r=0&pid=Api&h=220&P=0'
WHERE name = 'Crossbeats'
RETURNING id, name, image_link;

