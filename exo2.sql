/* Pour faire l' Optimisation SQL : il faut analyser le plan d'exécution, 
ajouter des index pertinents, réécrire la requête si nécessaire (éviter SELECT *, optimiser les jointures/WHERE). */

/* Requette lente (sans indexe optimal)*/
SELECT o.order_id, c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
AND c.city = 'Kinshasa';

/* Analyse du plan */

EXPLAIN SELECT o.order_id, c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
AND c.city = 'Kinshasa';


/* Requette optimisée avec Indexe */

ALTER TABLE orders ADD INDEX idx_order_date (order_date);
ALTER TABLE customers ADD INDEX idx_city (city);

SELECT o.order_id, c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
AND c.city = 'Kinshasa';

/* Analyse du plan optimisé */

EXPLAIN SELECT o.order_id, c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
AND c.city = 'Kinshasa';
