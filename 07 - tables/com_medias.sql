-- No lugar de utilizar 100 dias, utlizar média de tempo de venda do proprio seller


-- Verificar quais sellers estão a mais dias do que a sua propria média sem vendas
-- Considerar data da venda mais recente como o dia atual

select
    t2.seller_id,
    '2018-09-03' as today,
    -- 100 dias
    max(order_approved_at) as last_sell,
    cast(julianday('2018-09-03') - julianday(max(order_approved_at)) as int)  as diff_last_sell,
    case 
        when cast(julianday('2018-09-03') - julianday(max(order_approved_at)) as int) > 100 then 1
        else 0 
    end as flag_100_days,
    -- media
    case
        when t3.avg_diff_days is null then cast(julianday('2018-09-03') - julianday(max(order_approved_at)) as int)
        else t3.avg_diff_days
    end as avg_diff_days_fix,
    case
        when cast(julianday('2018-09-03') - julianday(max(order_approved_at)) as int) >= avg_diff_days then 1
        when avg_diff_days is null then 1
        else 0
    end as flag_avg_days
 
from tb_orders as t1

left join tb_order_items as t2
    on t1.order_id = t2.order_id

left join tb_avg_compra_seller as t3
    on t2.seller_id = t3.seller_id

where order_approved_at < '2018-09-03' and order_status = 'delivered'

group by t2.seller_id

order by t2.seller_id