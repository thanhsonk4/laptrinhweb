create database laptrinhweb

CREATE TABLE users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    user_name NVARCHAR(25) NOT NULL,
    user_email NVARCHAR(55) NOT NULL UNIQUE,
    user_pass NVARCHAR(255) NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name NVARCHAR(255) NOT NULL,
    product_price FLOAT NOT NULL,
    product_description TEXT NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE order_details (
    order_detail_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price_at_order FLOAT NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);


-- dữ liệu bảng user
SET IDENTITY_INSERT users ON;
INSERT INTO users (user_id, user_name, user_email, user_pass, updated_at, created_at) VALUES
(1,'Thanh', 'thanh@gmail.com', 'pass123', GETDATE(), GETDATE()),
(2, 'Son', 'son@yahoo.com', 'pass123', GETDATE(), GETDATE()),
(3, 'Hao', 'hao@gmail.com', 'pass123', GETDATE(), GETDATE()),
(4, 'Hai', 'hai@hotmail.com', 'pass123', GETDATE(), GETDATE()),
(5, 'cha', 'cha@gmail.com', 'pass123', GETDATE(), GETDATE()),
(6, 'Hien', 'hien@gmail.com', 'pass123', GETDATE(), GETDATE()),
(7, 'Mai', 'mai@yahoo.com', 'pass123', GETDATE(), GETDATE()),
(8, 'Yasuo', 'yasuo@gmail.com', 'pass123', GETDATE(), GETDATE()),
(9, 'ias', 'isa@gmail.com', 'pass123', GETDATE(), GETDATE()),
(10, 'Lucas', 'lucas@gmail.com', 'pass123', GETDATE(), GETDATE()),
(11, 'Lucius', 'lucius@gmail.com', 'pass123', GETDATE(), GETDATE()),
(12, 'iiiy', 'iiii@gmail.com', 'pass123', GETDATE(), GETDATE()),
(13, 'Mada', 'mada@gmail.com', 'pass123', GETDATE(), GETDATE());
SET IDENTITY_INSERT users OFF;

-- dữ liệu bảng products
INSERT INTO products (product_name, product_price, product_description, updated_at, created_at) VALUES
('iPhone 13', 999, 'Apple smartphone', GETDATE(), GETDATE()),
('Samsung Galaxy S23', 850, 'Samsung smartphone', GETDATE(), GETDATE()),
('MacBook Air', 1200, 'Apple laptop', GETDATE(), GETDATE()),
('Dell XPS 13', 1100, 'Dell laptop', GETDATE(), GETDATE()),
('Sony Headphones', 250, 'Wireless headphones', GETDATE(), GETDATE()),
('Apple Watch', 399, 'Apple smartwatch', GETDATE(), GETDATE()),
('Samsung TV', 900, 'Samsung 4K TV', GETDATE(), GETDATE()),
('HP Laptop', 750, 'HP laptop', GETDATE(), GETDATE());

-- dữ liệu bảng orders
SET IDENTITY_INSERT orders ON;
INSERT INTO orders (order_id, user_id, updated_at, created_at) VALUES
(1, 1, GETDATE(), GETDATE()),  
(2, 1, GETDATE(), GETDATE()),  
(3, 2, GETDATE(), GETDATE()),  
(4, 3, GETDATE(), GETDATE()),  
(5, 3, GETDATE(), GETDATE()),  
(6, 4, GETDATE(), GETDATE()),  
(7, 5, GETDATE(), GETDATE()),  
(8, 5, GETDATE(), GETDATE()),  
(9, 6, GETDATE(), GETDATE()),  
(10, 7, GETDATE(), GETDATE()),  
(11, 8, GETDATE(), GETDATE());  
SET IDENTITY_INSERT orders OFF;

-- dữ liệu bảng order_details
INSERT INTO order_details (order_id, product_id, quantity, price_at_order, updated_at, created_at) VALUES
(1, 1, 1, 1000, GETDATE(), GETDATE()), 
(1, 2, 2, 3000, GETDATE(), GETDATE()), 
(2, 3, 1, 2000, GETDATE(), GETDATE()), 
(3, 4, 1, 1000, GETDATE(), GETDATE()), 
(4, 5, 1, 1000, GETDATE(), GETDATE()),
(5, 6, 3, 2000, GETDATE(), GETDATE()), 
(6, 7, 1, 3000, GETDATE(), GETDATE()), 
(7, 8, 1, 1000, GETDATE(), GETDATE()), 
(8, 2, 2, 900, GETDATE(), GETDATE()), 
(9, 1, 1, 800, GETDATE(), GETDATE()), 
(10, 3, 1, 200, GETDATE(), GETDATE()), 
(11, 5, 1, 1000, GETDATE(), GETDATE()); 





