with  salary as
				(select emp_no, salary
                 from salaries
                 where year(to_date) = 1999),
	 dept_no as (with cte_max_date as
				(select emp_no, max(from_date) as max_date
									from dept_emp
									group by emp_no
									) 
				select cmd.emp_no, de.dept_no
				from cte_max_date cmd
				join dept_emp de on cmd.emp_no=de.emp_no 
				and cmd.max_date = de.from_date)
select s.emp_no, s.salary, d.dept_no
from salary s join dept_no d on s.emp_no= d.emp_no

	