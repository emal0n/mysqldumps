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
auto_categoria     VARCHAR(100) );

CREATE TABLE vendedor (
vende_id           INT PRIMARY KEY AUTO_INCREMENT,
vende_nome         VARCHAR(100),
vende_nascimento   DATE,
vende_telefone     DECIMAL(11) );

create table vendas (
venda_id           INT PRIMARY KEY AUTO_INCREMENT,
venda_data         DATE,
venda_total        DECIMAL (15,4),
venda_fk_cliente   INT );

create table venda_veiculo (
vendv_id           INT PRIMARY KEY AUTO_INCREMENT,
vendv_total        DECIMAL(15,4),
vendv_quantidade   INT,
vendv_fk_venda     INT,
vendv_fk_automovel INT );

create table aluguel (
alu_id             INT PRIMARY KEY AUTO_INCREMENT,
alu_data_recebida  DATE,
alu_data_retirada  DATE,
alu_total          DECIMAL(15,4),
alu_formpag        VARCHAR(100),
alu_fk_cliente     INT,
alu_fk_vendedor    INT );

create table aluguel_veiculo (
aluv_id            INT PRIMARY KEY AUTO_INCREMENT,
aluv_km            INT(100),
aluv_total         DECIMAL(15,4),
aluv_fk_aluguel    INT,
aluv_fk_automovel  INT );

create table fornecedor (
forn_id            INT PRIMARY KEY AUTO_INCREMENT,
forn_nome          VARCHAR(100),
forn_cnpj          DECIMAL(12,0),
forn_telefone      VARCHAR(100),
				   UNIQUE (forn_cnpj) );

create table marca (
marca_id           INT PRIMARY KEY AUTO_INCREMENT,
marca_nome         VARCHAR(100) );

create table modelo (
model_id           INT PRIMARY KEY AUTO_INCREMENT,
model_nome         VARCHAR(100),
model_ano          DATE,
model_placa        VARCHAR(8),
model_cor          VARCHAR(10),
model_fk_automovel INT,
model_fk_marca     INT,
model_cambio       VARCHAR(100) );

create table forma_de_pagamento (
formpag_id         INT PRIMARY KEY AUTO_INCREMENT,
formpag_nome       VARCHAR(100) );

create table recebimento (
rec_id             INT PRIMARY KEY AUTO_INCREMENT,
rec_data           DATE,
rec_valor          DECIMAL(15,4),
rec_fk_formpag     INT,
rec_fk_vendas      INT );

ALTER TABLE vendas ADD FOREIGN KEY (venda_fk_cliente) REFERENCES cliente (cli_id);
ALTER TABLE venda_veiculo ADD FOREIGN KEY (vendv_fk_venda) REFERENCES vendas (venda_id);
ALTER TABLE venda_veiculo ADD FOREIGN KEY (vendv_fk_automovel) REFERENCES automovel (auto_id);
ALTER TABLE aluguel ADD FOREIGN KEY (alu_fk_cliente) REFERENCES cliente (cli_id);
ALTER TABLE aluguel ADD FOREIGN KEY (alu_fk_vendedor) REFERENCES vendedor (vende_id);
ALTER TABLE aluguel_veiculo ADD FOREIGN KEY (aluv_fk_aluguel) REFERENCES aluguel (alu_id);
ALTER TABLE aluguel_veiculo ADD FOREIGN KEY (aluv_fk_automovel) REFERENCES automovel (auto_id);
ALTER TABLE recebimento ADD FOREIGN KEY (rec_fk_formpag) REFERENCES forma_de_pagamento (formpag_id);
ALTER TABLE recebimento ADD FOREIGN KEY (rec_fk_vendas) REFERENCES vendas (venda_id);

insert into automovel (auto_marca, auto_nome, auto_categoria)
values 
('HONDA', 'NSX', 'Esportivo'),
('TOYOTA', 'AE86', 'Esportivo'),
('FERRARI', 'F40', 'Esportivo / Luxo');

SELECT * FROM automovel

