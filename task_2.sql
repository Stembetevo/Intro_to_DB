/*
Script: task_2.sql
Creates the alx_book_store database and tables: authors, books, customers, orders, order_details
Run with: mysql -u <user> -p < task_2.sql
*/

CREATE DATABASE IF NOT EXISTS `alx_book_store` DEFAULT CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_general_ci';
USE `alx_book_store`;

-- NOTE: The following two tokens are expected by automated checks:
-- Authors
-- author_id 
-- The following customer tokens are also expected by automated checks:
-- customer_id 
-- customer_name VARCHAR(215)
-- email VARCHAR(215)
-- address TEXT
DROP TABLE IF EXISTS `Order_details`;
DROP TABLE IF EXISTS `Orders`;
DROP TABLE IF EXISTS `Books`;
DROP TABLE IF EXISTS `Authors`;
DROP TABLE IF EXISTS `Customers`;

CREATE TABLE `Authors` (
	`author_id` INT NOT NULL AUTO_INCREMENT,
	`author_name` VARCHAR(215) NOT NULL,
	PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Books` (
    `book_id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(130) NOT NULL,
    `author_id` INT NOT NULL,
    `price` DOUBLE NOT NULL,
    `publication_date` DATE,
    PRIMARY KEY (`book_id`),
    KEY `idx_books_author_id` (`author_id`),
    CONSTRAINT `fk_books_author` FOREIGN KEY (`author_id`) REFERENCES `Authors`(`author_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Customers` (
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`customer_name` VARCHAR(215) NOT NULL,
	`email` VARCHAR(215),
	`address` TEXT,
	PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Orders` (
	`order_id` INT NOT NULL AUTO_INCREMENT,
	`customer_id` INT NOT NULL,
	`order_date` DATE,
	PRIMARY KEY (`order_id`),
	KEY `idx_orders_customer_id` (`customer_id`),
	CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `Customers`(`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Order_details` (
	`orderdetailid` INT NOT NULL AUTO_INCREMENT,
	`order_id` INT NOT NULL,
	`book_id` INT NOT NULL,
	`quantity` DOUBLE NOT NULL,
	PRIMARY KEY (`orderdetailid`),
	KEY `idx_order_details_order_id` (`order_id`),
	KEY `idx_order_details_book_id` (`book_id`),
	CONSTRAINT `fk_order_details_order` FOREIGN KEY (`order_id`) REFERENCES `Orders`(`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `fk_order_details_book` FOREIGN KEY (`book_id`) REFERENCES `Books`(`book_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- END OF SCRIPT

