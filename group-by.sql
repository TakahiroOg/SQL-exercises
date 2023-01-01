/*
*  How many people were hired on any given hire date?
*  Database: Employees
*  Table: Employees
*/

SELECT e.hire_date, COUNT(e.emp_no)
FROM employees as e
group by e.hire_date
order BY e.hire_date

/*
*   Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/

SELECT e.emp_no, count(t.title)
FROM employees as e
JOIN titles as t USING(emp_no)
where extract (YEAR FROM e.hire_date) > 1991
group by e.emp_no
order BY e.emp_no


/*
*  Show me all the employees that work in the department development and the from and to date.
*  Database: Employees
*/

SELECT e.emp_no
FROM employees as e
