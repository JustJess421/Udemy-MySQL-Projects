USE employees;

UPDATE employees
SET 
	first_name = 'Stella',
    last_name = 'Parkenson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE 
	emp_no = 999901;
    
SELECT 
    *
FROM
    department_dup
ORDER BY dept_no;

COMMIT;

UPDATE department_dup
SET 
	dept_no = 'd011',
    dept_name = 'Quality Control';
    
ROLLBACK;

COMMIT;

#Change the “Business Analysis” department name to “Data Analysis”.

SELECT * FROM departments;

UPDATE departments
SET
	dept_name = 'Data Analysis'
WHERE dept_no = 'd010';