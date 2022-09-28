USE employees;

COMMIT;

SELECT *
FROM employees
WHERE emp_no = '999903';

SELECT *
FROM titles
WHERE emp_no = '999903';

DELETE FROM employees
WHERE emp_no = '999903';

ROLLBACK;

#Remove the department number 10 record from the “departments” table.

SELECT * FROM departments;

COMMIT;

DELETE FROM departments
WHERE dept_no = 'd010';