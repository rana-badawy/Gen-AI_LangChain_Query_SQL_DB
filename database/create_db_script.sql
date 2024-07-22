-- Create the database
CREATE DATABASE products;
USE products;

-- Create the products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_type ENUM('T-shirt', 'Shirt', 'Blouse', 'Pants', 'Shorts', 'Skirt') NOT NULL,
    brand ENUM('Levi', 'Nike', 'Adidas') NOT NULL,
    color ENUM('Red', 'Blue', 'Black', 'White') NOT NULL,
    size ENUM('XS', 'S', 'M', 'L', 'XL') NOT NULL,
    price INT CHECK (price BETWEEN 10 AND 50),
    stock_quantity INT NOT NULL,
    UNIQUE KEY brand_color_size (product_type, brand, color, size)
);

-- Create the discounts table
CREATE TABLE discounts (
    discount_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    pct_discount DECIMAL(5,2) CHECK (pct_discount BETWEEN 0 AND 100),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into the products table
INSERT INTO products (product_id, product_type, brand, color, size, price, stock_quantity)
VALUES
	(1, 'T-shirt', 'Nike', 'Black', 'XS', 18, 66),
    (2, 'Pants', 'Nike', 'Red', 'S', 23, 58),
    (3, 'Shorts', 'Adidas', 'White', 'M', 21, 86),
    (4, 'Blouse', 'Nike', 'White', 'XS', 20, 80),
    (5, 'T-shirt', 'Levi', 'Red', 'XL', 45, 45),
    (6, 'Blouse', 'Levi', 'Blue', 'L', 14, 61),
    (7, 'Shorts', 'Nike', 'White', 'XL', 21, 85),
    (8, 'T-shirt', 'Levi', 'Black', 'L', 13, 16),
    (9, 'Shirt', 'Levi', 'Black', 'XL', 41, 93),
    (10, 'Shorts', 'Levi', 'Black', 'L', 35, 26),
    (11, 'Pants', 'Levi', 'Black', 'XL', 32, 95),
    (12, 'Shirt', 'Levi', 'Blue', 'L', 38, 37),
    (13, 'Blouse', 'Nike', 'Blue', 'L', 14, 70),
    (14, 'T-shirt', 'Levi', 'Black', 'XS', 23, 39),
    (15, 'Shirt', 'Nike', 'Blue', 'S', 16, 93),
    (16, 'Skirt', 'Levi', 'Blue', 'XS', 35, 66),
    (17, 'T-shirt', 'Levi', 'White', 'M', 46, 73),
    (18, 'Shirt', 'Adidas', 'White', 'XS', 15, 43),
    (19, 'Skirt', 'Nike', 'Black', 'S', 44, 19),
    (20, 'Shorts', 'Levi', 'Black', 'XL', 42, 28),
    (21, 'Blouse', 'Nike', 'Blue', 'S', 45, 29),
    (22, 'Pants', 'Nike', 'White', 'S', 35, 48),
    (23, 'T-shirt', 'Levi', 'Blue', 'XL', 14, 10),
    (24, 'Blouse', 'Adidas', 'Blue', 'XL', 46, 64),
    (25, 'Shorts', 'Levi', 'Red', 'S', 12, 46),
    (26, 'Skirt', 'Adidas', 'Blue', 'M', 50, 34),
    (27, 'Skirt', 'Nike', 'Black', 'L', 38, 25),
    (28, 'Shirt', 'Adidas', 'Red', 'S', 29, 69),
    (29, 'Blouse', 'Adidas', 'Blue', 'S', 48, 60),
    (30, 'T-shirt', 'Adidas', 'White', 'XL', 31, 30),
    (31, 'Skirt', 'Nike', 'Red', 'XS', 19, 68),
    (32, 'Pants', 'Nike', 'Black', 'L', 15, 54),
    (33, 'Shorts', 'Levi', 'Blue', 'L', 20, 38),
    (35, 'Pants', 'Levi', 'White', 'XS', 37, 97),
    (36, 'T-shirt', 'Adidas', 'Red', 'XS', 45, 36),
    (37, 'Pants', 'Adidas', 'Red', 'XL', 33, 92),
    (38, 'Shirt', 'Adidas', 'Black', 'S', 12, 34),
    (39, 'Skirt', 'Levi', 'White', 'XS', 27, 13),
    (40, 'Shirt', 'Adidas', 'White', 'XL', 30, 63),
    (42, 'Pants', 'Adidas', 'Blue', 'S', 32, 69),
    (43, 'Shirt', 'Nike', 'Red', 'S', 50, 11),
    (44, 'Blouse', 'Levi', 'White', 'M', 23, 38),
    (45, 'Skirt', 'Nike', 'White', 'S', 45, 68),
    (46, 'Skirt', 'Nike', 'White', 'M', 37, 13),
    (48, 'Pants', 'Levi', 'White', 'S', 41, 84),
    (49, 'Blouse', 'Adidas', 'Red', 'XL', 20, 63),
    (51, 'T-shirt', 'Levi', 'White', 'XL', 48, 19),
    (52, 'Shirt', 'Adidas', 'Blue', 'L', 23, 77),
    (53, 'Shirt', 'Adidas', 'Red', 'L', 33, 58),
    (55, 'Shorts', 'Adidas', 'Blue', 'L', 39, 26),
    (58, 'Shorts', 'Adidas', 'Red', 'XS', 33, 52),
    (59, 'Pants', 'Nike', 'Blue', 'XS', 35, 63),
    (60, 'Blouse', 'Levi', 'Red', 'S', 13, 60),
    (61, 'Skirt', 'Nike', 'Blue', 'L', 14, 72),
    (62, 'Pants', 'Levi', 'Blue', 'XL', 10, 14),
    (65, 'T-shirt', 'Adidas', 'Black', 'XS', 22, 33),
    (66, 'T-shirt', 'Nike', 'Blue', 'M', 44, 45),
    (67, 'T-shirt', 'Nike', 'Black', 'L', 44, 46),
    (68, 'Shirt', 'Nike', 'Blue', 'XL', 41, 42),
    (69, 'Shirt', 'Nike', 'Black', 'S', 28, 62),
    (70, 'T-shirt', 'Nike', 'Black', 'XL', 49, 89),
    (71, 'Shorts', 'Nike', 'Black', 'XL', 31, 86),
    (72, 'Skirt', 'Adidas', 'Blue', 'L', 11, 88),
    (73, 'Pants', 'Levi', 'Red', 'M', 41, 16),
    (74, 'T-shirt', 'Levi', 'Red', 'L', 20, 10),
    (75, 'T-shirt', 'Levi', 'White', 'S', 33, 12),
    (77, 'Pants', 'Nike', 'Black', 'XL', 41, 28),
    (78, 'T-shirt', 'Adidas', 'Blue', 'L', 44, 45),
    (79, 'Skirt', 'Nike', 'Red', 'M', 41, 38),
    (81, 'Blouse', 'Levi', 'Black', 'M', 22, 38),
    (84, 'Blouse', 'Levi', 'White', 'XL', 40, 22),
    (85, 'Skirt', 'Nike', 'Blue', 'M', 35, 71),
    (88, 'Pants', 'Nike', 'White', 'XS', 24, 66),
    (89, 'Shirt', 'Levi', 'Red', 'M', 26, 59),
    (90, 'Skirt', 'Nike', 'White', 'L', 38, 53),
    (91, 'Shirt', 'Nike', 'Black', 'L', 22, 23),
    (92, 'Shorts', 'Adidas', 'White', 'XL', 26, 47),
    (93, 'T-shirt', 'Adidas', 'Black', 'L', 48, 60),
    (96, 'T-shirt', 'Nike', 'Blue', 'S', 49, 10),
    (97, 'Pants', 'Levi', 'Blue', 'XS', 24, 57),
    (98, 'Shirt', 'Nike', 'Black', 'M', 42, 37),
    (99, 'Pants', 'Levi', 'Black', 'XS', 18, 53),
    (100, 'Blouse', 'Adidas', 'Black', 'XS', 36, 90);

-- Insert 10 records into the discounts table
INSERT INTO discounts (product_id, pct_discount)
VALUES
(1, 10.00),
(2, 15.00),
(3, 20.00),
(4, 5.00),
(5, 25.00),
(6, 10.00),
(7, 30.00),
(8, 35.00),
(9, 40.00),
(10, 45.00);