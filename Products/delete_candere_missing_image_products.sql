-- Task: Missing Product Images on Candere Store Deals Page
-- Candere deals page lo 22 products lo 10 ki "Image Not Found". Aa 10 products delete.

-- ===== 1) DIAGNOSTIC: Candere products lo image_link NULL/empty (broken URLs idi pattaledu) =====
SELECT p.id, p.name, p.image_link
FROM public.products p
JOIN public.stores s ON s.id = p.store_id
WHERE s.name ILIKE 'Candere'
  AND (p.image_link IS NULL OR p.image_link = '');

-- ===== 2) PREVIEW (10 rows ravali) =====
SELECT p.id, p.name, p.image_link
FROM public.products p
JOIN public.stores s ON s.id = p.store_id
WHERE s.name ILIKE 'Candere'
  AND p.name IN (
    'Three & Me Gold Chain Bracelet',
    'Tetris Gold Thumb Rings',
    'Love Kicks Gold Chain Bracelet',
    'Newly Weds Diamond Mangalsutra Bracelet',
    'Cowboy Diamond Flexi Necklace',
    'Giribala Infinity Heart Diamond Ring',
    'Aagni Diamond Mangalsutra Bracelet',
    'Fanny Diamond Layered Necklace',
    'Rings Solitaire Diamond Pendant',
    'Special Union Diamond Mangalsutra Ring'
  );

-- ===== 3) DELETE: price_history first =====
DELETE FROM public.price_history
WHERE product_id IN (
  SELECT p.id FROM public.products p
  JOIN public.stores s ON s.id = p.store_id
  WHERE s.name ILIKE 'Candere'
    AND p.name IN (
      'Three & Me Gold Chain Bracelet',
      'Tetris Gold Thumb Rings',
      'Love Kicks Gold Chain Bracelet',
      'Newly Weds Diamond Mangalsutra Bracelet',
      'Cowboy Diamond Flexi Necklace',
      'Giribala Infinity Heart Diamond Ring',
      'Aagni Diamond Mangalsutra Bracelet',
      'Fanny Diamond Layered Necklace',
      'Rings Solitaire Diamond Pendant',
      'Special Union Diamond Mangalsutra Ring'
    )
);

-- ===== 4) DELETE: products =====
DELETE FROM public.products
WHERE id IN (
  SELECT p.id FROM public.products p
  JOIN public.stores s ON s.id = p.store_id
  WHERE s.name ILIKE 'Candere'
    AND p.name IN (
      'Three & Me Gold Chain Bracelet',
      'Tetris Gold Thumb Rings',
      'Love Kicks Gold Chain Bracelet',
      'Newly Weds Diamond Mangalsutra Bracelet',
      'Cowboy Diamond Flexi Necklace',
      'Giribala Infinity Heart Diamond Ring',
      'Aagni Diamond Mangalsutra Bracelet',
      'Fanny Diamond Layered Necklace',
      'Rings Solitaire Diamond Pendant',
      'Special Union Diamond Mangalsutra Ring'
    )
)
RETURNING id, name;