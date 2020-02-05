-- List the following details of each employee:
-- employee number, last name, first name, gender, and salary.
select
	e.emp_no as "Employee #",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	e.gender as "Gender",
	s.salary as "Salary"
from employees as e
right join salaries as s
	on (e.emp_no = s.emp_no);


-- List employees who were hired in 1986.
select
	first_name as "First Name",
	last_name as "Last Name",
	hire_date as "Hire Date"
from employees
where hire_date
	between '1986-01-01' and '1986-12-31'
order by "Hire Date";


-- List the manager of each department with the following information:
-- department number, department name, the manager's employee number,
-- last name, first name, and start and end employment dates.
select
	d_m.dept_no as "Department #",
	d.dept_name as "Department",
	d_m.emp_no as "Employee #",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d_m.from_date as "Start Date",
	d_m.to_date as "End Date"
from dept_manager as d_m
inner join departments as d
	on (d_m.dept_no = d.dept_no)
inner join employees as e
	on (d_m.emp_no = e.emp_no);


-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
select
	e.emp_no as "Employee #",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department"
from employees as e
inner join dept_emp as d_e
	on (e.emp_no = d_e.emp_no)
inner join departments as d
	on (d_e.dept_no = d.dept_no)
order by "Employee #";


-- List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees
where first_name = 'Hercules'
	and last_name like 'B%';


-- List all employees in the Sales department, including: 
-- employee number, last name, first name, and department name.
select
	e.emp_no as "Employee #",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department"
from employees as e
inner join dept_emp as d_e
	on (e.emp_no = d_e.emp_no)
inner join departments as d
	on (d_e.dept_no = d.dept_no)
where d.dept_name = 'Sales'
order by "Department";


-- List all employees in the Sales and Development departments, including:
-- employee number, last name, first name, and department name.
select
	e.emp_no as "Employee #",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department"
from employees as e
inner join dept_emp as d_e
	on (e.emp_no = d_e.emp_no)
inner join departments as d
	on (d_e.dept_no = d.dept_no)
where d.dept_name in ('Sales', 'Development')
order by "Department";


-- In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
select
	last_name as "Last Name",
	count(last_name) as "Count"
from employees
group by last_name
order by "Count" desc;


-- Small part of bonus
select
	emp_no,
	last_name,
	first_name
from employees
where emp_no = '499942';