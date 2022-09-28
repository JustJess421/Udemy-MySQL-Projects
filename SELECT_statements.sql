SELECT 
    dept_no
FROM
    departments;
    
SELECT 
    *
FROM
    departments;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' AND first_name = 'Kellie';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'kellie'
        OR first_name = 'aruna';
        
SELECT 
    *
FROM
    employees
WHERE
    gender = 'f'
        AND (first_name = 'kellie'
        OR first_name = 'aruna');
        
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('denis' , 'elvis');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('john' , 'mark', 'jacob');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mark%');
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('2000%');
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%jack%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%jack%');
    
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;
    
SELECT 
    *
FROM
    salaries
WHERE
    emp_no NOT BETWEEN 1004 AND 10012;
    
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006'; 

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01'
        AND gender = 'f';
        
SELECT DISTINCT
    hire_date
FROM
    employees;
    
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000;
    
SELECT 
    COUNT(*)
FROM
    dept_manager;
    
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

SELECT 
    *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

SELECT 
    *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

SELECT 
    *
FROM
    dept_emp;
    
SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
ORDER BY emp_no;

SELECT 
    *
FROM
    dept_emp
LIMIT 100;
