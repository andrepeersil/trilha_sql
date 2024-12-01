select count(DISTINCT product_id) qtde_produtos
FROM tb_products
WHERE product_length_cm * product_height_cm * product_width_cm / 1000 > 5