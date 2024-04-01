insert into automovel (
auto_marca, 
auto_nome, 
auto_categoria, 
auto_ano, 
auto_placa, 
auto_cor, 
auto_cambio, 
auto_valor )
values (
'HONDA', 
'NSX', 
'Esportivo', 
'2016', 
'PJK75932', 
'PRETO', 
'M', 
'241000000'),
('TOYOTA', 
'AE86', 
'Esportivo',
'2012', 
'P1072932', 
'BRANCO', 
'M', 
'200000'),
('FERRARI', 
'F40', 
'Esportivo / Luxo', 
'2010', 
'PJQ76932', 
'VERMELHA', 
'M', 
'541000000'),
('TOYOTA', 
'MK4', 
'Esportivo',
'2012', 
'P1075932', 
'LARANJA', 
'M', 
'141000000'),
('FERRARI', 
'ENZO', 
'Esportivo / Luxo', 
'2010', 
'PJQ76932', 
'PRETA', 
'M', 
'104100000');
SELECT * FROM automovel;

insert into venda_veiculo_disponivel (
vendv_marca, 
vendv_quantidade )
values (
'HONDA', 
'2' ),
('TOYOTA', 
'1' ),
('FERRARI', 
'2' );
SELECT * FROM venda_veiculo_disponivel;

insert into vendedor (
vende_nome, 
vende_nascimento, 
vende_cpf, 
vende_telefone )
values (
'adenilson', 
'20000429', 
'07988876519', 
'75981680785' );

SELECT * FROM vendedor;

insert into vendas (
venda_cliente, 
venda_data, 
venda_marca, 
venda_modelo, 
venda_categoria, 
venda_total, 
venda_fpag, 
venda_quantidade, 
venda_vendedor )
values 
(
'roberto', 
'20240312', 
'HONDA', 
'NSX', 
'Esportivo', 
'241000000',
'pix', 
'1', 
'adenilson' );

SELECT * FROM vendas;