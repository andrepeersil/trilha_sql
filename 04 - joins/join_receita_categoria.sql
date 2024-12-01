-- Retorna a receita por categoria

select 
    product_category_name,
    sum(price) as receita_categoria

from tb_order_items as t1

left join tb_products as t2 
    on 
    t1.product_id = t2.product_id

group by product_category_name

order by receita_categoria DESC