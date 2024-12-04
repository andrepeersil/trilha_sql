-- Qual o tempo entre venda dos sellers
-- Apenas pedidos entregues

with tb_sellers_dates as (
    select
        t1.seller_id,
        date(t2.order_approved_at) as date_approved,
        row_number() over (partition by seller_id, date(t2.order_approved_at)) as order_dates

    from tb_order_items as t1

    left join tb_orders as t2
        on t1.order_id = t2.order_id

    where t2.order_status =  'delivered'

    order by t1.seller_id, date_approved
    ),

tb_diff_days as (
    select
        seller_id,
        date_approved,
        JulianDay(date_approved) - JulianDay(lag(date_approved,1) over (partition by seller_id order by date_approved)) as diff_days

    from tb_sellers_dates

    where order_dates is 1
)

select 
    seller_id,
    cast(avg(diff_days) as int)  as avg_diff_days
        
from tb_diff_days

where diff_days is not NULL

group by seller_id

order by avg_diff_days asc
