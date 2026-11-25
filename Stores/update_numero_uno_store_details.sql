SELECT * FROM public.stores
WHERE name = 'Numero Uno'


UPDATE public.stores
SET
    store_link = 'https://www.numerounojeanswear.com/',
    image_link = 'https://cdn.shopify.com/s/files/1/0775/6700/0893/files/Numero_Logo_White_1.png?v=1785300239',
	link = 'https://www.numerounojeanswear.com/',
	website = 'https://www.numerounojeanswear.com/'
WHERE name = 'Numero Uno'
RETURNING id, name, store_link, image_link, link, website;