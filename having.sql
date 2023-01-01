/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/
-- select first_name, last_name, COUNT(title) as titles from employees
-- left join titles as titles on employees.emp_no = titles.emp_no
-- where hire_date > '1/1/1991'
-- group by first_name, last_name
-- HAVING COUNT(title) > 2;

SELECT e.emp_no, count(t.title) as "amount of titles"
FROM employees as e
JOIN titles as t USING(emp_no)
WHERE EXTRACT (YEAR FROM e.hire_date) > 1991
GROUP BY e.emp_no
HAVING count(t.title) > 2
ORDER BY e.emp_no;


/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/
-- select first_name, last_name, COUNT(salary) as "salary change" from employees
-- left Join salaries as salaries USING(emp_no)
-- group by first_name, last_name
-- having COUNT(salary) > 15;

SELECT e.emp_no, count(s.from_date) as "amount of raises"
FROM employees as e
JOIN salaries as s USING(emp_no)
JOIN dept_emp AS de USING(emp_no)
WHERE de.dept_no = 'd005'
GROUP BY e.emp_no
HAVING count(s.from_date) > 15
ORDER BY e.emp_no;


/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/
-- select first_name, last_name, COUNT(dept_name) from employees
-- LEFT JOIN dept_emp as dept_emp using(emp_no)
-- left JOIN departments as departments using(dept_no)
-- group by first_name, last_name
-- HAVING count(dept_name) > 1;

SELECT e.emp_no, count(de.dept_no) as "worked for # departments"
FROM employees as e
JOIN dept_emp AS de USING(emp_no)
GROUP BY e.emp_no
HAVING count(de.dept_no) > 1
ORDER BY e.emp_no;
