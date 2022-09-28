# make the values under gender column return as Male/Female instead of M/flush

SELECT 
	emp_no, 
	first_name, 
    last_name,
		CASE 
			WHEN gender = 'M' THEN 'Male' 
            ELSE 'Female' END AS gender 
FROM employees;
 SELECT * FROM dept_manager;
# Similar to the exercises done in the lecture, obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990. 
#Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee. 

SELECT 
	e.emp_no,
    e.first_name,
    e.last_name,
		CASE dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee' 
        END AS emp_type
FROM employees e
	LEFT JOIN dept_manager dm ON dm.emp_no = e.emp_no
WHERE e.emp_no > 109990; 

SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	CASE
		WHEN dm.emp_no IS NOT NULL THEN 'Manager'
		ELSE 'Employee'
		END AS is_manager
FROM
	employees e
	LEFT JOIN dept_manager dm ON dm.emp_no = e.emp_no
WHERE
	e.emp_no > 109990;
    
#Extract a dataset containing the following information about the managers: employee number, first name, and last name.
# Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, and another one saying whether this salary raise was higher than $30,000 or NOT.


SELECT 
	dm.emp_no,
	e.first_name,
    e.last_name,
	MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised more than 30,000'
    ELSE 'salary was NOT raised more than 30,000'
    END AS salary_raise
FROM dept_manager dm
	JOIN employees e ON e.emp_no = dm.emp_no
    JOIN salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;

# Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, called “current_employee” saying 
# “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t.

SELECT 
	e.emp_no,
    e.first_name, 
    e.Last_name,
		CASE WHEN MAX(dm.to_date) > SYSDATE() THEN 'Is still employeed' 
		ELSE 'Not an employee anymore'
        END AS current_employee
	FROM employees e
		JOIN dept_emp dm On e.emp_no = dm.emp_no
	LIMIT 100;