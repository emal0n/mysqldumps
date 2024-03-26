-- orbita COPYRIGHT, baseada em uma pastelaria - by:ed
drop database pastelaria_wip;
create database pastelaria_wip;
use pastelaria_wip;

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
cardapio_tamanho_cm            VARCHAR(100),
cardapio_valor                 INT );

CREATE TABLE Produtos_registro ( 
 produtosreg_id                INT PRIMARY KEY auto_increment,
 produtosreg_funcionario_id    INT,
 produtosreg_cliente_id        INT,
 produtosreg_pastel_id         VARCHAR(100),  
 produtosreg_bebida_id         VARCHAR(100),
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
 
 -- views
 /* CREATE VIEW view_vendas
 AS SELECT 
 vendas_cliente                AS cliente,
 produtosreg_pastel_tipo       AS tipo_pastel,        
 produtosreg_tamanho_cm        AS pastel_cm,    
 produtosreg_sabor_id          AS sabor,
 produtosreg_quantidade_pastel AS quantidade_pastel,
 produtosreg_bebida_tipo       AS tipo_bebida,     
 produtosreg_bebida_nome       AS nome_bebida,  
 produtosreg_quantidade_bebida AS quantidade_bebida,
 produtosreg_extras            AS extras,   
 produtosreg_data              AS data_pedido,
 vendas_data                   AS data_venda,
 vendas_pagamento_tipo         AS tipo_pagamento
 FROM Produtos_registro, Produtos_vendas_registro;
 
 CREATE VIEW view_recebimentos 
 AS SELECT 
 recebimento_id             AS id,
 recebimento_data           AS data_recebimento, 
 recebimento_valor          AS valor,    
 recebimento_cliente        AS cliente,    
 recebimento_formapagamento  AS tipo_pagamento  
 FROM Recebimento;
 
 CREATE VIEW view_pagamentos 
 AS SELECT 
 fpagamento_id           AS id, 
 fpagamento_nome         AS nome,
 recebimento_data        AS recebimento,
 recebimento_valor       AS valor
 FROM Formas_pagamento, Recebimento;
 --

CREATE TRIGGER trigger_cancelar_pedidos 
BEFORE DELETE ON Produtos_registro
FOR EACH ROW
INSERT INTO Produtos_registro ( 
produtosreg_pastel_tipo,
produtosreg_tamanho_cm,
produtosreg_sabor_id,
produtosreg_bebida_tipo,
produtosreg_bebida_nome,
produtosreg_extras,
produtosreg_data )
VALUES (
OLD.produtosreg_pastel_tipo, 
OLD.produtosreg_tamanho_cm, 
OLD.produtosreg_sabor_id,
OLD.produtosreg_bebida_tipo,
OLD.produtosreg_bebida_nome,
OLD.produtosreg_extras,
OLD.produtosreg_data );
-- */

