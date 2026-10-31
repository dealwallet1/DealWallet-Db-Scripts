SELECT * FROM public.stores
WHERE name = 'Eureka Forbes'


UPDATE public.stores
SET image_link = 'https://s.yimg.com/zb/imgv1/6bd126ef-7050-3697-8500-e190a9916b91/t_1024x1024'
WHERE name = 'Eureka Forbes'
RETURNING id, name, image_link;