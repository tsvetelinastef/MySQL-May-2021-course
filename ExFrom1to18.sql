-- From the Exercise:

# 0.	Create Database
/* You now know how to create database using the GUI of the Workbench. Now it's time to create it using SQL queries.
 In that task (and the several following it) you will be required to create the database from the previous exercise using only SQL queries. 
 Firstly, just create new database named minions. */ 

CREATE DATABASE `minions`;
USE `minions`;


# 1. 	Create Tables
-- In the newly created database Minions add table minions (id, name, age). 
-- Then add new table towns (id, name). Set id columns of both tables to be
-- primary key as constraint. Submit your create table queries in Judge together
-- for both tables (one after another separated by “;”) as Run queries & check DB.

CREATE TABLE `minions`(
	`id`INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `age` INT
);

CREATE TABLE `towns`(
	`town_id`INT PRIMARY KEY AUTO_INCREMENT, 
    `name` VARCHAR(30) NOT NULL
);