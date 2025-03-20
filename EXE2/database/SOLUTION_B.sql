--Liệt kê hóa đơn của khách hàng (mã user, tên user, mã hóa đơn)
SELECT o.user_id, u.user_name, o.order_id
FROM orders o
JOIN users u ON o.user_id = u.user_id;

--SELECT u.user_id, u.user_name, COUNT(o.order_id) AS total_orders
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS total_orders
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name;

--Liệt kê thông tin hóa đơn (mã đơn hàng, số sản phẩm trong đơn)
SELECT o.order_id, COUNT(od.product_id) AS total_products
FROM orders o
LEFT JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id;

--Liệt kê thông tin mua hàng của người dùng (gom nhóm theo đơn hàng)
SELECT o.user_id, u.user_name, o.order_id, p.product_name
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
ORDER BY o.order_id, u.user_name;

--Liệt kê 7 người có nhiều đơn hàng nhất
SELECT TOP 7 u.user_id, u.user_name, COUNT(o.order_id) AS total_orders
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name
ORDER BY total_orders DESC;

--Liệt kê 7 người mua sản phẩm có tên "Samsung" hoặc "Apple"
SELECT DISTINCT TOP 7 u.user_id, u.user_name, o.order_id, p.product_name
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name LIKE '%Samsung%' OR p.product_name LIKE '%Apple%';

--Liệt kê danh sách mua hàng của user kèm tổng tiền mỗi đơn hàng
SELECT u.user_id, u.user_name, o.order_id, SUM(p.product_price * od.quantity) AS total_price
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY u.user_id, u.user_name, o.order_id;

--Mỗi user chỉ lấy đơn hàng có giá cao nhất
WITH OrderTotal AS (
    SELECT u.user_id, u.user_name, o.order_id, 
           SUM(p.product_price * od.quantity) AS total_price,
           RANK() OVER (PARTITION BY u.user_id ORDER BY SUM(p.product_price * od.quantity) DESC) AS rnk
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY u.user_id, u.user_name, o.order_id
)
SELECT user_id, user_name, order_id, total_price
FROM OrderTotal
WHERE rnk = 1;

--Mỗi user chỉ lấy đơn hàng có giá trị thấp nhất
WITH OrderTotal AS (
    SELECT u.user_id, u.user_name, o.order_id, 
           SUM(p.product_price * od.quantity) AS total_price, 
           COUNT(od.product_id) AS total_products,
           RANK() OVER (PARTITION BY u.user_id ORDER BY SUM(p.product_price * od.quantity) ASC) AS rnk
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY u.user_id, u.user_name, o.order_id
)
SELECT user_id, user_name, order_id, total_price, total_products
FROM OrderTotal
WHERE rnk = 1;

--Mỗi user chỉ lấy đơn hàng có nhiều sản phẩm nhất
WITH OrderProductCount AS (
    SELECT u.user_id, u.user_name, o.order_id, 
           SUM(p.product_price * od.quantity) AS total_price, 
           COUNT(od.product_id) AS total_products,
           RANK() OVER (PARTITION BY u.user_id ORDER BY COUNT(od.product_id) DESC) AS rnk
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY u.user_id, u.user_name, o.order_id
)
SELECT user_id, user_name, order_id, total_price, total_products
FROM OrderProductCount
WHERE rnk = 1;

--
