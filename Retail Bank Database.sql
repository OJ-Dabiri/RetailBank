CREATE DATABASE RetailBank;

USE RetailBank;

CREATE TABLE branch 
(
number INT PRIMARY KEY AUTO_INCREMENT,
address VARCHAR(40)
);

CREATE TABLE department
(
number INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30)
);

CREATE TABLE manager
(
name VARCHAR(40),
id INT PRIMARY KEY AUTO_INCREMENT,
department_managed VARCHAR(30) REFERENCES department(number)
);

CREATE TABLE employee
(
name VARCHAR(40),
id INT PRIMARY KEY AUTO_INCREMENT,
address VARCHAR(40),
managed_by INT REFERENCES manager(id)
);

CREATE TABLE customers
(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(40) NOT NULL,
address VARCHAR(40)
);

CREATE TABLE accounts 
(
account_number INT PRIMARY KEY AUTO_INCREMENT,
balance DECIMAL(10,2) DEFAULT 0.00,
account_type ENUM('checking', 'savings') NOT NULL,
customer_id INT NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
transaction_number INT PRIMARY KEY AUTO_INCREMENT,
transaction_type ENUM('withdrawal', 'deposit') NOT NULL,
amount DECIMAL(10, 2) NOT NULL,
date DATETIME DEFAULT CURRENT_TIMESTAMP,
account_number INT NOT NULL,
FOREIGN KEY (account_number) REFERENCES accounts(account_number)
);

CREATE TABLE loans (
loan_number INT PRIMARY KEY AUTO_INCREMENT,
maturity_date DATE NOT NULL,
amount DECIMAL(10, 2) NOT NULL,
customer_id INT NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

