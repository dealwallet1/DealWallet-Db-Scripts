BEGIN;

WITH category_mapping(store_name, category_id) AS (
    VALUES
        ('ASAP Tickets', '32d9b7ab-1330-497b-ab05-276b80e7fdfe'::UUID),
        ('Disney Store', 'a264cb33-226b-4495-8f78-d70a73c9f066'::UUID),
        ('Nobero', 'adc60933-703a-4ba1-838f-dcf70e7b7cae'::UUID),
        ('Zivame', 'adc60933-703a-4ba1-838f-dcf70e7b7cae'::UUID)
)
UPDATE public.stores AS s
SET category_id = cm.category_id
FROM category_mapping AS cm
WHERE LOWER(TRIM(s.name)) = LOWER(TRIM(cm.store_name))
  AND s.category_id IS DISTINCT FROM cm.category_id
RETURNING s.id, s.name, s.category_id;

-- COMMIT;
-- ROLLBACK;