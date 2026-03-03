# 📘 PostgreSQL Views Implementation  
## Technical Training – 1 | Experiment No. 6

![Database](https://img.shields.io/badge/Database-PostgreSQL-blue)
![Concept](https://img.shields.io/badge/Concept-Views-green)
![Semester](https://img.shields.io/badge/Semester-2nd-orange)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

## 👨‍💻 Student Information

| Field | Details |
|--------|----------|
| **Name** | Sanchit Katoch |
| **UID** | 25MCA20059 |
| **Branch** | MCA (GEN) |
| **Section** | 25MCA-1_A |
| **Subject** | Technical Training–1 |
| **Subject Code** | 25CAP-652 |
| **Date of Performance** | 24/02/2026 |

---

# 📌 Aim

To create, query, and manage views in PostgreSQL to simplify database queries and provide a layer of abstraction and security for end-users.

---

# 🎯 Objectives

- Understand data abstraction using views  
- Learn how views enhance database security  
- Simplify complex queries using views  
- Understand creation, modification, and deletion of views  
- Apply views in real-world scenarios like payroll and reporting  

---

# 🛠 Tools Used

- PostgreSQL  
- pgAdmin / psql  

---

# 📖 Theory

A **View** in PostgreSQL is a virtual table based on the result of a SQL query. It does not store data physically but retrieves it dynamically from base tables.

### Why Use Views?

- ✅ Data Abstraction  
- ✅ Query Simplification  
- ✅ Security (hide sensitive columns)  
- ✅ Reusability  
- ✅ Reporting & Aggregation  

Views allow end-users to interact with simplified datasets without exposing full database structure.

---

# 🗄 Database Setup

## Step 1: Create Tables

```sql
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary NUMERIC,
    status VARCHAR(10),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);
```

---

## Step 2: Insert Sample Data

```sql
INSERT INTO department VALUES
(1, 'IT'),
(2, 'Sales'),
(3, 'HR');

INSERT INTO employee VALUES
(1, 'Sanchit', 30000, 'Active', 2),
(2, 'Swayam', 40000, 'Active', 2),
(3, 'Anindita', 25000, 'Inactive', 1),
(4, 'Ankush', 35000, 'Active', 3),
(5, 'Roshan', 28000, 'Active', 1);
```

---

# 🧪 Implementation

---

## 🔹 Step 1 – Simple View for Data Filtering

Create a view to show only **active employees** and hide unnecessary columns.

```sql
CREATE VIEW active_employees AS
SELECT emp_id, emp_name, dept_id
FROM employee
WHERE status = 'Active';

SELECT * FROM active_employees;
```

### ✔ Purpose:
- Filters inactive employees  
- Hides salary and status columns  
- Provides simplified dataset  

---

## 🔹 Step 2 – View for Joining Multiple Tables

Combine employee and department data to simplify multi-table queries.

```sql
CREATE VIEW employee_department_view AS
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id;

SELECT * FROM employee_department_view;
```

### ✔ Purpose:
- Eliminates need for repeated JOIN queries  
- Simplifies reporting  
- Enhances readability  

---

## 🔹 Step 3 – Advanced Summarization View

Generate department-level statistics automatically.

```sql
CREATE VIEW department_summary AS
SELECT d.dept_name,
       COUNT(e.emp_id) AS total_employees,
       AVG(e.salary) AS average_salary
FROM department d
JOIN employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

SELECT * FROM department_summary;
```

### ✔ Purpose:
- Provides aggregated statistics  
- Useful for management reporting  
- Demonstrates GROUP BY with views  

---

# 📊 Output Summary

- Tables created successfully  
- Data inserted successfully  
- Active employees filtered correctly  
- Employee-department join view displayed combined data  
- Department summary view generated employee count and average salary  

---

# 📚 Learning Outcomes

- Understood the concept of views in PostgreSQL  
- Learned how views provide abstraction and security  
- Created simple filtering views  
- Created join-based views  
- Created aggregation-based reporting views  
- Gained practical knowledge of real-world database design  

---

# 🔐 Real-World Applications

- Payroll systems  
- HR reporting dashboards  
- Sales department reporting  
- Secure role-based data access  
- Business intelligence summaries  

---

# ✅ Conclusion

This experiment successfully demonstrated how PostgreSQL Views can be used to abstract data, simplify complex queries, enhance security, and generate summarized reports. The practical implementation strengthened understanding of structured database design and real-world reporting mechanisms.

---

⭐ If this project helped you understand PostgreSQL Views, consider giving it a star on GitHub.
