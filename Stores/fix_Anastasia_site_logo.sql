UPDATE public.stores
SET image_link = 'https://s.yimg.com/zb/imgv1/8cc47e4f-2e68-3606-addd-41f5dd533ce8/t_500x300'
WHERE name = 'Anastasia Beverly Hills'
RETURNING id, name, image_link;