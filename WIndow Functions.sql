USE employees;

#Row number ranking functions

SELECT
	emp_no,
    salary,
    ROW_NUMBER() OVER() AS row_num
FROM 
	salaries;
 
 # Using Partition By to rank all employee numbers with their salaries
 
SELECT
	emp_no,
    salary,
    ROW_NUMBER() OVER(PARTITION BY emp_no) AS row_num
FROM 
	salaries;

#Using Order By to get the salaries in desc order

SELECT
	emp_no,
    salary,
    ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM 
	salaries;
    
# Write a query that upon execution, assigns a row number to all managers we have information for in the "employees" database (regardless of their department).
# Let the numbering disregard the department the managers have worked in. Also, let it start from the value of 1. Assign that value to the manager with the lowest employee number.

SELECT
	emp_no,
    dept_no,
    ROW_NUMBER() OVER(ORDER BY emp_no) AS row_num
FROM 
	dept_manager;
    
# Write a query that upon execution, assigns a sequential number for each employee number registered in the "employees" table. 
# Partition the data by the employee's first name and order it by their last name in ascending order (for each partition).

SELECT 
	*,
    ROW_NUMBER() OVER(PARTITION BY first_name ORDER BY last_name ASC) AS row_num
FROM
	employees;
    
# Using multiple window functions in one query

SELECT
	emp_no,
    salary,
    ROW_NUMBER() OVER() As row_num1,
    ROW_NUMBER() OVER(PARTITION BY emp_no) AS row_num2,
    ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_num3,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num4
FROM 
	salaries;
    
# Obtain a result set containing the salary values each manager has signed a contract for. To obtain the data, refer to the "employees" database.
#Use window functions to add the following two columns to the final output:
#- a column containing the row number of each row from the obtained dataset, starting from 1.
#- a column containing the sequential row numbers associated to the rows for each manager, where their highest salary has been given a number equal to the number of rows in the given partition, and their lowest - the number 1.
#Finally, while presenting the output, make sure that the data has been ordered by the values in the first of the row number columns, and then by the salary values for each partition in ascending order.

SELECT
	dm.emp_no,
    salary,
    ROW_NUMBER() OVER() AS row_num1,
    ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_num2
FROM dept_manager dm
	JOIN salaries s ON dm.emp_no = s.emp_no
    ORDER BY row_num1, emp_no, salary ASC;
    
