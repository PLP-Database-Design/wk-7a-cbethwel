-- Question 1: Achieving 1NF (First Normal Form)

-- Step 1: Creating the normalized table structure
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

-- Step 2: Inserting the normalized data
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


--  Question 2: Achieving 2NF

-- Step 1: Creating a separate Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(255)
);

-- Step 2: Creating an Order table that references the Customer
CREATE TABLE `Order` (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Step 3: Creating an OrderDetails table with Product and Quantity
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
);

-- Step 4: Inserting the normalized data

-- Inserting Customers
INSERT INTO Customer (CustomerName)
VALUES 
('John Doe'),
('Jane Smith'),
('Emily Clark');

-- Inserting Orders
INSERT INTO `Order` (OrderID, CustomerID)
VALUES 
(101, 1), -- John Doe
(102, 2), -- Jane Smith
(103, 3); -- Emily Clark

-- Inserting Order Details
INSERT INTO OrderDetails (OrderID, Product, Quantity)
VALUES 
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);