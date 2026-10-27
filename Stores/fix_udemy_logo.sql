UPDATE public.stores
SET image_link = 'https://s.yimg.com/zb/imgv1/cae1d314-f778-3f0f-baae-a2af463c042f/t_500x300'
WHERE name = 'Udemy'
RETURNING id, name, image_link;