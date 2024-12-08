-- Verificar quais sellers estão a mais de 100 dias sem vendas
-- Considerar data da venda mais recente como o dia atual

select
    t2.seller_id,
    '2018-09-03' as today,
    max(order_approved_at) as last_sell,
    cast(julianday('2018-09-03') - julianday(max(order_approved_at)) as int)  as diff,
    case 
        when cast(julianday('2018-09-03') - julianday(max(order_approved_at)) as int) > 100 then 1
        else 0 
    end as flag_100_dias
 
from tb_orders as t1

left join tb_order_items as t2
    on t1.order_id =  t2.order_id

where order_approved_at < '2018-09-03' and order_status = 'delivered'

group by seller_id

order by cast(julianday('2018-09-03') - julianday(max(order_approved_at)) as int) desc