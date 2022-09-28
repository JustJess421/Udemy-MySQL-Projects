SELECT 
    *
FROM
    employees
    ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO employees 
(
emp_no, birth_date, first_name, last_name, gender, hire_date
) VALUES
 (
 999901,
 '1986-04-21',
 'John',
 'Smith',
 'M',
 '2011-01-01');
 
 INSERT INTO employees 
(
emp_no, birth_date, first_name, last_name, gender, hire_date
) VALUES
 (
 999903,
 '1979-09-14',
 'Johathon',
 'Creek',
 'M',
 '1999-01-01');
 
#Select ten records from the “titles” table to get a better idea about its content.
#Then, in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.
#At the end, sort the records from the “titles” table in descending order to check if you have successfully inserted the new record.

SELECT 
    *
FROM
    titles
    LIMIT 10;
    
INSERT INTO titles (emp_no, title, from_date)
VALUES (99903, 'Senior Engineer', '1997-10-01')

#Insert information about the individual with employee number 999903 into the “dept_emp” table. 
#He/She is working for department number 5, and has started work on  October 1st, 1997; her/his contract is for an indefinite period of time.

SELECT * FROM dept_emp LIMIT 10;

INSERT INTO dept_emp 
VALUES (999903, 'd005', '1997-10-01', '999-01-01');

#Creating a table by pulling data from another table in database

CREATE TABLE department_dup 
(dept_no CHAR(4) NOT NULL, dept_name VARCHAR(40) NOT NULL);

INSERT INTO department_dup 
(dept_no, Dept_name)
SELECT * 
	FROM departments;
    
SELECT * FROM department_dup;

#Create a new department called “Business Analysis”. Register it under number ‘d010’.

INSERT INTO departments (dept_no, dept_name)
VALUES ('d010', 'Busniess Analysis');

SELECT * FROM departments;