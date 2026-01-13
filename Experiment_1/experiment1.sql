-- 1
CREATE TABLE Department (
deptm_id INT PRIMARY KEY,
deptm_name VARCHAR(30) UNIQUE NOT NULL
);
CREATE TABLE Employee (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(30) NOT NULL,
salary INT CHECK (salary > 0),
deptm_id INT,
CONSTRAINT fk_dpt FOREIGN KEY (deptm_id) REFERENCES Department(deptm_id)
);
CREATE TABLE Project (
project_id INT PRIMARY KEY,
project_name VARCHAR(30) NOT NULL,
deptm_id INT,
CONSTRAINT fk_project_dpt FOREIGN KEY (deptm_id) REFERENCES
Department(deptm_id)
);
-- 2
INSERT INTO Department VALUES
(1, 'HR'),
(2, 'FINANCE'),
(3, 'IT'),
(4, 'SALES');
INSERT INTO Employee VALUES
(101, 'SANCHIT KATOCH', 50000, 2),
(102, 'ROSHAN K SINGH', 45000, 1),
(103, 'Anindita', 42000, 3),
(104, 'Ankush', 43000, 4);
INSERT INTO Project VALUES
(201, 'Payroll System', 2),
(202, 'Web Application', 2),
(203, 'Cyber Security',1);

UPDATE Employee
SET salary = 56750
WHERE emp_id = 102;
DELETE FROM Project
WHERE project_id = 202;
--3
SELECT CURRENT_USER;
CREATE ROLE report_staff
WITH LOGIN PASSWORD 'staff111';
SELECT CURRENT_USER;
GRANT SELECT ON Department TO report_staff;
GRANT SELECT ON Employee TO report_staff;
GRANT SELECT ON Project TO report_staff;
REVOKE CREATE ON SCHEMA public FROM report_staff;
REVOKE INSERT, UPDATE, DELETE ON Department FROM report_staff;
REVOKE INSERT, UPDATE, DELETE ON Employee FROM report_staff;
REVOKE INSERT, UPDATE, DELETE ON Project FROM report_staff;
--4
ALTER TABLE Project
ALTER COLUMN project_name TYPE VARCHAR(100);
DROP TABLE Project;


SELECT*FROM department;
SELECT*FROM project;
SELECT*FROM employee;
