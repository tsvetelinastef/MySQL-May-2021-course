 CREATE TABLE `employees` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `first_name` VARCHAR(50) NOT NULL,
   `last_name` VARCHAR(50) NOT NULL,
   PRIMARY KEY (`id`));

CREATE TABLE `categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`));
  
  CREATE TABLE `products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`));

-- CREATE TABLE `gamebar`.`employees` ( .......


-- 2. Insert Data in Table
-- Inserting data can be done with a query too. To do that we use 
-- the "INSERT" clause. Populate the "employees" table with 3 test values.
-- SELECT * FROM gamebar.employees; za proba

--  INSERT INTO employees(id, name, name) VALUES
--  (1, 'Ivan', 'Ivanov'),
--  (2, 'Dean', 'Lewis'),
--  (3, 'Lewis', 'Capaldi')
-- za proba

-- zad 2 --> za 100 ot 100
INSERT INTO employees VALUES(1, 'Ivan', 'Ivanov');
INSERT INTO employees VALUES(2, 'Dean', 'Lewis');
INSERT INTO employees VALUES(3, 'Lewis', 'Capaldi');


-- trying something
-- ALTER TABLE employees VALUES (1, 'Ivan', 'Ivanov', 'Ivanov' );
-- ALTER TABLE employees VALUES(2, 'Dean','Jason', 'Lewis');
-- ALTER TABLE employees VALUES(3, 'Lewis', 'Rae', 'Capaldi');


-- zad 3              100 out of 100
ALTER TABLE `employees`
ADD `middle_name` VARCHAR(50) NOT NULL;


-- zad 4                 
-- ALTER TABLE categories 
-- ADD CONSTRAINT category_id 
-- PRIMARY KEY (id) REFERENCES products(id); 
-- 

-- zad 5
ALTER TABLE `employees`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_id
PRIMARY KEY(id),
ADD CONSTRAINT uq_username
UNIQUE(username);


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
