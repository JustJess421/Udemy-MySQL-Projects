SELECT 
    *
FROM
    dept_emp;
    
SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS num
FROM
    dept_emp
GROUP BY emp_no
HAVING num > 1;

# Visualize only the period emcompassing the last contact of each employee

CREATE OR REPLACE VIEW v_dept_emp_lastest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
    
# Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.

CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT 
        ROUND(AVG(salary), 2)
    FROM
        salaries s
            JOIN
        dept_manager e ON s.emp_no = e.emp_no;
        
	SELECT * FROM v_manager_avg_salary;