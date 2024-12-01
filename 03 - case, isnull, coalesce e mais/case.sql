-- Lista as categorias, e troca os valores Null por 'Outros', agrega algumas categorias


select distinct 

case
    when product_category_name is null then 'outros'

    when product_category_name = 'eletrodomesticos' or product_category_name = 'eletrodomesticos_2' then 'eletrodomesticos_gerais'

    when product_category_name in ('artes', 'artes_e_artesanato') then 'arte'

    when product_category_name like '%artigos%' then 'artigos'

    else product_category_name
    
end as categoria_fillna,

count(*) as qtde

from tb_products

group by categoria_fillna  