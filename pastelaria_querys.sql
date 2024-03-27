-- orbita COPYRIGHT, baseada em uma pastelaria - by:ed
-- 1
SELECT YEAR(FROM_DAYS(TO_DAYS(NOW())-TO_DAYS(cliente_nascimento))) AS Idade,
cliente_nome_completo as nome,
cliente_id 
FROM Cliente
join Produtos_registro on produtosreg_cliente_id = cliente_id
where produtosreg_pastel_id in (6, 7, 9)
group by cliente_id;
-- 
-- 2
SELECT produtosreg_cliente_id as cliente_id, produtosreg_data as data_pedido
FROM Produtos_registro
join Cliente on cliente_nome_completo = cliente_nome_completo
group by produtosreg_cliente_id
order by produtosreg_data desc;
--
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
SELECT sum(recebimento_valor) as total_vendido
FROM Recebimento;
--
-- 5
SELECT produtosreg_id as id_pedido,
produtosreg_pastel_id as pastel_id,
produtosreg_bebida_id as bebida_id
FROM   Produtos_registro
group by produtosreg_id; 
--
-- 6
SELECT max(produtosreg_pastel_quantidade) as quantidade,
produtosreg_id as id_compra,
produtosreg_pastel_id as pastel_id
FROM Produtos_registro
group by produtosreg_id
order by produtosreg_pastel_id asc; 
--