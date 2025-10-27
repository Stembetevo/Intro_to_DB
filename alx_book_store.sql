-- SQL schema for ALX Book Store (SQL Server)
-- Database: alx_book_store

IF DB_ID(N'alx_book_store') IS NULL
BEGIN
    CREATE DATABASE [alx_book_store];
END
GO

USE [alx_book_store];
GO

CREATE TABLE Authors (
  author_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  author_name VARCHAR(215) NOT NULL
);
GO

CREATE TABLE Books (
  book_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  publication_date DATE NULL
);
GO

CREATE INDEX idx_books_author_id ON Books(author_id);
GO

ALTER TABLE Books
ADD CONSTRAINT fk_books_author FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE NO ACTION ON UPDATE CASCADE;
GO

CREATE TABLE Customers (
  customer_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215) NOT NULL,
  address VARCHAR(MAX) NULL
);
GO

CREATE UNIQUE INDEX uq_customers_email ON Customers(email);
GO

CREATE TABLE Orders (
  order_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL
);
GO

CREATE INDEX idx_orders_customer_id ON Orders(customer_id);
GO

ALTER TABLE Orders
ADD CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE;
GO

CREATE TABLE Order_Details (
  orderdetailid INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity INT NOT NULL
);
GO

CREATE INDEX idx_od_order_id ON Order_Details(order_id);
CREATE INDEX idx_od_book_id ON Order_Details(book_id);
GO

ALTER TABLE Order_Details
ADD CONSTRAINT fk_od_order FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_od_book FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE NO ACTION ON UPDATE CASCADE;
GO

-- Optional: sample data inserts (commented out)
-- INSERT INTO Authors (author_name) VALUES ('George Orwell'), ('J.K. Rowling');
-- INSERT INTO Books (title, author_id, price, publication_date) VALUES
-- ('1984', 1, 9.99, '1949-06-08'),
-- ('Harry Potter and the Philosopher''s Stone', 2, 12.50, '1997-06-26');

-- End of schema
