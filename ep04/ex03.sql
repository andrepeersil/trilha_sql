-- Qual o peso médio dos produtdos vendidos por sellers de cada estado?
-- Considere apenas o ano de 2017 e pedidos entregues nesta análise

select
    t3.seller_state as uf_vendedor,
    avg(t2.product_weight_g) as peso_medio_uf


from tb_order_items as t1

left join tb_products as t2
    on t1.product_id = t2.product_id

left join tb_sellers as t3
    on t1.seller_id = t3.seller_id

left join tb_orders as t4
    on 
    t1.order_id = t4.order_id

where t4.order_status = 'delivered' and strftime('%Y', t4.order_approved_at) = '2017'

group by t3.seller_state

