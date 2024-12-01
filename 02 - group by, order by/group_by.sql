select product_category_name,
       max(product_weight_g) as weight_max,
       min(product_weight_g) as weight_min,
       avg(product_weight_g) as weight_avg,
       count(*) as qtde
from tb_products

WHERE product_category_name is not NULL 
and product_category_name != 'alimentos'

GROUP BY product_category_name

ORDER BY product_category_name ASC



