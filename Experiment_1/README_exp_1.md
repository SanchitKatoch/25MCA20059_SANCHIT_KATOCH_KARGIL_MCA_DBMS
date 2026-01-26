Design and Implementation of Sample Database System using DDL, DML and DCL

-> Student Details
Name: SANCHIT KATOCH
UID: 25MCA20059
Branch: MCA GENERAL
Semester: 2nd
Section/Group: 1/A
Subject: DBMS Lab
Date of Performance: 13/01/2026


1. Aim of the Session :-
To design and implement a sample database system using DDL, DML, and DCL commands for managing departments, employees, and projects, 
and to apply role-based access control for secure data handling.

2. Objective of the Session
To understand the use of DDL commands to create and modify database structures.
To perform DML operations such as INSERT, UPDATE, DELETE, and SELECT.
To implement relationships using primary and foreign keys.
To apply DCL commands to manage roles and privileges.
To analyze input and output of SQL queries in a real database environment.


3. Practical / Experiment Steps
Design the database schema for Department, Employee, and Project tables.
Create tables using appropriate constraints.
Insert sample records into tables.
Perform update and delete operations.
Retrieve data using SELECT queries.
Create a role and grant and revoke privileges.
Alter and drop database objects.


4. Database Design
The database is designed to manage Departments, Employees, and Projects within an organization.
Tables
Department
Employee
Project
Constraints Used
PRIMARY KEY – to uniquely identify each record
FOREIGN KEY – to maintain relationships between tables
NOT NULL – to avoid missing important values
UNIQUE – to prevent duplicate entries



STEP 1 : TABLE CREATION - DDL COMMANDS.

1. DEPARTMENT TABLE
CREATE TABLE Department (
deptm_id INT PRIMARY KEY,
deptm_name VARCHAR(30) UNIQUE NOT NULL
);

2. EMPLOYEE TABLE
CREATE TABLE Employee (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(30) NOT NULL,
salary INT CHECK (salary > 0),
deptm_id INT,
CONSTRAINT fk_dpt FOREIGN KEY (deptm_id) REFERENCES Department(deptm_id)
);

3. PROJECT TABLE
CREATE TABLE Project (
project_id INT PRIMARY KEY,
project_name VARCHAR(30) NOT NULL,
deptm_id INT,
CONSTRAINT fk_project_dpt FOREIGN KEY (deptm_id) REFERENCES
Department(deptm_id)
);


STEP 2 : DATA MANIPULATION - DML COMMANDS

1. INSERT INTO DEPARTMENT
INSERT INTO Department VALUES
(1, 'HR'),
(2, 'FINANCE'),
(3, 'IT'),
(4, 'SALES');
![img alt](https://github.com/SanchitKatoch/25MCA20059_SANCHIT_KATOCH_KARGIL_MCA_DBMS/blob/2caf98d59273f89c81051de4ef1cf591eacd6c2b/Experiment_1/Screenshot%20(254).png) 

2. INSERT INTO Employee VALUES
(101, 'SANCHIT KATOCH', 50000, 2),
(102, 'ROSHAN K SINGH', 45000, 1),
(103, 'Anindita', 42000, 3),
(104, 'Ankush', 43000, 4);
![img alt](https://github.com/SanchitKatoch/25MCA20059_SANCHIT_KATOCH_KARGIL_MCA_DBMS/blob/7fdde850dabdcb40818d825308b604507000e1af/Experiment_1/Screenshot%20(257).png)

3. INSERT INTO PROJECT
INSERT INTO Project VALUES
(201, 'Payroll System', 2),
(202, 'Web Application', 2),
(203, 'Cyber Security',1);
![img alt](https://github.com/SanchitKatoch/25MCA20059_SANCHIT_KATOCH_KARGIL_MCA_DBMS/blob/1472c87f5238eeebc1e2bdfbb30bd7801c63d3ee/Experiment_1/Screenshot%20(255).png)

