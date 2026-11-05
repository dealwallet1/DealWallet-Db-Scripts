SELECT * FROM public.stores
WHERE name = 'Typsy Beauty';

UPDATE public.stores
SET image_link = 'https://typsybeauty.com/cdn/shop/files/new-logo-pink-st.png?v=1764591713&width=400'
WHERE name = 'Typsy Beauty'
RETURNING id, name, image_link;