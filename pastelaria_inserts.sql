-- orbita COPYRIGHT, baseada em uma pastelaria - by:ed
-- inserts cliente

insert into Cliente (
 cliente_nome_completo,
 cliente_apelido,
 cliente_nascimento,
 cliente_telefone,
 cliente_email,
 cliente_cpf,
 cliente_bairro,
 cliente_cidade,
 cliente_estado )
values (
'Robson Marques Santos', 
'Robson',
'20000612', 
'74981860402', 
'robsonm@hotmail.com', 
'09100088972', 
'Rua nova', 
'Feira de Santana', 
'BA'),
('Roberval Frank Gomes', 
'Frank',
'20000429', 
'85981820402', 
'frankg@hotmail.com', 
'09100066592', 
'Santa monica', 
'Feira de Santana', 
'BA' );

SELECT * FROM Cliente;

insert into Cardapio (
cardapio_produto,
cardapio_categoria,
cardapio_tipo,
cardapio_sabor,
cardapio_valor )
values (
'Pastel',
'Comida',
'Padrão', 
'Queijo e Presunto',
'10'),
('Pastel',
'Comida',
'Padrão', 
'Frango e Queijo',
'12'),
('Pastel',
'Comida',
'Padrão', 
'Calabresa e Frango',
'12'),
('Pastel',
'Comida',
'Padrão', 
'Calabresa, Frango e Bacon',
'15'),
('Pastel',
'Comida',
'Padrão', 
'Queijo, Frango e Bacon',
'15'),
('Pastel',
'Comida',
'Vegano', 
'Palmito',
'10'),
('Pastel',
'Comida',
'Vegano', 
'Abrobrinha',
'10'),
('Pastel',
'Comida',
'Vegano', 
'Brocolis',
'10'),
('Pastel',
'Comida',
'S/Lactose', 
'Carne',
'12'),
('Pastel',
'Comida',
'S/Lactose', 
'Carne moida',
'12'),
('Pastel',
'Comida',
'S/Lactose', 
'Peperoni',
'12'),
('Refrigerante',
'Bebida',
'Coca-Cola', 
'Café',
'3'),
('Refrigerante',
'Bebida',
'Coca-Cola', 
'Zero',
'3'),
('Refrigerante',
'Bebida',
'Coca-Cola', 
'Padrão',
'2'),
('Refrigerante',
'Bebida',
'Sprite', 
'Limão',
'3'),
('Suco',
'Bebida',
'Natural', 
'Laranja',
'5'),
('Suco',
'Bebida',
'Natural', 
'Limão',
'5'),
('Suco',
'Bebida',
'Natural', 
'Uva',
'5'),
('Suco',
'Bebida',
'Maratá', 
'Uva',
'3');

SELECT * FROM Cardapio;

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