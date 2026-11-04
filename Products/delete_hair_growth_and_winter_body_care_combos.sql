SELECT *
FROM public.products
WHERE LOWER(BTRIM(name)) IN (
    'hair growth combo',
    'winter body care combo'
);


SELECT *
FROM public.price_history
WHERE LOWER(BTRIM(name)) IN (
    'hair growth combo',
    'winter body care combo'
)
OR product_id IN (
    SELECT id
    FROM public.products
    WHERE LOWER(BTRIM(name)) IN (
        'hair growth combo',
        'winter body care combo'
    )
);


BEGIN;

CREATE TEMP TABLE products_to_delete
ON COMMIT DROP AS
SELECT id
FROM public.products
WHERE LOWER(BTRIM(name)) IN (
    'hair growth combo',
    'winter body care combo'
);

-- Delete related price history records first
DELETE FROM public.price_history
WHERE product_id IN (
    SELECT id FROM products_to_delete
)
OR LOWER(BTRIM(name)) IN (
    'hair growth combo',
    'winter body care combo'
);

-- Delete products
DELETE FROM public.products
WHERE id IN (
    SELECT id FROM products_to_delete
)
RETURNING id, name;

COMMIT;