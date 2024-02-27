-- 1
drop database petshopWIP;
create database petshopWIP;
use petshopWIP;

-- 2
CREATE TABLE cliente            ( 
 cli_id              INT PRIMARY KEY auto_increment,  
 cli_nome            VARCHAR(100),  
 cli_tel             DECIMAL(11),
 cli_cpf             DECIMAL(12,0),
 cli_bairro          VARCHAR(60),
 cli_ncasa           VARCHAR(10),
 cli_ani_id_fk       INT(11), 
                     UNIQUE (cli_cpf)               ); 


CREATE TABLE animal              ( 
 ani_id              INT(11) PRIMARY KEY auto_increment,  
 ani_nome            VARCHAR(100),  
 ani_rac_nome        VARCHAR(80),  
 ani_rac_cor         VARCHAR(40),   
 ani_cli_id_fk       INT(11)                        ); 


CREATE TABLE vacinas             ( 
 vac_id              INT(11) PRIMARY KEY auto_increment,  
 vac_vacinas         VARCHAR(60),
 vac_ani_id_fk       INT(11)                        ); 


CREATE TABLE ordem_serv          ( 
 osc_id              INT(11) PRIMARY KEY auto_increment
													); 


CREATE TABLE itens_ordem_servc   ( 
 iosc_id             INT(11) PRIMARY KEY auto_increment,  
 iosc_banho          INT(60),  
 iosc_tosa           INT(60),                         
 iosc_osc_id_fk      INT(11)                        ); 
 

CREATE TABLE produto_servc       ( 
 psc_id              INT(11) PRIMARY KEY auto_increment,
 psc_racao           INT(60),
 psc_shampoo         INT(60),
 psc_osc_id_fk       INT(11),
 psc_iosc_id_fk      INT(11)                        ); 


CREATE TABLE vacinas_aplic       ( 
 vacap_id            INT(60) PRIMARY KEY auto_increment,
 vacap_ani_id_fk     INT(11),
 vacap_vac_id_fk     INT(11)                        ); 


CREATE TABLE formas_pagamento     ( 
 fp_id               INT(11) PRIMARY KEY auto_increment,  
 fp_nome             VARCHAR(11),                       
 fp_cli_id_fk        INT(11)                        ); 


CREATE TABLE funcionarios         ( 
 func_id             INT(11) PRIMARY KEY auto_increment,  
 func_nome           VARCHAR(100),  
 func_cpf            DECIMAL(12,0),  
                     UNIQUE (func_cpf)               ); 
 
 
CREATE TABLE recebimento          ( 
 rec_id              INT(11) PRIMARY KEY auto_increment,  
 rec_date            DATE,  
 rec_valor           DECIMAL(15,4),
 rec_osc_id_fk       INT(11),
 rec_fp_id_fk        INT(11)                         ); 
 
 
alter table cliente add foreign key (cli_ani_id_fk)
REFERENCES  animal (ani_id);
alter table animal add foreign key (ani_cli_id_fk)
references  cliente (cli_id);
alter table vacinas add foreign key (vac_ani_id_fk)
references animal (ani_id);
alter table itens_ordem_servc add foreign key (iosc_osc_id_fk)
references ordem_serv (osc_id);
alter table produto_servc add foreign key (psc_osc_id_fk)
references ordem_serv (osc_id);
alter table produto_servc add foreign key (psc_iosc_id_fk)
references itens_ordem_servc (iosc_id);
alter table vacinas_aplic add foreign key (vacap_ani_id_fk)
references animal (ani_id);
alter table vacinas_aplic add foreign key (vacap_vac_id_fk)
references vacinas (vac_id);
alter table formas_pagamento add foreign key (fp_cli_id_fk)
references cliente (cli_id);
alter table recebimento add foreign key (rec_osc_id_fk)
references ordem_serv (osc_id);
alter table recebimento add foreign key (rec_fp_id_fk)
references formas_pagamento (fp_id);


-- 3 
insert into cliente (cli_id, cli_nome, cli_tel, cli_cpf, cli_bairro, cli_ncasa)
values ('1', 'amarildo', '75981908867', '07911810399', 'mangabeira', '187');

insert into animal (ani_id, ani_nome, ani_rac_nome, ani_rac_cor)
values ('1', 'fredd','viralata', 'preto');

insert into vacinas (vac_id, vac_vacinas)
values ('1', '1');

insert into ordem_serv
values ('1');

insert into itens_ordem_servc (iosc_id, iosc_banho, iosc_tosa)
values ('1', '1', '1');

insert into vacinas_aplic (vacap_id)
values ('1');

insert into formas_pagamento (fp_id, fp_nome)
values ('1', 'pix');

insert into funcionarios (func_id, func_nome, func_cpf)
values ('1', 'aldair', '97877566599');

insert into recebimento (rec_id, rec_date, rec_valor)
values ('1', '20240227', '400');