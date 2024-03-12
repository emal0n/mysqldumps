drop database locacar;
create database locacar;
use locacar;

-- tables
CREATE TABLE cliente (
cli_id             INT PRIMARY KEY AUTO_INCREMENT,
cli_nome           VARCHAR(100),
cli_telefone       DECIMAL(11),
cli_cpf            DECIMAL(12,0),
cli_email          VARCHAR(100), 
		           UNIQUE (cli_cpf) );

CREATE TABLE automovel (
auto_id            INT PRIMARY KEY AUTO_INCREMENT,
auto_marca         VARCHAR(10),
auto_nome          VARCHAR(100),
auto_categoria     VARCHAR(100),
auto_ano           VARCHAR(4),
auto_placa         VARCHAR(8),
auto_cor           VARCHAR(10),
auto_cambio        VARCHAR(1),
auto_valor         INT );

CREATE TABLE vendedor (
vende_id           INT PRIMARY KEY AUTO_INCREMENT,
vende_nome         VARCHAR(100),
vende_nascimento   DATE,
vende_cpf          DECIMAL(12,0),
vende_telefone     DECIMAL(11), 
                   UNIQUE (vende_cpf) );

create table vendas (
venda_id           INT PRIMARY KEY AUTO_INCREMENT,
venda_cliente      VARCHAR(100),
venda_data         DATE,
venda_marca        VARCHAR(10),
venda_modelo       VARCHAR(10),
venda_categoria    VARCHAR(100),
venda_total        INT,
venda_fpag         VARCHAR(100),
venda_quantidade   INT,
venda_vendedor     VARCHAR(100),
venda_fk_cliente   INT, 
venda_fk_vendedor  INT );

create table venda_veiculo_disponivel (
vendv_id           INT PRIMARY KEY AUTO_INCREMENT,
vendv_nome         VARCHAR(20),
vendv_marca        VARCHAR(20),
vendv_quantidade   INT,
vendv_fk_venda     INT,
vendv_fk_automovel INT );

create table forma_de_pagamento (
formpag_id         INT PRIMARY KEY AUTO_INCREMENT,
formpag_nome       VARCHAR(100),
formpag_fk_cliente INT,
formpag_fk_vend    INT );

create table recebimento (
rec_id             INT PRIMARY KEY AUTO_INCREMENT,
rec_data           DATE,
rec_valor          DECIMAL(15,4),
rec_fk_formpag     INT,
rec_fk_vendas      INT );

ALTER TABLE vendas ADD FOREIGN KEY (venda_fk_cliente) REFERENCES cliente (cli_id);
ALTER TABLE vendas ADD FOREIGN KEY (venda_fk_vendedor) REFERENCES vendedor (vende_id);
ALTER TABLE venda_veiculo_disponivel ADD FOREIGN KEY (vendv_fk_venda) REFERENCES vendas (venda_id);
ALTER TABLE venda_veiculo_disponivel ADD FOREIGN KEY (vendv_fk_automovel) REFERENCES automovel (auto_id);
ALTER TABLE recebimento ADD FOREIGN KEY (rec_fk_formpag) REFERENCES forma_de_pagamento (formpag_id);
ALTER TABLE recebimento ADD FOREIGN KEY (rec_fk_vendas) REFERENCES vendas (venda_id);
ALTER TABLE forma_de_pagamento ADD FOREIGN KEY (rec_fk_formpag) REFERENCES forma_de_pagamento (formpag_id);
ALTER TABLE forma_de_pagamento ADD FOREIGN KEY (rec_fk_vendas) REFERENCES vendas (venda_id);

insert into automovel (auto_marca, auto_nome, auto_categoria, auto_ano, auto_placa, auto_cor, auto_cambio, auto_valor)
values 
('HONDA', 'NSX', 'Esportivo', '2016', 'PJK75932', 'PRETO', 'M', '241000000'),
('TOYOTA', 'AE86', 'Esportivo','2012', 'P1072932', 'BRANCO', 'M', '200000'),
('FERRARI', 'F40', 'Esportivo / Luxo', '2010', 'PJQ76932', 'VERMELHA', 'M', '541000000'),
('TOYOTA', 'MK4', 'Esportivo','2012', 'P1075932', 'LARANJA', 'M', '141000000'),
('FERRARI', 'ENZO', 'Esportivo / Luxo', '2010', 'PJQ76932', 'PRETA', 'M', '104100000');

SELECT * FROM automovel;

insert into venda_veiculo_disponivel (vendv_marca, vendv_quantidade)
values 
('HONDA', '2'),
('TOYOTA', '1'),
('FERRARI', '2');

SELECT * FROM venda_veiculo_disponivel;

SELECT sum(vendv_quantidade) as total
FROM venda_veiculo_disponivel
WHERE vendv_marca = 'FERRARI';

SELECT avg(auto_valor) as media
FROM automovel;

SELECT max(auto_valor) as maior_valor
from automovel;

insert into vendedor (vende_nome, vende_nascimento, vende_cpf, vende_telefone)
values 
('adenilson', '20000429', '07988876519', '75981680785');

insert into vendas (venda_cliente, venda_data, venda_marca, venda_modelo, venda_categoria, venda_total, venda_fpag, venda_quantidade, venda_vendedor)
values 
('roberto', '20240312', 'HONDA', 'NSX', 'Esportivo', '241000000','pix', '1', 'adenilson');

SELECT * FROM vendas;

SELECT * FROM forma_de_pagamento;

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