DELETE FROM public.price_history
WHERE name = 'Blue Poly Filled Cotton Mouse Toy'
RETURNING id, name, price, original_price, discount, store_id;


DELETE FROM public.products
WHERE name = 'Blue Poly Filled Cotton Mouse Toy'
RETURNING id, name, price, original_price, discount, store_id;