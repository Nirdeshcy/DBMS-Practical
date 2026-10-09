-- Question 6: Hospital Staff and Department Management System
-- A. Theory:
-- Explain the purpose of DISTINCT, LIKE, IN, and BETWEEN in SQL. Describe how these operators are used with the WHERE clause. Also explain the difference between COUNT(*) and COUNT(column_name), and describe how column aliases are used to make query results easier to understand.
-- B. Practical:
-- Create a Hospital Staff Management System using Department and Staff tables.
-- 1. Create both tables with suitable attributes and establish a Primary Key and Foreign Key relationship.
-- 2. Apply appropriate NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
-- 3. Insert at least 4 department records and 6 staff records.
-- 4. Display staff members whose salaries fall between ₹25,000 and ₹50,000.
-- 5. Display staff members whose names start with a specified letter using LIKE.
-- 6. Display staff members belonging to selected departments using IN.
-- 7. Display unique staff designations using DISTINCT.
-- 8. Count the number of staff members in each department using GROUP BY and COUNT().
-- 9. Display the maximum and minimum salary using MAX() and MIN().
-- 10. Update the salary of a staff member.
-- 11. Display the final staff records using SELECT with appropriate column aliases.

CREATE DATABASE Hospital_Management;
USE Hospital_Management;

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50) DEFAULT 'Main Building'
    );
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(100),
    salary DECIMAL(10,2) CHECK (salary > 0),
    department_id INT,

    FOREIGN KEY (department_id)
    REFERENCES Department(department_id)
);

INSERT INTO Department
VALUES (1, 'Cardio', 'Block A'),
       (2, 'Neurology', 'Block B'),
       (3, 'OPD', 'Block C'),
       (4, 'Emergency block', 'Block D');

INSERT INTO Staff
VALUES (111,'Amit',25000.00,1),
       (112,'Rohan',70000.00,1),
       (113,'Nirdesh',400000.00,2),
       (114,'Batman',60000.00,3),
       (115,'Shaktimaaannnnn Shaktimaaaaaaaannn',50000.00,4),
       (116,'Byomkesh Bakshi',30000.00,4);
       
SELECT * FROM Staff
WHERE salary BETWEEN 25000 AND 50000;


SELECT * FROM Staff
WHERE staff_name LIKE 'A%';

SELECT * FROM Staff
WHERE department_id = 1;

SELECT * FROM Staff
WHERE department_id = 2;

SELECT DISTINCT salary
FROM staff;

SELECT MAX(salary) AS MAXIMUM_SALARY
FROM staff;

SELECT MIN(salary) AS MINIMUM_SALARY
FROM staff;

SET SQL_SAFE_UPDATES = 0;

UPDATE staff
SET salary = 1000000
WHERE staff_name = 'Nirdesh';


SELECT 
staff_id AS 'IDENTITY',
staff_name AS 'NAAAAAM',
salary AS 'PAISAAAAA',
department_id AS 'DEP_IDENTITY'
FROM staff;

SELECT *FROM staff;