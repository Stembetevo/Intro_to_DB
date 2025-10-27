-- SQL schema for ALX Book Store
-- Database: alx_book_store

CREATE DATABASE IF NOT EXISTS `alx_book_store`;
USE `alx_book_store`;

CREATE TABLE IF NOT EXISTS `Authors` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `author_name` VARCHAR(215) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Books` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(130) NOT NULL,
  `author_id` INT NOT NULL,
  `price` DOUBLE NOT NULL,
  `publication_date` DATE,
  PRIMARY KEY (`book_id`),
  INDEX `idx_books_author_id` (`author_id`),
  CONSTRAINT `fk_books_author` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(215) NOT NULL,
  `email` VARCHAR(215) NOT NULL,
  `address` TEXT,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `uq_customers_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `idx_orders_customer_id` (`customer_id`),
  CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Order_Details` (
  `orderdetailid` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `quantity` DOUBLE NOT NULL,
  PRIMARY KEY (`orderdetailid`),
  INDEX `idx_od_order_id` (`order_id`),
  INDEX `idx_od_book_id` (`book_id`),
  CONSTRAINT `fk_od_order` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_od_book` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Optional: sample data inserts (commented out)
-- INSERT INTO `Authors` (`author_name`) VALUES ('George Orwell'), ('J.K. Rowling');
-- INSERT INTO `Books` (`title`, `author_id`, `price`, `publication_date`) VALUES
-- ('1984', 1, 9.99, '1949-06-08'),
-- ('Harry Potter and the Philosopher''s Stone', 2, 12.5, '1997-06-26');

-- End of schema
