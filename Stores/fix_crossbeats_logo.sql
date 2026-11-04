-- ==========================================================
-- Task: Update Crossbeats Store Logo
-- Table: public.stores
-- Description:
-- Retrieve the Crossbeats store details and update its
-- image_link with the provided store logo URL.
-- Verify the updated logo URL after execution.
-- ==========================================================

-- Step 1: Retrieve the existing Crossbeats store details
SELECT *
FROM public.stores
WHERE name = 'Crossbeats';


-- Step 2: Update the Crossbeats store logo URL
UPDATE public.stores
SET image_link = 'https://tse2.mm.bing.net/th/id/OIP.RZ5rC-lpB4jfUjLrYDeeuAHaD5?r=0&pid=Api&h=220&P=0'
WHERE name = 'Crossbeats'
RETURNING id, name, image_link;


-- ==========================================================
-- End of Crossbeats Store Logo Update
-- ==========================================================