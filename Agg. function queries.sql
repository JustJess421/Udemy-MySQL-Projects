#COUNT()

SELECT *
FROM salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
	COUNT(salary)
FROM salaries;

#How many employee starts dates are in the database?

SELECT 
	COUNT(from_date)
FROM salaries;

#967,330 shows all the records in the database, need DISTINCT to get how many different starts dates there are

SELECT 
	COUNT(DISTINCT from_date)
FROM salaries;

#6,392 different start dates

#How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.

SELECT * FROM dept_emp;

SELECT
	COUNT(DISTINCT dept_no)
FROM dept_emp;

#There are 9 distinct departments in the "employees" database.

#SUM()

SELECT
	SUM(salary)
FROM salaries;

#What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?

SELECT 
	SUM(salary)
FROM salaries
WHERE from_date > '1997-01-01';

#$31,909,143,195

#which is the highest salary we offer?

SELECT 
	MAX(salary)
FROM salaries;

#$158,200

#Which is the lowest?

SELECT 
	MIN(salary)
FROM salaries;

#$38,735

#1. Which is the lowest employee number in the database?
 
 SELECT 
    MIN(emp_no)
FROM employees;

#10001

#2. Which is the highest employee number in the database?
 
SELECT 
    MAX(emp_no)
FROM employees;
#999903

#What is the average salary of our employees?

SELECT 
	AVG(salary)
FROM salaries;

#$63,761.20

#What is the average annual salary paid to employees who started after the 1st of January 1997?

SELECT 
	AVG(salary)
FROM salaries
WHERE from_date > '1997-01-01';

#$67,717.75

#to round your numbers

SELECT 
	ROUND(AVG(salary))
FROM salaries
WHERE from_date > '1997-01-01';
#$67,718

#Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.

SELECT 
	ROUND(AVG(salary),2)
FROM salaries
WHERE from_date > '1997-01-01';
#$67,717.75

# COALESCE()

SELECT *
FROM department_dup;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL; 

INSERT INTO department_dup(dept_no) VALUES ('d010'), ('d011');

SELECT
*
FROM 
department_dup
ORDER BY dept_no ASC; 

ALTER TABLE employees.department_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

COMMIT;

#what to do to change the "null" symbol to say something like "info not provided"

SELECT 
	dept_no ,
    IFNULL(dept_name, 'Department not provided') as dept_name
FROM department_dup;

SELECT *
FROM department_dup
ORDER By dept_no;

SELECT 
	dept_no, 
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM department_dup
ORDER BY dept_no ASC;

SELECT 
	dept_no, 
    dept_name,
    COALESCE('department manager name') AS fake_col
FROM department_dup
ORDER BY dept_no ASC;

#Select the department number and name from the ‘departments_dup’ table and add a third column where you name the department number (‘dept_no’) as ‘dept_info’. 
#If ‘dept_no’ does not have a value, use ‘dept_name’.

SELECT
	dept_no,
    dept_name, 
    COALESCE(dept_no, dept_name) AS dept_info
FROM
	department_dup
ORDER BY dept_no ASC;

#Modify the code obtained from the previous exercise in the following way. 
#Apply the IFNULL() function to the values from the first and second column, so that ‘N/A’ is displayed whenever a department number has no value, 
#and ‘Department name not provided’ is shown if there is no value for ‘dept_name

SELECT
	IFNULL(dept_no, 'N/A') as dept_no,
	IFNULL(dept_name,'Department name not provided') AS dept_name,
	COALESCE(dept_no, dept_name) AS dept_info
FROM
	department_dup
ORDER BY dept_no ASC;



