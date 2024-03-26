-- orbita COPYRIGHT, baseada em uma pastelaria - by:ed

-- 1

-- 2

-- 3
SELECT Cardapio_sabor
FROM   Cardapio
WHERE  Cardapio_sabor like '%Bacon%';

SELECT Cardapio_sabor
FROM   Cardapio
WHERE  Cardapio_sabor like '%Queijo%';

SELECT Cardapio_sabor
FROM   Cardapio
WHERE  Cardapio_sabor like '%Bacon%'
AND    Cardapio_sabor like '%Queijo%';
--

-- 4

-- 5

-- 6