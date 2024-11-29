-- Ex1. Faça uma query que apresente o tamanho médio, máximo e mínimo da descrição do objeto por categoria

select product_category_name,
       max(product_description_lenght) as max_desc,
       min(product_description_lenght) as min_desc,
       avg(product_description_lenght) as avg_desc

from tb_products

where product_category_name is not NULL

group by product_category_name



aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa