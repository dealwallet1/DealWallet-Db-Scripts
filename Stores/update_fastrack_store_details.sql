UPDATE public.stores
SET
    store_link = 'https://www.fastrack.in/',
    link = 'https://www.fastrack.in/',
    website = 'https://www.fastrack.in/',
    category_id = 'd29a775f-be9a-425b-8390-4e2777ed9093'::UUID
WHERE name = 'Fastrack'
RETURNING id, name, store_link, link, website, category_id;