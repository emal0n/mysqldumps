-- petshop by edmundo n.
-- 1

create database petshop;
use petshop;

-- 2
CREATE TABLE cliente ( 
 cli_id              INT PRIMARY KEY auto_increment,  
 cli_nome            VARCHAR(100),  
 cli_telefone             DECIMAL(11),
 cli_cpf             DECIMAL(12,0),
 cli_bairro          VARCHAR(60),
 cli_ncasa           VARCHAR(10),
 cli_ani_id_fk       INT(11), 
                     UNIQUE (cli_cpf) ); 

CREATE TABLE animal ( 
 ani_id              INT(11) PRIMARY KEY auto_increment,  
 ani_nome            VARCHAR(100),  
 ani_rac_nome        VARCHAR(80),  
 ani_rac_cor         VARCHAR(40),   
 ani_cli_id_fk       INT(11) ); 

CREATE TABLE vacinas ( 
 vac_id              INT(11) PRIMARY KEY auto_increment,  
 vac_vacinas_aplic   VARCHAR(60),
 vac_vaci_aplic_data date,
 vac_ani_id_fk       INT(11) ); 

CREATE TABLE ordem_serv ( 
 osc_id              INT(11) PRIMARY KEY auto_increment ); 

CREATE TABLE itens_ordem_servc ( 
 iosc_id             INT(11) PRIMARY KEY auto_increment,  
 iosc_servico        VARCHAR(60),  
 iosc_quantidade     INT(60),                         
 iosc_osc_id_fk      INT(11) ); 
 
CREATE TABLE produto_servc ( 
 psc_id              INT(11) PRIMARY KEY auto_increment,
 psc_produto         VARCHAR(60),
 psc_quantidade      INT(60),
 psc_produto_venc    VARCHAR(40),
 psc_osc_id_fk       INT(11),
 psc_iosc_id_fk      INT(11) ); 

CREATE TABLE formas_pagamento ( 
 fp_id               INT(11) PRIMARY KEY auto_increment,  
 fp_nome             VARCHAR(11),                       
 fp_cli_id_fk        INT(11)  ); 

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
 rec_fp_id_fk        INT(11) ); 
 
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

alter table formas_pagamento add foreign key (fp_cli_id_fk)
references cliente (cli_id);

alter table recebimento add foreign key (rec_osc_id_fk)
references ordem_serv (osc_id);

alter table recebimento add foreign key (rec_fp_id_fk)
references formas_pagamento (fp_id);

-- 3 / 4 a)
insert into cliente (cli_id, cli_nome, cli_telefone, cli_cpf, cli_bairro, cli_ncasa)
values ('1', 'amarildo', '75981908867', '07911810399', 'mangabeira', '187');

insert into animal (ani_id, ani_nome, ani_rac_nome, ani_rac_cor)
values ('1', 'fredd','viralata', 'preto');

insert into produto_servc (psc_id, psc_produto, psc_quantidade)
values ('1', 'racao', '3');

insert into produto_servc (psc_id, psc_produto, psc_quantidade)
values ('2', 'shampoo', '1');

insert into vacinas (vac_id, vac_vacinas_aplic, vac_vaci_aplic_data)
values ('1', 'contra raiva', '20240227');

insert into ordem_serv
values ('1');

insert into itens_ordem_servc (iosc_id, iosc_servico, iosc_quantidade)
values ('1', 'banho', '1');

insert into itens_ordem_servc (iosc_id, iosc_servico, iosc_quantidade)
values ('2', 'tosa', '1');

insert into formas_pagamento (fp_id, fp_nome)
values ('1', 'pix');

insert into funcionarios (func_id, func_nome, func_cpf)
values ('1', 'aldair', '97877566599');

insert into recebimento (rec_id, rec_data, rec_valor)
values ('1', '20240227', '400');

-- 4 b)
update produto_servc 
set psc_produto_venc = 'shampoo'
where psc_id = '1';

-- 4 c)
update itens_ordem_servc
set iosc_quantidade = '3'
where iosc_id = '1';

-- 4 d) 
select sum(psc_quantidade) as total
from produto_servc;

-- 4 e)
select sum(iosc_quantidade) as total
from itens_ordem_servc;

-- 4 f)
select sum(rec_valor) as total
from itens_ordem_servc;

-- 4 g) 
update vacinas
set vac_vaci_aplic_data= '20250227'
where vac_id= '1';

-- 4 h)
update recebimento
set rec_valor= '201'
where rec_id= '1';