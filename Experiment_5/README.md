# 📘 PostgreSQL Cursor Implementation  
## Technical Training – 1 | Experiment No. 5

![Database](https://img.shields.io/badge/Database-PostgreSQL-blue)
![Language](https://img.shields.io/badge/Language-PL%2FpgSQL-green)
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

To create and use cursors in PostgreSQL for row-by-row data processing, enabling sequential access and controlled manipulation of query results.

---

# 🎯 Objectives

- Understand the concept and need of cursors in PostgreSQL  
- Learn sequential row-by-row data access  
- Perform row-level manipulation using cursor logic  
- Understand cursor lifecycle management  
- Handle cursor termination and exceptions  

---

# 🛠 Tools Used

- PostgreSQL  
- PL/pgSQL  
- pgAdmin / psql  

---

# 📖 Theory

A **cursor** in PostgreSQL is a database object used to retrieve rows from a result set one at a time. Unlike standard SQL queries that process all rows simultaneously, cursors allow controlled, row-by-row execution, which is useful when:

- Applying complex conditional logic  
- Performing dynamic updates  
- Managing procedural workflows  
- Handling exceptions gracefully  

---

# 🔄 Cursor Lifecycle

```
DECLARE → OPEN → FETCH → PROCESS → EXIT WHEN NOT FOUND → CLOSE
```

1. **DECLARE** – Define the cursor query  
2. **OPEN** – Execute the query  
3. **FETCH** – Retrieve one row at a time  
4. **PROCESS** – Apply logic  
5. **CLOSE** – Release resources  

---

# 🗄 Database Setup

## Step 1: Create Table

```sql
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary NUMERIC,
    experience INT,
    performance VARCHAR(1)
);
```

## Step 2: Insert Sample Data

```sql
INSERT INTO employee VALUES
(1, 'Swayam', 25000, 5, 'B'),
(2, 'Anindita', 40000, 3, 'A'),
(3, 'Sanchit', 25000, 2, 'C'),
(4, 'Roshan', 30000, 4, 'A'),
(5, 'Riya', 30000, 3, 'B');
```

---

# 🧪 Implementation

---

## 🔹 Step 1 – Simple Forward-Only Cursor

```sql
DO $$
DECLARE
    emp_cursor CURSOR FOR
        SELECT emp_id, emp_name, salary FROM employee;
    rec RECORD;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO rec;
        EXIT WHEN NOT FOUND;
        RAISE NOTICE 'ID: %, Name: %, Salary: %',
        rec.emp_id, rec.emp_name, rec.salary;
    END LOOP;

    CLOSE emp_cursor;
END $$;
```

### ✔ Purpose:
Displays employee records one-by-one using a forward-only cursor.

---

## 🔹 Step 2 – Complex Row-by-Row Salary Manipulation

Salary update logic:

- 20% increase → Experience ≥ 5 AND Performance = 'A'  
- 10% increase → Experience ≥ 3 AND Performance = 'B'  
- 5% increase → Otherwise  

```sql
DO $$
DECLARE
    emp_cursor CURSOR FOR
        SELECT emp_id, salary, experience, performance FROM employee;
    rec RECORD;
    new_salary NUMERIC;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO rec;
        EXIT WHEN NOT FOUND;

        IF rec.experience >= 5 AND rec.performance = 'A' THEN
            new_salary := rec.salary * 1.20;
        ELSIF rec.experience >= 3 AND rec.performance = 'B' THEN
            new_salary := rec.salary * 1.10;
        ELSE
            new_salary := rec.salary * 1.05;
        END IF;

        UPDATE employee
        SET salary = new_salary
        WHERE emp_id = rec.emp_id;
    END LOOP;

    CLOSE emp_cursor;
END $$;
```

### ✔ Purpose:
Demonstrates row-level conditional updates using cursor-based logic.

---

## 🔹 Step 3 – Exception & Status Handling

```sql
DO $$
DECLARE
    emp_cursor CURSOR FOR SELECT * FROM employee;
    rec RECORD;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO rec;
        EXIT WHEN NOT FOUND;
        RAISE NOTICE 'Processing Employee: %', rec.emp_name;
    END LOOP;

    CLOSE emp_cursor;

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error occurred: %', SQLERRM;
END $$;
```

### ✔ Purpose:
Ensures graceful error handling and safe cursor termination.

---

# 📊 Output Summary

- Table created successfully  
- Data inserted successfully  
- Employee records printed sequentially  
- Salaries updated dynamically  
- Exceptions handled properly  

---

# 📚 Learning Outcomes

- Understood cursor-based row-by-row processing  
- Learned PostgreSQL cursor lifecycle management  
- Applied conditional logic in PL/pgSQL  
- Performed dynamic salary updates  
- Implemented exception handling  
- Improved procedural SQL programming skills  

---

# ✅ Conclusion

This experiment successfully demonstrated the implementation of PostgreSQL cursors for sequential data access, conditional manipulation, and structured exception handling using PL/pgSQL.

The practical execution enhanced understanding of procedural database programming and cursor lifecycle control.

---

⭐ If this project helped you understand PostgreSQL cursors, consider giving it a star on GitHub.
