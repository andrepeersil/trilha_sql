-- Qual o valor total de receita gerada por sellers de cada estados?
-- Considerar apenas pedidos entregues

select 
    t1.seller_state,
    round(sum(t2.price), 2) as receita

from tb_sellers as t1 

left join tb_order_items as t2
    on
    t1.seller_id = t2.seller_id

group by seller_state

order by receita desc