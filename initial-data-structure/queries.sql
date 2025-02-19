-- Productos  que coinciden con  su marca mostrando el nombre de la marca 
SELECT p.*, b.name AS brand_name FROM product p 
INNER JOIN brand b ON p.brand_id = b.id

-- Todos los pedidos que coincidan con un usuario especifico 
SELECT o.*, c.*
FROM `order` o
INNER jOIN customer c ON o.customer_id = c.id
WHERE o.customer_id = 1

-- Cantidad de productos por categoria con su nombre 
SELECT c.name, COUNT(pc.id) AS quantity_products
FROM category c
LEFT JOIN product_category pc ON c.id = pc.category_id
group by c.name

-- Los usuarios  con la cantidad de pedidos realizados y ordenados de manera descendente
SELECT c.first_name, c.email, COUNT(od.id) AS quantity_order
FROM customer c
LEFT JOIN order_detail od ON c.id = od.order_id
GROUP BY c.first_name, c.email
ORDER BY quantity_order DESC;

-- Los usuarios  con la cantidad de pedidos realizados y ordenados de manera descendente y filtrados por usuarios con pedidos mayores o iguales a 4
SELECT c.first_name, c.email, COUNT(od.id) AS quantity_order
FROM customer c
LEFT JOIN order_detail od ON c.id = od.order_id
GROUP BY c.first_name, c.email
HAVING quantity_order >= 4
ORDER BY quantity_order DESC;

-- Productos de una categoria especifica 
SELECT p.*
FROM product p
INNER JOIN product_category pc ON p.id = pc.product_id
INNER JOIN category c ON c.id = pc.category_id
WHERE c.name = 'EYES';

