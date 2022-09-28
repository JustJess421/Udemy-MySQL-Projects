#Preparing duplicate tables to use joins

ALTER TABLE department_dup
	DROP COLUMN dept_manager;
    
ALTER TABLE department_dup
	CHANGE COLUMN dept_no dept_no CHAR(4) NULL;
    
ALTER TABLE department_dup
	CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;
    
SELECT * FROM department_dup;

DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup 
(emp_no int(11) NOT NULL,
dept_no char(4) NULL,
from_date date NOT NULL,
to_date date NULL);

INSERT INTO dept_manager_dup (emp_no, from_date)
	VALUES  (999904, '2017-01-01'),
			(999905, '2017-01-01'),
			(999906, '2017-01-01'),
			(999907, '2017-01-01');
            
INSERT INTO dept_manager_dup
	select * from dept_manager;
            
DELETE FROM dept_manager_dup
	WHERE dept_no = 'd001';
    
INSERT INTO department_dup (dept_name)
VALUES ('Public Relations');

DELETE FROM department_dup
	WHERE dept_no = 'd002'; 

# INNER JOINS
    
SELECT *
	FROM dept_manager_dup
    ORDER BY dept_no;

SELECT * 
	FROM department_dup
    ORDER BY dept_no;
    
SELECT m.dept_no, m.emp_no, d.dept_name
	FROM dept_manager_dup m
    INNER JOIN department_dup d ON m.dept_no = d.dept_no
    ORDER BY m.dept_no;
    
#Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, d.dept_no
	FROM employees e 
    INNER JOIN dept_manager_dup d ON e.emp_no = d.emp_no
    ORDER BY e.emp_no;
    
# LEFT JOINS

SELECT m.dept_no, m.emp_no, d.dept_name
	FROM dept_manager_dup m
    LEFT JOIN department_dup d ON m.dept_no = d.dept_no
    ORDER BY m.dept_no;
    
#switching the tables 

SELECT d.dept_no, m.emp_no, d.dept_name
	FROM department_dup d
    LEFT JOIN dept_manager_dup m ON m.dept_no = d.dept_no
    ORDER BY d.dept_no;
    
#Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch.
# See if the output contains a manager with that name.  

SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
	FROM employees e
    LEFT JOIN dept_manager d ON e.emp_no = d.emp_no
    WHERE e.last_name = 'Markovitch'
    ORDER BY d.dept_no DESC, e.emp_no;
    
# RIGHT JOINS

SELECT m.dept_no, m.emp_no, d.dept_name
	FROM dept_manager_dup m
    RIGHT JOIN department_dup d ON m.dept_no = d.dept_no
    ORDER BY m.dept_no;

SELECT d.dept_no, m.emp_no, d.dept_name
	FROM dept_manager_dup m
    RIGHT JOIN department_dup d ON m.dept_no = d.dept_no
    ORDER BY m.dept_no;
    
# Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date.
# Use the old type of join syntax to obtain the result.

SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM employees e, dept_manager d
WHERE e.emp_no = d.emp_no;

# JOIN and WHERE in same query

# Joining tables to find out the first name and last name of employees who make more than $145,000

SELECT e.emp_no, e.first_name, e.Last_name, s.salary
FROM employees e
	JOIN salaries s ON e.emp_no = s.emp_no
    WHERE s.salary > 145000;
    
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
    
# Select the first and last name, the hire date, and the job title of all employees whose 
# first name is “Margareta” and have the last name “Markovitch”.

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM employees e
	JOIN titles t ON e.emp_no = t.emp_no
    WHERE e.first_name = 'Margareta' AND e.last_name = 'Markovitch'
    ORDER BY e.emp_no;
    
# CROSS JOIN

SELECT dm.*, d.*
FROM dept_manager dm
	CROSS JOIN departments d
     ORDER BY dm.emp_no, d.dept_no;
    
# Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.

SELECT dm.*, d.*
FROM dept_manager dm
	CROSS JOIN departments d
    WHERE dm.dept_no = 'D009'
    ORDER BY d.dept_no;
    
# Return a list with the first 10 employees with all the departments they can be assigned to.
 
SELECT e.*, d.*
FROM employees e
	CROSS JOIN departments d
	WHERE e.emp_no < 10011
	ORDER BY e.emp_no, d.dept_name;
   
   # Using Agg. functions in JOINS
   
   # Find the average salaies of men and women in the company.
   
   SELECT e.gender, AVG(s.salary) AS Average_Salary
	FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    GROUP BY e.gender;
    
# Joining more than one table

SELECT e.first_name, e.Last_name, e.hire_date, m.from_date, d.dept_name
FROM employees e
JOIN dept_manager m ON e.emp_no = m.emp_no
JOIN departments d ON m.dept_no = d.dept_no;

# Select all managers’ first and last name, hire date, job title, start date, and department name.

SELECT e.first_name, e.last_name, e.hire_date,  t.title, dm.from_date, d.dept_name
FROM employees e
	JOIN dept_manager dm ON e.emp_no= dm.emp_no
    JOIN departments d ON dm.dept_no = d.dept_no
    JOIN titles t ON e.emp_no = t.emp_no
    WHERE t.title = 'Manager'
    ORDER BY e.emp_no;
    
# How many male and how many female managers do we have in the ‘employees’ database?

SELECT e.gender, COUNT(d.emp_no)
FROM employees e
JOIN dept_manager d ON e.emp_no = d.emp_no
GROUP BY e.gender; 

# UNIONS

#Preparing table for UNIONS

CREATE TABLE employees_dup
	(emp_no int(11),
    birth_date date,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender enum('M', 'F'),
    hire_date date);
    
    INSERT INTO employees_dup
    SELECT e.*
    FROM employees e
    LIMIT 20;
    
    SELECT * FROM employees_dup;
    
    INSERT INTO employees_dup
		VALUES ('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');
        
SELECT e.emp_no, e.first_name, e.last_name, NULL AS dept_no, NULL AS from_date
FROM employees_dup e
WHERE e.emp_no = 10001
UNION ALL SELECT NULL AS emp_no, NULL AS first_name, NULL AS last_name, m.dept_no, m.from_date
from dept_manager m;

SELECT e.emp_no, e.first_name, e.last_name, NULL AS dept_no, NULL AS from_date
FROM employees_dup e
WHERE e.emp_no = 10001
UNION SELECT NULL AS emp_no, NULL AS first_name, NULL AS last_name, m.dept_no, m.from_date
from dept_manager m;

SELECT
	*
FROM
	(SELECT
		e.emp_no,
			e.first_name,
			e.last_name,
			NULL AS dept_no,
			NULL AS from_date
	FROM employees e
	WHERE last_name = 'Denis' 
    UNION SELECT
			NULL AS emp_no,
			NULL AS first_name,
			NULL AS last_name,
			dm.dept_no, 
			dm.from_date
	FROM dept_manager dm) as a
	ORDER BY -a.emp_no DESC;