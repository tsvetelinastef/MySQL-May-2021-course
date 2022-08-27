-- From the Exercise:

# 0.	Create Database
/*  create database ...create it using SQL queries.
 Firstly, just create new database named minions. */ 
CREATE DATABASE `minions`;
USE `minions`;


# 1. 	Create Tables    for 100 out of 100
-- In the newly created database Minions add table minions (id, name, age). 
-- Then add new table towns (id, name). Set id columns of both tables to be primary key as constraint.
-- Submit your create table queries together
-- for both tables (one after another separated by “;”) as Run queries & check DB.

-- CREATE TABLE `minions`.`minions`(
CREATE TABLE `minions`.`minions`(
	`id`INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `age` INT
);

-- CREATE TABLE `minions`.`towns`(
CREATE TABLE `towns`(
	`town_id`INT PRIMARY KEY AUTO_INCREMENT, 
    `name` VARCHAR(30) NOT NULL
);

# 2.  Alter Minions Table    100 out of 100
/*
Before continuing with the next assignments, rename the town_id to id using Workbench's GUI.
Do not submit this query on the Judge System.
Change the structure of the Minions table to have new column town_id that would be of the same type as the id column of towns table.
 Add new constraint that makes town_id foreign key and references to id column of towns table. 
 Submit your create table query in  as MySQL run skeleton, run queries & check DB
*/ 

ALTER TABLE `minions`
ADD COLUMN `town_id`INT, 
ADD CONSTRAINT fk_minions_towns
FOREIGN KEY (`town_id`)
REFERENCES `towns`(`id`);

# 3.	Insert Records in Both Tables
-- 100 out of 100
INSERT INTO `towns`
VALUES 
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna');

INSERT INTO `minions`
VALUES 
(1, 'Kevin', 22, 1),
(2, 'Bob', 15, 3),
(3, 'Steward', NULL, 2);


# 4.   Truncate Table Minions  100 out of 100
-- Delete all the data from the minions table using SQL query. 
TRUNCATE `minions`;
SELECT * FROM `minions`;

# 5.	Drop All Tables   100 out of 100
-- Delete all tables from the minions database using SQL query. 
DROP TABLE `minions`;
DROP TABLE `towns`;

# 6.	Create Table People
/* Using SQL query create table "people" with columns:
•	id – unique number for every person there will be no more than 231-1people. (Auto incremented)
•	name – full name of the person will be no more than 200 Unicode characters. (Not null)
•	picture – image with size up to 2 MB. (Allow nulls)
•	height –  In meters. Real number precise up to 2 digits after floating point. (Allow nulls)
•	weight –  In kilograms. Real number precise up to 2 digits after floating point. (Allow nulls)
•	gender – Possible states are m or f. (Not null)
•	birthdate – (Not null)
•	biography – detailed biography of the person it can contain max allowed Unicode characters. (Allow nulls)
Make id primary key. Populate the table with 5 records.  

88 out of 100
*/ 
CREATE TABLE `people`(
	`id` INT PRIMARY KEY AUTO_INCREMENT, 
    `name` VARCHAR(200) NOT NULL,
    `picture` BLOB,
    `height` FLOAT(5, 2),
    `weight`FLOAT(5, 2),
    `gender` CHAR(1) NOT NULL,
    `birthdate` DATE NOT NULL,
    `biography` TEXT
);

INSERT INTO people (id,`name`, picture, height, weight, gender, birthdate, biography)
VALUES (1, 'John', NULL, 0.85, 13, 'm', '2018-11-09', 'Johnny'),
(2, 'John', NULL, 0.85, 13, 'm', '2018-11-09', 'Johnny'),
(3, 'John', NULL, 0.85, 13, 'm', '2018-11-09', 'Johnny'),
(4, 'John', NULL, 0.85, 13, 'm', '2018-11-09', 'Johnny'),
(5, 'John', NULL, 0.85, 13, 'm', '2018-11-09', 'Johnny');

# 7.	Create Table Users
/* Using SQL query create table users with columns:
•	id – unique number for every user. There will be no more than 263-1 users. (Auto incremented)
•	username – unique identifier of the user will be no more than 30 characters (non Unicode). (Required)
•	password – password will be no longer than 26 characters (non Unicode). (Required)
•	profile_picture – image with size up to 900 KB. 
•	last_login_time
•	is_deleted – shows if the user deleted his/her profile. Possible states are true or false.
Make id primary key. Populate the table with 5 records. Submit your CREATE and INSERT statements. 

100 out of 100
*/ 

CREATE TABLE users(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(30) UNIQUE NOT NULL, 
	password VARCHAR(26) NOT NULL,
	profile_picture MEDIUMBLOB,
	last_login_time DATETIME,
	is_deleted BOOL 
);

INSERT INTO users (username, password, profile_picture, last_login_time, is_deleted) 
VALUES('John', 'random123456789', NULL, '2015-12-08', TRUE),
      ('James', 'random123789', NULL, '2015-12-08', FALSE),
      ('Blake', 'random12789', NULL, '2011-12-11', TRUE),
      ('Jessie', 'random12346789', NULL, '2014-12-26', FALSE),
      ('Charlie', 'random1234567', NULL, '2015-12-14' , TRUE);
      
# is_deleted BOOL ..... and 'true' --> NO
-- 'true','true',  'false', 'false', 'true' in the 5 records --> Compile time error
-- NOW() everywhere in the 5 records ---> Compile time 404    
 -- TRUE, FALSE, TRUE, FALSE, TRUE
 
#8.	Change Primary Key
-- Using SQL queries modify table users from the previous task. First remove current primary key then create new primary key that
--  would be combination of fields id and username. The initial primary key name on id is pk_users.
 --  100 out of 100
 ALTER TABLE `users`
 DROP PRIMARY KEY,
 ADD CONSTRAINT pk_users
 PRIMARY KEY(`id`, `username`);
 
 
# 9.	Set Default Value of a Field  -- 100 out of 100
-- Using SQL queries modify table users. Make the default value of last_login_time field to be the current time
--  Submit your query as Run skeleton, run queries & check DB.

-- ALTER TABLE `minions`. `users`   ----> No
-- ALTER TABLE  `users`
-- CHANGE COLUMN `gender`. `gender` CHAR(1) NOT NULL DEFAULT 'M';

ALTER TABLE users
MODIFY  COLUMN last_login_time 
TIMESTAMP 
NOT NULL DEFAULT CURRENT_TIMESTAMP;

# 10.	 Set Unique Field
-- Using SQL queries modify table users. Remove username field from the primary key so only the field id would be primary key.
--  Now add unique constraint to the username field. The initial primary key name on (id, username) is pk_users.
--  100 out of 100

ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users  -- pk_id
PRIMARY KEY(id),
ADD CONSTRAINT uq_username
UNIQUE(username);     -- unique constraint to the username field


# 11.	Movies Database
-- Using SQL queries create Movies database with the following entities:
-- •	directors (id, director_name, notes) 
-- o	director_name cannot be null
-- •	genres (id, genre_name, notes) 
-- o	genre_name cannot be null
-- •	categories (id, category_name, notes)  
-- o	category_name cannot be null
-- •	movies (id, title, director_id, copyright_year, length, genre_id, category_id, rating, notes)
-- o	title cannot be null
-- Set most appropriate data types for each column. Set primary key to each table. Populate each table with 5 records. 
-- Make sure the columns that are present in 2 tables would be of the same data type. Consider which fields are always 
-- required and which are optional. Submit your CREATE TABLE and INSERT statements as Run queries & check DB.
# 
CREATE DATABASE `Movies`;
USE `Movies`;

CREATE TABLE `directors` (
	`id` INT NOT NULL PRIMARY KEY , --  Id  INT NOT NULL PRIMARY KEY,... INT PRIMARY KEY AUTO_INCREMENT
	`director_name` VARCHAR(30) NOT NULL,
	`notes` TEXT						-- Notes NVARCHAR(MAX), ... TEXT
);
      
INSERT INTO Directors(id,director_name)
VALUES(1,'Denis Villeneuve'),
	  (2,'Tom Kapinos'),
	  (3,'Adam McKay'),
	  (4,'Director Four'),
	  (5,'Director Five');

CREATE TABLE `genres` (
	`id` INT NOT NULL PRIMARY KEY ,  --   Id   INT NOT NULL PRIMARY KEY, .. INT PRIMARY KEY AUTO_INCREMENT
	`genre_name` VARCHAR(30) NOT NULL,
	`notes` TEXT				-- Notes  NVARCHAR(MAX)
);

INSERT INTO Genres(id,genre_name)
VALUES(1,'movie'),
	  (2,'serial'),
	  (3,'movie'),
	  (4,'Genre Four'),
	  (5,'Genre Five');
      

CREATE TABLE `categories` (
	`id` INT NOT NULL PRIMARY KEY , -- INT PRIMARY KEY AUTO_INCREMENT
	`category_name` VARCHAR(30) NOT NULL,
	`notes` TEXT
);

INSERT INTO Categories(id,category_name)
VALUES(1,'movie'),
	  (2,'serial'),
	  (3,'movie'),
	  (4,'Category Four'),
	  (5,'Category Five');
      
CREATE TABLE `movies` (
	`id` INT NOT NULL PRIMARY KEY ,  --  Id  , ... INT PRIMARY KEY AUTO_INCREMENT
	`title`  NVARCHAR(255) NOT NULL,      --  NOT NULL,... VARCHAR(50)
    `director_id` FOREIGN KEY REFERENCES Directors(id)  ,   -- INT FOREIGN KEY REFERENCES Directors(id),.. INT PRIMARY KEY AUTO_INCREMENT
    `copyright_year` year,     -- INT
    `length` time , 		-- NVARCHAR(50),
    `genre_id` VARCHAR(20) NOT NULL,   -- INT FOREIGN KEY REFERENCES Genres(Id),
    `category_id` VARCHAR(20) NOT NULL,  --  INT FOREIGN KEY REFERENCES Categories(Id),
    `rating` INT, 
	`notes`TEXT		-- NVARCHAR(MAX)
);

INSERT INTO movies(id,title, director_id, genre_id, category_id)
VALUES(1,'movie'),
	  (2,'serial'),
	  (3,'movie'),
	  (4,'movie Four'),
	  (5,'movie Five');


# 12.	Car Rental Database
-- Using SQL queries create car_rental database with the following entities:
-- •	categories (id, category, daily_rate, weekly_rate, monthly_rate, weekend_rate)
-- •	cars (id, plate_number, make, model, car_year, category_id, doors, picture, car_condition, available)
-- •	employees (id, first_name, last_name, title, notes)
-- •	customers (id, driver_licence_number, full_name, address, city, zip_code, notes)
-- •	rental_orders (id, employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status, notes)
-- Set most appropriate data types for each column. Set primary key to each table.
-- Populate each table with 3 records. Make sure the columns that are present in 2 tables would be of the same data type. 
-- Consider which fields are always required and which are optional. Submit your CREATE TABLE and INSERT statements as Run queries & check DB.


# 13.	Basic Insert
-- Now create bigger database called soft_uni. You will use database in the future tasks. It should hold information about
--     • towns (id, name)
--    • addresses (id, address_text, town_id)
--    • departments (id, name)
--    • employees (id, first_name, middle_name, last_name, job_title, department_id, hire_date, salary, address_id)
-- Id columns are auto incremented starting from 1 and increased by 1 (1, 2, 3, 4…). Make sure you use appropriate data types for each column. Add primary and foreign keys as constraints for each table. Use only SQL queries. Consider which fields are always required and which are optional.
-- Do not submit creation of database only the insert statements.

-- Use the SoftUni database and insert some data using SQL queries.
-- name	job_title	department	hire_date	salary
-- Ivan Ivanov Ivanov	.NET Developer	Software Development	01/02/2013	3500.00
-- Petar Petrov Petrov	Senior Engineer	Engineering	02/03/2004	4000.00
-- Maria Petrova Ivanova	Intern	Quality Assurance	28/08/2016	525.25
-- Georgi Terziev Ivanov	CEO	Sales	09/12/2007	3000.00
-- Peter Pan Pan	Intern	Marketing	28/08/2016	599.88
-- •	towns: Sofia, Plovdiv, Varna, Burgas
-- •	departments: Engineering, Sales, Marketing, Software Development, Quality Assurance
-- •	employees:
-- Submit your INSERT queries in Judge as Run skeleton, run queries & check DB.


# 14.	Basic Select All Fields
-- Use the soft_uni database and first select all records from the towns, then from departments and
-- finally from employees table. Use SQL queries and submit them to Judge at once. Submit your query statements as Prepare DB & Run queries.

# 15.	Basic Select All Fields and Order Them
-- Modify queries from previous problem by sorting:
-- •	towns - alphabetically by name
-- •	departments - alphabetically by name
-- •	employees - descending by salary
-- Submit your query statements as Prepare DB & Run queries.

# 16.	Basic Select Some Fields
-- Modify queries from previous problem to show only some of the columns. For table:
-- •	towns – name
-- •	departments – name
-- •	employees – first_name, last_name, job_title, salary
-- Keep the ordering from the previous problem. Submit your query statements as Prepare DB & Run queries.

# 17.	Increase Employees Salary
-- Use softuni database and increase the salary of all employees by 10%. Then select only salary column from 
-- the employees table. Submit your query statements as Prepare DB & Run queries.


# 18.	Delete All Records
-- Use SQL query to delete all records from the table with name occupancies. 





