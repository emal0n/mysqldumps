SELECT sum(vendv_quantidade) as total
FROM venda_veiculo_disponivel
WHERE vendv_marca = 'FERRARI';

SELECT avg(auto_valor) as media
FROM automovel;

SELECT max(auto_valor) as maior_valor
from automovel;

SELECT sum(venda_quantidade) as quantidade
FROM vendas;

SELECT sum(venda_total) as lucro
FROM vendas;

SELECT max(venda_vendedor) as vendedor_do_mes
FROM vendas
WHERE venda_quantidade;

SELECT max(venda_cliente) as comprador_do_mes
FROM vendas
WHERE venda_quantidade;

SELECT max(venda_categoria) as categoria_mais_vendida
FROM vendas
WHERE venda_quantidade;

SELECT max(venda_data) as categoria_mais_vendida
FROM vendas
WHERE venda_quantidade;