update produto_servc 
set psc_produto_venc = 'shampoo'
where psc_id = '1';

update itens_ordem_servc
set iosc_quantidade = '3'
where iosc_id = '1';

select sum(psc_quantidade) as total
from produto_servc;

select sum(iosc_quantidade) as total
from itens_ordem_servc;

select sum(osc_total * 0.03) as comissao
from ordem_serv;

update vacinas
set vac_vaci_aplic_data= '20250227'
where vac_id= '1';

update recebimento
set rec_valor= '201'
where rec_id= '1';