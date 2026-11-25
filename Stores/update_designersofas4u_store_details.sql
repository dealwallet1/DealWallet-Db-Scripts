SELECT * FROM public.stores
WHERE name = 'Designersofas4u'

UPDATE public.stores
SET
    store_link = 'https://www.designersofas4u.co.uk/',
    image_link = 'https://images.easyfundraising.org.uk/retailer/cropped/logo-designer-sofas-4u-1579258661.png',
    link = 'https://www.designersofas4u.co.uk/',
    website = 'https://www.designersofas4u.co.uk/',
    category_id = '0774861f-0937-41d6-bda4-e7d9718c14d2'
WHERE name = 'Designersofas4u'
RETURNING id, name, store_link, image_link, link, website, category_id;