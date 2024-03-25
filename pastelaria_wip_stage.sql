-- banco feito para a orbita, baseada em uma pastelaria / by:ed
drop database pastelaria_wip;
create database pastelaria_wip;
use pastelaria_wip;

-- tabelas
CREATE TABLE Cliente ( 
 cliente_id                  INT PRIMARY KEY auto_increment,  
 cliente_nome_completo       VARCHAR(100),
 cliente_apelido             VARCHAR(10),
 cliente_telefone            DECIMAL(11),
 cliente_email               VARCHAR(100),
 cliente_cpf                 DECIMAL(12,0),
 cliente_bairro              VARCHAR(30),
 cliente_cidade              VARCHAR(20),
 cliente_estado              VARCHAR(2),
                             UNIQUE (cliente_cpf) ); 
 
 CREATE TABLE Funcionarios  ( 
 funcionario_id              INT PRIMARY KEY auto_increment,  
 funcionario_nome            VARCHAR(100),
 funcionario_nascimento      DATE,
 funcionario_cpf             DECIMAL(12,0),  
                             UNIQUE (funcionario_cpf) ); 

CREATE TABLE Cardapio_registro ( 
 cardapioreg_id                 INT PRIMARY KEY auto_increment,
 cardapioreg_funcionario        INT,
 cardapioreg_cliente            INT,
 cardapioreg_produto_tipo       VARCHAR(100),  
 cardapioreg_produto_nome       VARCHAR(100),
 cardapioreg_tamanho_cm         INT,
 cardapioreg_sabor              VARCHAR(100),
 cardapioreg_bebida             VARCHAR(100),
 cardapioreg_extras             VARCHAR(100),
 cardapioreg_data               DATE,
 FOREIGN KEY (cardapioreg_cliente) REFERENCES Cliente (cliente_id),
 FOREIGN KEY (cardapioreg_funcionario) REFERENCES Funcionarios (funcionario_id) ); 

CREATE TABLE formas_pagamento ( 
 fpagamento_id               INT PRIMARY KEY auto_increment,  
 fpagamento_nome             VARCHAR(11),                       
 fpagamento_cliente          INT,  
 FOREIGN KEY (fpagamento_cliente) REFERENCES Cliente (cliente_id) ); 

CREATE TABLE Vendas ( 
 vendas_id                  INT PRIMARY KEY auto_increment,
 vendas_funcionario         INT,
 vendas_cliente             INT,
 vendas_produto_tipo        VARCHAR(100),  
 vendas_produto_nome        VARCHAR(100),
 vendas_extras              VARCHAR(100),
 vendas_data                DATE,
 vendas_pagamento_tipo      INT,
 FOREIGN KEY (vendas_cliente) REFERENCES Cliente (cliente_id),
 FOREIGN KEY (vendas_pagamento_tipo) REFERENCES fpagamento (fpagamento_id),
 FOREIGN KEY (vendas_funcionario) REFERENCES Funcionarios (funcionario_id) ); 

CREATE TABLE recebimento ( 
 recebimento_id              INT PRIMARY KEY auto_increment,  
 recebimento_data            DATE,  
 recebimento_valor           DECIMAL(15,4),
 recebimento_cliente         INT,
 recebimento_formapagmento   INT, 
 FOREIGN KEY (recebimento_formapagamento) REFERENCES formas_pagamento (fpagamento_id) );
 --
 
 -- views
 CREATE VIEW view_vendas
 AS SELECT 
 vendas_produto_tipo  AS tipo,     
 vendas_produto_nome  AS nome,    
 vendas_tamanho_cm    AS pastel_cm,    
 vendas_sabor         AS sabor,    
 vendas_bebida        AS bebida,   
 vendas_extras        AS extras,   
 vendas_data          AS data_pedido   
 FROM Vendas;
 
 CREATE VIEW view_recebimentos 
 AS SELECT 
 recebimento_id             AS id,
 recebimento_data           AS data_recebimento, 
 recebimento_valor          AS valor,    
 recebimento_cliente        AS cliente,    
 recebimento_formapagmento  AS tipo_pagamento  
 FROM recebimento;
 
 CREATE VIEW view_estoque 
 AS SELECT  
 produtos_nome           AS produtos,
 produtos_unidade        AS localidade_produtos,
 produtos_entrada_data   AS entrada_produtos,
 acessorios_nome         AS acessorios,
 acessorios_unidade      AS localidade_acessorios,
 acessorios_entrada_data AS entrada_acessorios
 FROM Produtos, Acessorios;
 
 CREATE VIEW view_pagamentos 
 AS SELECT 
 fpagamento_id           AS id, 
 fpagamento_nome         AS nome,
 recebimento_data        AS recebimento,
 recebimento_valor       AS valor
 FROM formas_pagamento, recebimento;
 --
 
 -- triggers
CREATE TRIGGER trigger_acessorios_insert 
AFTER INSERT ON Acessorios
FOR EACH ROW
INSERT INTO Acessorios (acessorios_nome, acessorios_unidade, acessorios_entrada_data)
VALUES (NEW.acessorios_nome, NEW.acessorios_unidade, NEW.acessorios_entrada_data);

CREATE TRIGGER trigger_acessorios_delete 
BEFORE DELETE ON Acessorios
FOR EACH ROW
INSERT INTO Acessorios (acessorios_nome, acessorios_unidade, acessorios_entrada_data)
VALUES (OLD.acessorios_nome, OLD.acessorios_unidade, OLD.acessorios_entrada_data);

CREATE TRIGGER trigger_produtos_insert 
AFTER INSERT ON Produtos
FOR EACH ROW
INSERT INTO Produtos (produtos_nome, produtos_unidade, produtos_entrada_data)
VALUES (NEW.produtos_nome, NEW.produtos_unidade, NEW.produtos_entrada_data);

CREATE TRIGGER trigger_produtos_delete 
BEFORE DELETE ON Produtos
FOR EACH ROW
INSERT INTO Produtos (produtos_nome, produtos_unidade, produtos_entrada_data)
VALUES (OLD.produtos_nome, OLD.produtos_unidade, OLD.produtos_entrada_data);
--