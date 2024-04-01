create database locacar;
use locacar;

-- tables
CREATE TABLE cliente (
cli_id             INT PRIMARY KEY AUTO_INCREMENT,
cli_nome           VARCHAR(100),
cli_telefone       DECIMAL(11),
cli_cpf            DECIMAL(12,0),
cli_email          VARCHAR(100), 
		           UNIQUE (cli_cpf),
FOREIGN KEY (venda_fk_cliente) REFERENCES cliente (cli_id),
FOREIGN KEY (venda_fk_vendedor) REFERENCES vendedor (vende_id) );

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
vendv_fk_automovel INT,
FOREIGN KEY (vendv_fk_venda) REFERENCES vendas (venda_id),
FOREIGN KEY (vendv_fk_automovel) REFERENCES automovel (auto_id));

create table forma_de_pagamento (
formpag_id         INT PRIMARY KEY AUTO_INCREMENT,
formpag_nome       VARCHAR(100),
formpag_fk_cliente INT,
formpag_fk_vend    INT,
FOREIGN KEY (rec_fk_formpag) REFERENCES forma_de_pagamento (formpag_id), 
FOREIGN KEY (rec_fk_vendas) REFERENCES vendas (venda_id) );

create table recebimento (
rec_id             INT PRIMARY KEY AUTO_INCREMENT,
rec_data           DATE,
rec_valor          DECIMAL(15,4),
rec_fk_formpag     INT,
rec_fk_vendas      INT,
FOREIGN KEY (rec_fk_formpag) REFERENCES forma_de_pagamento (formpag_id),
FOREIGN KEY (rec_fk_vendas) REFERENCES vendas (venda_id) );