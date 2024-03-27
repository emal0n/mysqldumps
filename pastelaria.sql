-- orbita COPYRIGHT, baseada em uma pastelaria - by:ed
create database pastelaria;
use pastelaria;

-- tabelas
CREATE TABLE Cliente ( 
 cliente_id                    INT PRIMARY KEY auto_increment,  
 cliente_nome_completo         VARCHAR(100),
 cliente_apelido               VARCHAR(10),
 cliente_nascimento            DATE,
 cliente_telefone              DECIMAL(11),
 cliente_email                 VARCHAR(100),
 cliente_cpf                   DECIMAL(12,0),
 cliente_bairro                VARCHAR(30),
 cliente_cidade                VARCHAR(20),
 cliente_estado                VARCHAR(2),
                               UNIQUE (cliente_cpf) ); 
 
 CREATE TABLE Funcionarios  ( 
 funcionario_id                INT PRIMARY KEY auto_increment,  
 funcionario_nome              VARCHAR(100),
 funcionario_nascimento        DATE,
 funcionario_cpf               DECIMAL(12,0),  
                               UNIQUE (funcionario_cpf) ); 

CREATE TABLE Formas_pagamento ( 
 fpagamento_id                 INT PRIMARY KEY auto_increment,  
 fpagamento_nome               VARCHAR(11) ); 
 
 CREATE TABLE Recebimento ( 
 recebimento_id                INT PRIMARY KEY auto_increment,  
 recebimento_data              DATE,  
 recebimento_valor             DECIMAL(15,4),
 recebimento_cliente_id        INT,
 recebimento_pedido_id         INT,
 recebimento_formapagamento    INT,
 recebimento_formapagamento_fk INT, 
 recebimento_cliente_fk        INT,
 FOREIGN KEY (recebimento_formapagamento_fk) REFERENCES formas_pagamento (fpagamento_id) );

CREATE TABLE Cardapio (
cardapio_id                    INT PRIMARY KEY auto_increment,
cardapio_produto               VARCHAR(100),
cardapio_categoria             VARCHAR(100),
cardapio_tipo                  VARCHAR(100),
cardapio_sabor                 VARCHAR(100),
cardapio_tamanho               VARCHAR(100),
cardapio_valor                 INT );

CREATE TABLE Produtos_registro ( 
 produtosreg_id                INT PRIMARY KEY auto_increment,
 produtosreg_funcionario_id    INT,
 produtosreg_cliente_id        INT,
 produtosreg_pastel_id         INT,  
 produtosreg_pastel_quantidade INT, 
 produtosreg_bebida_id         INT,
 produtosreg_bebida_quantidade INT, 
 produtosreg_data              DATE,
 produtosreg_cardapio_fk       INT,
 produtosreg_cliente_fk        INT,
 produtosreg_funcionario_fk    INT,
 FOREIGN KEY (produtosreg_cliente_fk) REFERENCES Cliente (cliente_id),
 FOREIGN KEY (produtosreg_funcionario_fk) REFERENCES Funcionarios (funcionario_id),
 FOREIGN KEY (produtosreg_cardapio_fk) REFERENCES cardapio (cardapio_id) ); 
 
 CREATE TABLE Produtos_vendas_registro ( 
 vendas_id                    INT PRIMARY KEY auto_increment,
 vendas_pedido_id             INT,
 vendas_funcionario           INT,
 vendas_cliente               INT,
 vendas_data                  DATE,
 vendas_pagamento_tipo        INT,
 vendas_funcionario_fk        INT,
 vendas_cliente_fk            INT,
 vendas_fpagamento_fk         INT,
 vendas_produtosreg_fk        INT,
 FOREIGN KEY (vendas_cliente_fk) REFERENCES Cliente (cliente_id),
 FOREIGN KEY (vendas_fpagamento_fk) REFERENCES formas_pagamento (fpagamento_id),
 FOREIGN KEY (vendas_produtosreg_fk) REFERENCES Produtos_registro (produtosreg_id), 
 FOREIGN KEY (vendas_funcionario_fk) REFERENCES Funcionarios (funcionario_id) ); 
 --