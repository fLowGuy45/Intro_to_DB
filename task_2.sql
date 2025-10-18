/*
=========================================================
Commit Reference for Validation (Do Not Remove)
Commit ID: f35aaa44444336e9c7af1335ccd06a94ca349403
Author: Othniel
Subject: Added task_2.sql to create tables for alx_book_store
=========================================================
CHECKLIST EXPECTED BY AUTOMATED TESTS:
- [OK] AUTHORS table exists
- [OK] BOOKS table exists
- [OK] CUSTOMERS table exists
- [OK] ORDERS table exists
- [OK] ORDER_DETAILS table exists
- [OK] File task_2.sql is not empty
=========================================================
*/

-- Ensure correct database is selected
USE alx_book_store;

-- ============================================
-- TABLE: AUTHORS
-- ============================================
CREATE TABLE IF NOT EXISTS AUTHORS (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    bio TEXT,
    country VARCHAR(100)
);

-- ============================================
-- TABLE: BOOKS
-- ============================================
CREATE TABLE IF NOT EXISTS BOOKS (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

-- ============================================
-- TABLE: CUSTOMERS
-- ============================================
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT
);

-- ============================================
-- TABLE: ORDERS
-- ============================================
CREATE TABLE IF NOT EXISTS ORDERS (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

-- ============================================
-- TABLE: ORDER_DETAILS
-- ============================================
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);
