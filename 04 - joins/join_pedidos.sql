-- Retorna total de vendas por categoria

select 

case
    when product_category_name is null then 'outros'
    else product_category_name
end as product_category_name_fillna,
    sum(price) as receita_categoria,
    count(*) as itens_categoria,
    count(distinct t1.order_id) as pedidos_categoria,
    round(count(*) / cast((count(distinct t1.order_id)) as float), 2) as itens_por_pedido


from tb_order_items as t1

left join tb_products as t2
    on 
    t1.product_id = t2.product_id

group by product_category_name_fillna

order by itens_por_pedido DESC