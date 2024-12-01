select
    t3.product_category_name

from tb_order_items as t1
    
left join tb_products as t3
    on t1.product_id = t3.product_id

group by t3.product_category_name

order by count(*) desc

limit 1