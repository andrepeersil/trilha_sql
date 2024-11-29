-- Retorna quantidade de vendedores de PR, SP e RJ


SELECT seller_state,
       count(seller_state) as qtde

from tb_sellers

GROUP BY seller_state

HAVING seller_state IN ('SP', 'RJ', 'PR', 'RS')

ORDER BY qtde DESC



