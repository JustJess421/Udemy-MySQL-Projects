CREATE DATABASE IF NOT EXISTS Sales;
USE Sales;
CREATE TABLE Sales
(
	purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
    );
CREATE TABLE Customers
(
	customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints int
    );
    
    DROP TABLE customers;
    DROP TABLE customers1;
  
  USE Sales;
  SELECT * FROM Sales;
  
  SELECT * FROM Sales.Sales;
  
  DROP TABLE Sales;
  
  CREATE TABLE Sales
(
	purchase_number INT NOT NULL AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY(purchase_number)
    );
    
ALTER TABLE Sales
ADD FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
    
    DROP TABLE Customers;
    
    CREATE TABLE Customers
(
	customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR (255),
    number_of_compliants INT,
    PRIMARY KEY (customer_id)
);

CREATE TABLE Items
(
	item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10,2),
    company_id VARCHAR(255),
    PRIMARY KEY (item_code)
);

DROP TABLE Items
  
CREATE TABLE Companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number INT(12),
    PRIMARY KEY (company_id)
);

DROP TABLE Sales;
DROP TABLE Customers;
DROP TABLE Items;
DROP TABLE Companies;

CREATE TABLE customers
(
	customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY (customer_id)
    );
    
ALTER TABLE customers
ADD COLUMN gender ENUM('M','F') AFTER last_name
  
INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)

VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0)

SELECT * FROM customers

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers (first_name, last_name, gender)
VALUES ('Peter', 'Figaro', 'M');

SELECT * FROM customers

ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT;

CREATE TABLE companies
(
	company_id INT AUTO_INCREMENT,
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number VARCHAR(255),
    PRIMARY KEY (company_id)
);
DROP TABLE companies