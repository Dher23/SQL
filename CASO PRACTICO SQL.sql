SELECT * FROM menu_items;

SELECT COUNT (*) FROM menu_items;

SELECT item_name, price FROM menu_items
ORDER BY price DESC
LIMIT 1;

SELECT item_name, price FROM menu_items
ORDER BY price
LIMIT 1;

SELECT COUNT (*) AS "Americanos"From menu_items
where category = 'American';

SELECT AVG(price) AS "Precio promedio" FROM menu_items;

SELECT * FROM order_details;

SELECT COUNT(DISTINCT order_id ) FROM order_details;

SELECT order_id, COUNT (item_id) AS "Numero de platos" FROM order_details
GROUP BY order_id
ORDER BY "Numero de platos" DESC
lIMIT 5;

SELECT * FROM order_details
ORDER BY order_date DESC
LIMIT 1;

SELECT * FROM order_details
ORDER BY order_date
LIMIT 1;

SELECT COUNT (order_date) AS "Pedidos totales entre 01/01/23 al 05/01/23" FROM 
(SELECT order_id AS "Ordenes", SUM(order_details_id) AS "Total productos", order_date FROM order_details
where order_date between '2023-01-01' and '2023-01-05'
GROUP BY order_id, order_date);

SELECT * FROM order_details
left join menu_items on order_details.item_id=menu_items.menu_item_id;

