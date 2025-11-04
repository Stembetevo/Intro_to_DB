-- MySQL-compatible schema for alx_book_store
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Authors
CREATE TABLE Authors (
  author_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(215) NOT NULL
) ENGINE=InnoDB;

-- Books
CREATE TABLE Books (
  book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  publication_date DATE NULL,
  INDEX idx_books_author_id (author_id),
  CONSTRAINT fk_books_author FOREIGN KEY (author_id) REFERENCES Authors(author_id) 
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Customers
CREATE TABLE Customers (
  customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215) NOT NULL,
  address TEXT NULL,
  UNIQUE KEY uq_customers_email (email)
) ENGINE=InnoDB;

-- Orders
CREATE TABLE Orders (
  order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  INDEX idx_orders_customer_id (customer_id),
  CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Order_Details
CREATE TABLE Order_Details (
  orderdetailid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE,
  INDEX idx_od_order_id (order_id),
  INDEX idx_od_book_id (book_id),
  CONSTRAINT fk_od_order FOREIGN KEY (order_id) REFERENCES Orders(order_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_od_book FOREIGN KEY (book_id) REFERENCES Books(book_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
