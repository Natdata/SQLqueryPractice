-- Joins
-- Inner Join

-- Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date and max salary. 

with t1 
as
(
SELECT 
    dm.emp_no,
    dm.dept_no,
    e.first_name,
    e.last_name,
    e.hire_date	
    from dept_manager dm
        INNER JOIN
    employees e ON e.emp_no = dm.emp_no
    )
    select t1.emp_no,
    t1.dept_no,
    t1.first_name,
    t1.last_name,
    t1.hire_date, 
    max(s.salary) as max_salary
    from t1 
    inner join salaries s 
    on s.emp_no = t1.emp_no
    group by t1.emp_no,
    t1.dept_no,
    t1.first_name,
    t1.last_name,
    t1.hire_date;
    
    -- Left join = Left outer join
    -- Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. 
    -- See if the output contains a manager with that name.  
    
SELECT 
    e.emp_no, e.last_name
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC , e.emp_no; 

-- Cross join - iloczyn karteziański 

select dm.*, e.*
from dept_manager dm
cross join
employees e
order by dm.dept_no, e.emp_no

   