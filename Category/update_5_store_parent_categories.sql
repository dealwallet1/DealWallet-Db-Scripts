BEGIN;

WITH category_mapping(store_name, category_id) AS (
    VALUES
        ('Shopy Vision', '2afd57d6-c614-4482-b9f1-78bbba75d335'::UUID),
        ('Cafago', '2afd57d6-c614-4482-b9f1-78bbba75d335'::UUID),
        ('Stacksocial', '79f2782c-1b6d-40a0-a812-af097ef61a0e'::UUID),
        ('JollyMax', 'c76edd97-0d69-4f57-a311-96cf99b9ca91'::UUID),
        ('Bajaj Finserv Market Plus', '2cedbfa8-77bb-49c8-9d13-0dff8dc30166'::UUID)
)
UPDATE public.stores AS s
SET category_id = cm.category_id
FROM category_mapping AS cm
WHERE LOWER(TRIM(s.name)) = LOWER(TRIM(cm.store_name))
  AND s.category_id IS DISTINCT FROM cm.category_id
RETURNING s.id, s.name, s.category_id;

-- COMMIT;
-- ROLLBACK;