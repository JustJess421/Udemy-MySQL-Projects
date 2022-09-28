# Creating indexes

CREATE INDEX i_hire_date ON employees(hire_date);

SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';

# Composite indexes (more than one column)

CREATE INDEX i_composite ON employees(first_name, last_name);

SELECT * FROM employees where first_name = 'Georgi' AND last_name = 'Facello';

ALTER TABLE employees
DROP INDEX i_hire_date;

SELECT * FROM salaries WHERE salary > 89000;

CREATE INDEX 1_salary on salaries(salary);