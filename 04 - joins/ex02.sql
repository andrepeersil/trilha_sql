-- Qual o valor total de receita gerada por sellers de cada estados?
-- Considerar apenas pedidos entregues

select
    t2.seller_state as vendedores_uf,
    round(sum(t1.price), 2) as receita,
    round(sum(t1.price) / count(distinct t2.seller_id), 2) as receita_media_vendedor

from tb_order_items as t1

left join tb_sellers as t2
on t1.seller_id = t2.seller_id

left join tb_orders as t3
on t1.order_id = t3.order_id

where t3.order_status = 'delivered'

group by t2.seller_state

order by round(sum(t1.price), 2) desc

