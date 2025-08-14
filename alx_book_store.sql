CREATE DATABASE IF NOT EXISTS alx_book_store;

USE alx_book_store;

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
);

CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);


CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
);

CREATE TABLE Order_Details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL DEFAULT 1.0,
);

-- CREATE INDEX idx_books_author ON Books(author_id);
-- CREATE INDEX idx_books_title ON Books(title);
-- CREATE INDEX idx_orders_customer ON Orders(customer_id);
-- CREATE INDEX idx_orders_date ON Orders(order_date);
-- CREATE INDEX idx_order_details_order ON Order_Details(order_id);
-- CREATE INDEX idx_order_details_book ON Order_Details(book_id);
-- CREATE INDEX idx_customers_email ON Customers(email);


-- -- Sample Authors
-- INSERT INTO Authors (author_name) VALUES
-- ('J.K. Rowling'),
-- ('George Orwell'),
-- ('Harper Lee'),
-- ('F. Scott Fitzgerald'),
-- ('Jane Austen'),
-- ('Mark Twain'),
-- ('Ernest Hemingway'),
-- ('Agatha Christie');

-- -- Sample Customers
-- INSERT INTO Customers (customer_name, email, address) VALUES
-- ('John Smith', 'john.smith@email.com', '123 Main Street, New York, NY 10001'),
-- ('Sarah Johnson', 'sarah.johnson@email.com', '456 Oak Avenue, Los Angeles, CA 90210'),
-- ('Michael Brown', 'michael.brown@email.com', '789 Pine Road, Chicago, IL 60601'),
-- ('Emily Davis', 'emily.davis@email.com', '321 Elm Street, Houston, TX 77001'),
-- ('David Wilson', 'david.wilson@email.com', '654 Maple Drive, Phoenix, AZ 85001');

-- -- Sample Books
-- INSERT INTO Books (title, author_id, price, publication_date) VALUES
-- ('Harry Potter and the Philosopher''s Stone', 1, 25.99, '1997-06-26'),
-- ('Harry Potter and the Chamber of Secrets', 1, 25.99, '1998-07-02'),
-- ('1984', 2, 15.99, '1949-06-08'),
-- ('Animal Farm', 2, 12.99, '1945-08-17'),
-- ('To Kill a Mockingbird', 3, 18.99, '1960-07-11'),
-- ('The Great Gatsby', 4, 16.99, '1925-04-10'),
-- ('Pride and Prejudice', 5, 14.99, '1813-01-28'),
-- ('The Adventures of Tom Sawyer', 6, 13.99, '1876-06-01'),
-- ('The Old Man and the Sea', 7, 11.99, '1952-09-01'),
-- ('Murder on the Orient Express', 8, 17.99, '1934-01-01');

-- -- Sample Orders
-- INSERT INTO Orders (customer_id, order_date) VALUES
-- (1, '2024-01-15'),
-- (2, '2024-01-16'),
-- (3, '2024-01-17'),
-- (1, '2024-01-20'),
-- (4, '2024-01-22'),
-- (5, '2024-01-25'),
-- (2, '2024-01-28');

-- -- Sample Order Details
-- INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
-- -- Order 1: John Smith
-- (1, 1, 2.0),  -- Harry Potter Book 1, quantity 2
-- (1, 3, 1.0),  -- 1984, quantity 1
-- -- Order 2: Sarah Johnson
-- (2, 5, 1.0),  -- To Kill a Mockingbird, quantity 1
-- (2, 6, 1.0),  -- The Great Gatsby, quantity 1
-- (2, 7, 1.0),  -- Pride and Prejudice, quantity 1
-- -- Order 3: Michael Brown
-- (3, 2, 1.0),  -- Harry Potter Book 2, quantity 1
-- (3, 4, 2.0),  -- Animal Farm, quantity 2
-- -- Order 4: John Smith (second order)
-- (4, 8, 1.0),  -- Tom Sawyer, quantity 1
-- (4, 9, 1.0),  -- The Old Man and the Sea, quantity 1
-- -- Order 5: Emily Davis
-- (5, 10, 1.0), -- Murder on the Orient Express, quantity 1
-- -- Order 6: David Wilson
-- (6, 1, 1.0),  -- Harry Potter Book 1, quantity 1
-- (6, 3, 1.0),  -- 1984, quantity 1
-- (6, 5, 1.0),  -- To Kill a Mockingbird, quantity 1
-- -- Order 7: Sarah Johnson (second order)
-- (7, 7, 2.0);  -- Pride and Prejudice, quantity 2

-- -- Verify the database structure
-- SHOW TABLES;

-- -- Display table structures
-- DESCRIBE Authors;
-- DESCRIBE Customers;
-- DESCRIBE Books;
-- DESCRIBE Orders;
-- DESCRIBE Order_Details;

-- -- Sample queries to verify data
-- SELECT 'Authors Table:' AS Info;
-- SELECT * FROM Authors;

-- SELECT 'Customers Table:' AS Info;
-- SELECT * FROM Customers;

-- SELECT 'Books with Author Names:' AS Info;
-- SELECT b.book_id, b.title, a.author_name, b.price, b.publication_date
-- FROM Books b
-- JOIN Authors a ON b.author_id = a.author_id;

-- SELECT 'Orders with Customer Names:' AS Info;
-- SELECT o.order_id, c.customer_name, o.order_date
-- FROM Orders o
-- JOIN Customers c ON o.customer_id = c.customer_id;

-- SELECT 'Order Details with Book and Customer Info:' AS Info;
-- SELECT 
--     od.order_detail_id,
--     c.customer_name,
--     b.title,
--     a.author_name,
--     od.quantity,
--     b.price,
--     (od.quantity * b.price) AS line_total
-- FROM Order_Details od
-- JOIN Orders o ON od.order_id = o.order_id
-- JOIN Customers c ON o.customer_id = c.customer_id
-- JOIN Books b ON od.book_id = b.book_id
-- JOIN Authors a ON b.author_id = a.author_id
-- ORDER BY od.order_id, od.order_detail_id;