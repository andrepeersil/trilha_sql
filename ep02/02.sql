-- Ex2. Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria

select product_category_name,
       max(product_name_lenght) as max_name,
       min(product_name_lenght) as min_name,
       avg(product_name_lenght) as avg_name

from tb_products

where product_category_name is not NULL

group by product_category_name