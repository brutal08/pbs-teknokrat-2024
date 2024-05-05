CREATE DATABASE D_CAFE;
USE D_CAFE;

CREATE TABLE Customers (
 customer_id INT PRIMARY KEY AUTO_INCREMENT,
 customer_name VARCHAR(255),
 email VARCHAR(255),
 phone_number VARCHAR(20)
);

INSERT INTO Customers (customer_name, email, phone_number)
VALUES ('Hanif', 'hanif.al@email.com', '123-456-7890');


CREATE TABLE Orders (
 order_id INT PRIMARY KEY AUTO_INCREMENT,
 customer_id INT,
 order_date DATE,
 order_status ENUM('placed', 'in_progress', 'completed', 'cancelled'), -- menambahkan order status
 total_amount DECIMAL(10,2),
 FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (customer_id, order_date, order_status, total_amount)
VALUES (1, '2024-03-25', 'placed', 4.50); -- (ID 1) memesan Latte hari ini


CREATE TABLE Menu (
 menu_id INT PRIMARY KEY AUTO_INCREMENT,
 menu_name VARCHAR(255),
 price DECIMAL(10,2),
 menu_type ENUM('coffee', 'tea', 'food', 'dessert'), -- menambahkan menu type
 stock INT DEFAULT NULL -- menambahkan jumlah stok opsional
);

INSERT INTO Menu (menu_name, price, menu_type)
VALUES ('Latte', 4.50, 'coffee');

INSERT INTO Menu (menu_name, price, menu_type, stock)
VALUES ('Green Tea', 3.00, 'tea', 10); -- termasuk stok opsional

INSERT INTO Menu (menu_name, price, menu_type)
VALUES ('Chocolate Cake', 5.99, 'dessert');

INSERT INTO Menu (menu_name, price, menu_type)
VALUES ('Chicken Sandwich', 7.25, 'food');

CREATE TABLE Staff (
  staff_id INT PRIMARY KEY AUTO_INCREMENT,
  staff_name VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(20),
  ROLE ENUM('barista', 'cashier', 'designer')  -- Add "designer" role
);

INSERT INTO Staff (staff_name, email, phone_number, ROLE)
VALUES ('Hanif', 'hanif.al@email.com', '123-456-7`information_schema`890', 'barista');  -- Assuming Hanif is now a barista

INSERT INTO Staff (staff_name, email, phone_number, ROLE)
VALUES ('Aisha Jones', 'aisha.jones@email.com', '987-654-3210', 'designer');  -- New designer staff