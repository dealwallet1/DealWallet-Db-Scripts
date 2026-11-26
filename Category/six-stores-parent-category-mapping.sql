BEGIN;

WITH category_mapping(store_name, category_id) AS (
    VALUES
        ('Broomees', '763737ba-51cd-4c97-ac07-c2942e59b9f1'::UUID),
        ('Buds & Berries', '96b5c3bb-c9e4-4d0f-aaa7-975e6b0b48f5'::UUID),
        ('Friends Adult Diapers', '5352c50c-a00f-4fa6-ad26-6ecec7e35d80'::UUID),
        ('Kicky & Perky', 'd29a775f-be9a-425b-8390-4e2777ed9093'::UUID),
        ('Miduty', '5352c50c-a00f-4fa6-ad26-6ecec7e35d80'::UUID),
        ('Voot Kids', 'c76edd97-0d69-4f57-a311-96cf99b9ca91'::UUID)
)
UPDATE public.stores AS s
SET category_id = cm.category_id
FROM category_mapping AS cm
WHERE LOWER(TRIM(s.name)) = LOWER(TRIM(cm.store_name))
  AND s.category_id IS DISTINCT FROM cm.category_id
RETURNING
    s.id,
    s.name,
    s.category_id;

-- Review the updated records before committing.
-- COMMIT;
-- ROLLBACK;