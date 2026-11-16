SELECT COUNT(*) AS total_products, COUNT(*) FILTER ( WHERE discount IS NOT NULL AND discount >= 0 ) AS valid_deals, COUNT(*) FILTER ( WHERE discount IS NULL ) AS null_discount, COUNT(*) FILTER ( WHERE discount < 0 ) AS negative_discount FROM public.products;

DELETE FROM public.products
WHERE discount IS NULL
   OR discount < 0
RETURNING id, name, discount;


SELECT
    COUNT(*) AS total_products,
    COUNT(*) FILTER (WHERE discount IS NULL) AS null_discount,
    COUNT(*) FILTER (WHERE discount < 0) AS negative_discount
FROM public.products;