-- Lista as categorias, e troca os valores Null por 'Outros', usar coalesce


select 
    distinct coalesce(product_category_name, 'outros') as categoria_fillna,
    count(*) as qtde

from tb_products

group by categoria_fillna  