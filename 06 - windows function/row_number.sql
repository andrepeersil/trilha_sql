-- Qual o produto mais caro que cada seller já vendeu
-- Considere pedidos entregues

with tb_produts_seller as (
    select
        t1.seller_id,
        t2.product_id,
        count(t2.seller_id) as vendas,
        sum(t2.price) as receita_max

    from tb_sellers as t1

    left join tb_order_items as t2
        on t1.seller_id = t2.seller_id

    left join tb_orders as t3
        on t2.order_id = t3.order_id

    where 
        t3.order_status = 'delivered'

    group by 
        t1.seller_id,
        t2.product_id

    order by count(t2.seller_id) desc
    ),

tb_order_vendas as (
select *,
    row_number() over (partition by seller_id 
                        order by vendas desc , receita_max desc) as order_vendas

from tb_produts_seller
)

select
    seller_id,
    product_id,
    vendas

from tb_order_vendas

where order_vendas <=5