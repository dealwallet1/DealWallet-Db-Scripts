SQL Queries:

Step 1: Select the store record

SELECT *
FROM public.stores
WHERE name = 'Plum';

Step 2: Delete the store record

DELETE FROM public.stores
WHERE name = 'Plum';

Step 3: Verify deletion

SELECT *
FROM public.stores
WHERE name = 'Plum';