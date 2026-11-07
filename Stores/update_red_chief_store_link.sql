-- Step 1: Check the existing Red Chief store details
SELECT id, name, store_link
FROM public.stores
WHERE name = 'Red Chief';


-- Step 2: Update the store_link
UPDATE public.stores
SET store_link = 'https://redchief.in/'
WHERE name = 'Red Chief'
RETURNING id, name, store_link;


-- Step 3: Verify the updated store link
SELECT id, name, store_link
FROM public.stores
WHERE name = 'Red Chief';