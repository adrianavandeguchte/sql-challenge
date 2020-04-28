-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_id AS "employee number",
       employees.last_name AS "last name",
       employees.first_name AS "first name",
       employees.sex,
       salaries.salary
FROM employees,salaries
WHERE employees.emp_id=salaries.emp_id;


-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name AS "first name",
       last_name AS "last name",
       hire_date AS "hire date"
FROM employees
WHERE hire_date LIKE '%86';


-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_id AS "department number",
       d.dept_name AS "department name",
       dm.emp_id AS "employee number",
       e.last_name AS "last name",
       e.first_name AS "first name"
FROM department AS d, dept_managers AS dm, employees as e
WHERE e.emp_id=dm.emp_id AND d.dept_id=dm.dept_id;


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_id AS "employee number",
       e.last_name AS "last name",
       e.first_name AS "first name",
       d.dept_name AS "department name"
FROM department AS d, dept_emp AS de, employees as e
WHERE e.emp_id=de.emp_id AND d.dept_id=de.dept_id;


-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name AS "first name",
       last_name AS "last name",
       sex
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_id AS "employee number",
       e.last_name AS "last name",
       e.first_name AS "first name",
       d.dept_name AS "department name"
FROM employees as e, department as d, dept_emp as de
WHERE e.emp_id=de.emp_id AND de.dept_id=d.dept_id AND d.dept_name LIKE 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_id AS "employee number",
       e.last_name AS "last name",
       e.first_name AS "first name",
       d.dept_name AS "department name"
FROM employees AS e, department AS d, dept_emp AS de
WHERE e.emp_id=de.emp_id AND de.dept_id=d.dept_id AND (d.dept_name LIKE 'Sales' OR d.dept_name Like 'Development');


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name AS "last name", COUNT(last_name) AS "name count"
FROM employees
GROUP BY last_name
ORDER BY "name count" DESC;
