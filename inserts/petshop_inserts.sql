insert into cliente (
cli_nome, 
cli_telefone, 
cli_cpf, 
cli_bairro, 
cli_ncasa )
values (
'amarildo', 
'75981908867', 
'07911810399', 
'mangabeira', 
'187' );

insert into animal (
ani_nome, 
ani_rac_nome, 
ani_rac_cor )
values (
'fredd',
'viralata', 
'preto' );

insert into produto_servc (
psc_produto, 
psc_quantidade )
values (
'racao', 
'3' );

insert into produto_servc (
psc_produto, 
psc_quantidade )
values (
'shampoo', 
'1' );

insert into vacinas (
vac_vacinas_aplic, 
vac_vaci_aplic_data )
values (
'contra raiva', 
'20240227' );

insert into itens_ordem_servc (
iosc_servico, 
iosc_quantidade )
values (
'banho', 
'1' );

insert into itens_ordem_servc (
iosc_servico, 
iosc_quantidade )
values (
'tosa', 
'1' );

insert into formas_pagamento ( 
fp_nome)
values ('pix');

insert into funcionarios (func_nome, func_cpf)
values (
'aldair', 
'97877566599' );

insert into recebimento (rec_data, rec_valor)
values (
'20240227', 
'400');

insert into ordem_serv (
osc_total )
values (
'400' );