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

SELECT order_id, SUM(price) AS"Pagado por pedido" FROM (SELECT * FROM order_details
left join menu_items on order_details.item_id=menu_items.menu_item_id)
GROUP BY order_id
order by order_id;

SELECT TO_CHAR(SUM("Pagado por pedido"), '$999,999,999.99') AS "Ventas del periodo"
FROM (
    SELECT order_id, SUM(price) AS "Pagado por pedido"
    FROM order_details
    LEFT JOIN menu_items ON order_details.item_id = menu_items.menu_item_id
    GROUP BY order_id
);

SELECT COUNT (1) AS "Pedidos totales " FROM 
(SELECT order_id AS "Ordenes", order_date, SUM(item_id) as "Pedido" FROM order_details
GROUP BY order_id, order_date
order By "Pedido" ASC);

SELECT * FROM order_details
WHERE item_id IS null
Order by order_id;

SELECT COUNT (item_name), category FROM menu_items
GROUP BY category
order by category;

SELECT COUNT (order_id), item_id FROM order_details
WHERE item_id IS NULL
GROUP BY item_id;

SELECT * FROM order_details
WHERE order_id = 2487;

SELECT count (order_id) AS "Veces pedido",item_id,item_name FROM (
	SELECT * FROM order_details
	left join menu_items on order_details.item_id=menu_items.menu_item_id)
WHERE item_name IS NOT NULL
GROUP BY item_id, item_name
ORDER BY "Veces pedido" asc
limit 10;

SELECT count (order_id) AS "Veces pedido",Category FROM (
	SELECT * FROM order_details
	left join menu_items on order_details.item_id=menu_items.menu_item_id)
WHERE item_name IS NOT NULL
GROUP BY category
ORDER BY "Veces pedido" desc;