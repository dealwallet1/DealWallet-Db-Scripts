
-- ============================================================
-- Fix HTML-encoded store names
-- Table: public.stores
-- ============================================================

BEGIN;

-- 1. Correct the five store names.
-- H&M is excluded because the correct name already exists.

UPDATE public.stores s
SET name = v.new_name
FROM (VALUES
    ('Jack &amp; Jones Junior', 'Jack & Jones Junior'),
    ('P&amp;G Shop',            'P&G Shop'),
    ('Sepoy &amp; Co.',         'Sepoy & Co.'),
    ('U&amp;i',                 'U&i'),
    ('Jack &amp; Jones',        'Jack & Jones')
) AS v(old_name, new_name)
WHERE s.name = v.old_name
AND NOT EXISTS (
    SELECT 1
    FROM public.stores existing
    WHERE existing.name = v.new_name
);

-- 2. Verify corrected store names.

SELECT id, name
FROM public.stores
WHERE name IN (
    'Jack & Jones Junior',
    'P&G Shop',
    'Sepoy & Co.',
    'U&i',
    'Jack & Jones',
    'H&M',
    'H&amp;M'
)
ORDER BY name;

-- 3. Check whether incorrect H&M store has linked products.

SELECT COUNT(*) AS linked_products
FROM public.products
WHERE store_id = '98fdbde3-eee9-4293-8ffd-f2149a3d23c2';

-- 4. Delete incorrect H&M only if no products reference it.
-- Preserve the correct H&M record.

DELETE FROM public.stores
WHERE id = '98fdbde3-eee9-4293-8ffd-f2149a3d23c2'
  AND name = 'H&amp;M'
  AND NOT EXISTS (
      SELECT 1
      FROM public.products
      WHERE store_id = '98fdbde3-eee9-4293-8ffd-f2149a3d23c2'
  );

-- 5. Verify final H&M records.

SELECT id, name
FROM public.stores
WHERE name IN ('H&M', 'H&amp;M');

COMMIT;
