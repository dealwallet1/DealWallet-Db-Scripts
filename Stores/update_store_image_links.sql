-- Store image_link update. NULL ki URL paste chey ('https://...'), NULL unnavi skip avthayi.
-- Kotha stores add cheyyalante ila oka line add chey:  ('Store Name', 'https://...'),

-- Preview
WITH fixes(store_name, url) AS (VALUES
  ('Ajmal Perfumes',   NULL::text),
  ('Elf Cosmetics',    NULL),
  ('Elitty beauty',    NULL),
  ('Fenty Beauty',     NULL),
  ('Fullshine',        NULL),
  ('Google Workspace', NULL),
  ('Vanity Wagon',     NULL),
  ('Samsung',          NULL),
  ('Reliance Digital', NULL),
  ('Oneplus',          NULL),
  ('Bonkers Corner',   NULL),
  ('Dyson',            NULL),
  ('Puma',             NULL),
  ('Cosmic',           NULL),
  ('Blackberrys',      NULL),
  ('VIP Bags',         NULL)
)
SELECT s.id, s.name, s.image_link AS old_image_link, l.url AS new_image_link
FROM fixes l
LEFT JOIN public.stores s ON s.name = l.store_name
WHERE l.url IS NOT NULL;

-- Update
WITH fixes(store_name, url) AS (VALUES
  ('Ajmal Perfumes',   NULL::text),
  ('Elf Cosmetics',    NULL),
  ('Elitty beauty',    NULL),
  ('Fenty Beauty',     NULL),
  ('Fullshine',        NULL),
  ('Google Workspace', NULL),
  ('Vanity Wagon',     NULL),
  ('Samsung',          NULL),
  ('Reliance Digital', NULL),
  ('Oneplus',          NULL),
  ('Bonkers Corner',   NULL),
  ('Dyson',            NULL),
  ('Puma',             NULL),
  ('Cosmic',           NULL),
  ('Blackberrys',      NULL),
  ('VIP Bags',         NULL)
)
UPDATE public.stores s
SET image_link = l.url
FROM fixes l
WHERE s.name = l.store_name
  AND l.url IS NOT NULL
RETURNING s.id, s.name, s.image_link;