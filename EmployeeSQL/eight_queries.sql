-- Data Analysis
-- Once you have a complete database, do the following:
qwerty - generates a syntax error and stop right here
-- if you accidentally run the entire file

-- 1. List the following details of each employee:
-- employee number, last name, first name, sex, and salary.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
from employees e
left join salaries s on e.emp_no = s.emp_no
-- Bonus: uncomment next line to see if there are any "volunteer" workers
-- where s.salary is null

-- 2. List first name, last name, and hire date for employees
-- who were hired in 1986.
select
	first_name,
	last_name,
	hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date


-- 3. List the manager of each department with the following information:
-- department number,
-- department name,
-- the manager's employee number,
-- last name,
-- first name.
select
	d.dept_no,
	d.dept_name,
	dm.emp_no,
	m.last_name,
	m.first_name
from dept_managers dm
join employees m on m.emp_no = dm.emp_no
join departments d on d.dept_no = dm.dept_no


-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees e
left join dept_emp de on de.emp_no = e.emp_no
left join departments d on d.dept_no = de.dept_no
-- Bonus: uncomment to see if there are any orphan employees
-- where d.dept_name is null


-- 5. List first name, last name, and sex for employees
-- whose first name is "Hercules" and last names begin with "B."
select
	first_name, last_name, sex
from
	employees
where first_name = 'Hercules'
  and last_name like 'B%'


-- 6. List all employees in the Sales department, including their
-- employee number, last name, first name, and department name.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
where lower(d.dept_name) like '%sales%'
--Bonus: uncomment to see if there are any other spelling
--and d.dept_name != 'Sales'


-- 7. List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
where d.dept_name in ('Sales', 'Development')
--Bonus: (un)comment to see if there are any other spelling of Development
--where d.dept_name != 'Development' and lower(d.dept_name) like '%development%'


-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
select
	last_name,
	count(*) as frequency
from  employees
group by last_name
order by frequency DESC


-- Epilogue
-- Evidence in hand, you march into your boss's office and present the
-- visualization. With a sly grin, your boss thanks you for your work.
-- On your way out of the office, you hear the words, "Search your ID number."
-- You look down at your badge to see that your employee ID number is 499942.
select e.*,
	d.dept_name,
	m.first_name||' '||m.last_name as manager_name,
	s.salary
from employees e
left join dept_emp de on de.emp_no = e.emp_no
left join departments d on d.dept_no = de.dept_no
left join dept_managers dm on dm.dept_no = d.dept_no
left join employees m on m.emp_no = dm.emp_no
left join salaries s on s.emp_no = e.emp_no
where e.emp_no = 499942
	
