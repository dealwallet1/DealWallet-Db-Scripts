-- Check the Sangeetha Mobile store records
SELECT *
FROM public.stores
WHERE LOWER(TRIM(name)) IN (
    'sangeetha mobile',
    'sangeetha mobiles'
);

DELETE FROM public.stores
WHERE name = 'Sangeetha Mobiles';

-- Delete only after confirming the duplicate record.
-- Replace the condition with the verified unique store ID.