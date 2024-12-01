-- Qual o valor total de receita gerada por clientes de cada estados?
-- Considerar apenas pedidos entregues

select
    t2.customer_state as clientes_uf,
    round(sum(t3.price), 2) as receita

from tb_orders as t1

left join tb_customers as t2
on t1.customer_id = t2.customer_id

left join tb_order_items as t3
on t1.order_id = t3.order_id

where t1.order_status = 'delivered'

group by t2.customer_state

order by round(sum(t3.price), 2) DESC





