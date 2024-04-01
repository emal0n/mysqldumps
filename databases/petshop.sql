create database petshop;
use petshop;

CREATE TABLE cliente ( 
 cli_id              INT PRIMARY KEY auto_increment,  
 cli_nome            VARCHAR(100),  
 cli_telefone             DECIMAL(11),
 cli_cpf             DECIMAL(12,0),
 cli_bairro          VARCHAR(60),
 cli_ncasa           VARCHAR(10),
 cli_ani_id_fk       INT(11), 
                     UNIQUE (cli_cpf),
 foreign key (cli_ani_id_fk) references  animal (ani_id) ); 

CREATE TABLE animal ( 
 ani_id              INT(11) PRIMARY KEY auto_increment,  
 ani_nome            VARCHAR(100),  
 ani_rac_nome        VARCHAR(80),  
 ani_rac_cor         VARCHAR(40),   
 ani_cli_id_fk       INT(11),
 foreign key (ani_cli_id_fk) references  cliente (cli_id) ); 

CREATE TABLE vacinas ( 
 vac_id              INT(11) PRIMARY KEY auto_increment,  
 vac_vacinas_aplic   VARCHAR(60),
 vac_vaci_aplic_data date,
 vac_ani_id_fk       INT(11),
 foreign key (vac_ani_id_fk) references animal (ani_id) ); 

CREATE TABLE ordem_serv ( 
 osc_id              INT(11) PRIMARY KEY auto_increment, 
 osc_total           INT(11)                           ); 

CREATE TABLE itens_ordem_servc ( 
 iosc_id             INT(11) PRIMARY KEY auto_increment,  
 iosc_servico        VARCHAR(60),  
 iosc_quantidade     INT(60),                         
 iosc_osc_id_fk      INT(11),
 foreign key (iosc_osc_id_fk) references ordem_serv (osc_id) ); 
 
CREATE TABLE produto_servc ( 
 psc_id              INT(11) PRIMARY KEY auto_increment,
 psc_produto         VARCHAR(60),
 psc_quantidade      INT(60),
 psc_produto_venc    VARCHAR(40),
 psc_osc_id_fk       INT(11),
 psc_iosc_id_fk      INT(11),
 foreign key (psc_osc_id_fk) references ordem_serv (osc_id),
 foreign key (psc_iosc_id_fk) references itens_ordem_servc (iosc_id)); 

CREATE TABLE formas_pagamento ( 
 fp_id               INT(11) PRIMARY KEY auto_increment,  
 fp_nome             VARCHAR(11),                       
 fp_cli_id_fk        INT(11),
 foreign key (fp_cli_id_fk) references cliente (cli_id) ); 

CREATE TABLE funcionarios  ( 
 func_id             INT(11) PRIMARY KEY auto_increment,  
 func_nome           VARCHAR(100),  
 func_cpf            DECIMAL(12,0),  
                     UNIQUE (func_cpf) ); 
  
CREATE TABLE recebimento ( 
 rec_id              INT(11) PRIMARY KEY auto_increment,  
 rec_data            DATE,  
 rec_valor           DECIMAL(15,4),
 rec_osc_id_fk       INT(11),
 rec_fp_id_fk        INT(11),
 foreign key (rec_osc_id_fk) references ordem_serv (osc_id),
 foreign key (rec_fp_id_fk) references formas_pagamento (fp_id)); 