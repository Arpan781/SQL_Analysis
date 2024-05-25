SELECT 
    *
FROM
    sales_emp.pr;
SELECT 
    Full_Name, Job_Title, Age
FROM
    sales_emp.pr
WHERE
    salary >= 80000;

-- Select the Full_name of all employees who work in department = IT and 'Engineering'
SELECT 
    Full_Name
FROM
    sales_emp.pr
WHERE
    department IN ('Engineering' , 'IT');

-- Select the total number of IT -employees 
SELECT 
    COUNT(Full_Name) AS total_employees
FROM
    sales_emp.pr
WHERE
    department = 'IT';


-- Select the Deparment of employees, along with their department ID, sorted by Full_Name in ascending order
SELECT 
    Full_Name, department, Gender, Country
FROM
    sales_emp.pr
ORDER BY Full_Name ASC;

-- Select the Deparment of employees, 
SELECT 
    Full_Name, department, Gender, Country
FROM
    sales_emp.pr
WHERE
    department = 'IT' AND Gender = 'Female'
        AND Age = 32
ORDER BY Full_Name ASC;

-- Intermediate SQL Problems:

SELECT 
    Department, MAX(salary) AS highest_salary
FROM
    sales_emp.pr
GROUP BY Department;

SELECT 
    Job_Title, MIN(salary) AS Job_Title_highest_salary
FROM
    sales_emp.pr
GROUP BY Job_Title
ORDER BY Job_Title_highest_salary DESC
LIMIT 4;

SELECT 
    Full_Name, MAX(salary) AS EMP_highest_Salary
FROM
    sales_emp.pr
GROUP BY Full_Name
ORDER BY EMP_highest_Salary DESC
LIMIT 5;


-- Find the number of employees in each department
SELECT 
    Department, COUNT(*) AS num_employees
FROM
    sales_emp.pr
GROUP BY Department;

-- Find employees who earn more than the average salary of their department
SELECT 
    Full_Name, salary, Department
FROM
    sales_emp.pr e
        JOIN
    (SELECT 
        Department, AVG(salary) AS avg_salary
    FROM
        sales_emp.pr
    GROUP BY Department) d ON e.Department = d.Department
WHERE
    salary > d.avg_salary;

-- List all departments that have more than 5 employees
SELECT 
    Department
FROM
    sales_emp.pr
GROUP BY Department
HAVING COUNT(*) > 50;
 
-- Employe Department wise--
SELECT 
    Department, COUNT(*) AS num_employees
FROM
    sales_emp.pr
GROUP BY Department;

-- Find the second highest salary in the company
SELECT 
    MAX(salary) AS second_highest_salary
FROM
    sales_emp.pr
WHERE
    salary < (SELECT 
            MAX(salary)
        FROM
            sales_emp.pr);

-- Name, Department, Max Salary--

SELECT 
    Full_Name, Department, Salary
FROM
    sales_emp.pr
WHERE
    salary = (SELECT 
            MAX(salary)
        FROM
            sales_emp.pr
        WHERE
            salary < (SELECT 
                    MAX(salary)
                FROM
                    sales_emp.pr));


-- Name, Department, Max Salary Age, same queary with where + And function--
SELECT 
    Full_Name, Department, salary, age
FROM
    sales_emp.pr
WHERE
    salary < (SELECT 
            MAX(salary)
        FROM
            sales_emp.pr
        WHERE
            salary < (SELECT 
                    MAX(salary)
                FROM
                    sales_emp.pr))
        AND Age >= 50;


-- Find employees who share the same Full_name more than one time
SELECT 
    Full_Name AS New_Name, COUNT(*) AS count
FROM
    sales_emp.pr
GROUP BY New_Name
HAVING COUNT(*) >= 1;

-- Update the salary of employees by 10% who are in department = IT
SELECT 
    Full_Name, Salary
FROM
    sales_emp.pr;
-- select salary as New_salary --

SELECT 
    Full_Name, salary, salary * 1.5 AS New_IT_Salary
FROM
    sales_emp.pr
WHERE
    Department = 'IT';

-- Advance--
-- Find the highest paid employee in each department:
SELECT Department, Full_Name, salary
FROM sales_emp.pr
WHERE (Department, salary) IN (
    SELECT Department, MAX(salary)
    FROM sales_emp.pr
    GROUP BY Department
);

-- List employees who earn more than the average salary in their department:

SELECT Full_Name, Department, salary
FROM sales_emp.pr e
WHERE salary > (SELECT AVG(salary)
                FROM sales_emp.pr
                WHERE Department = e.Department);

-- Find the department with the maximum number of employees:
SELECT Department, COUNT(*) AS num_employees
FROM sales_emp.pr
GROUP BY Department
ORDER BY num_employees DESC
LIMIT 1;
-- Find the department with the maximum Salary of employees: if need top 5 then Limit 1- 5 --
SELECT Department, max(salary) AS Top_salary
FROM sales_emp.pr
GROUP BY Department
ORDER BY Top_salary DESC
LIMIT 1;

-- Find the top 3 highest-paid employees from Sales depertment  in the company:--
SELECT Full_Name, salary
FROM sales_emp.pr
where Department = "sales"
ORDER BY salary DESC
LIMIT 3;

-- Identify departments where the total salary expenditure exceeds a certain threshold:
SELECT Department, SUM(salary) AS total_salary
FROM sales_emp.pr
GROUP BY Department
HAVING SUM(salary) > 150000;

SELECT Department, SUM(salary) AS total_salary
FROM sales_emp.pr
where Department = "IT" 
having SUM(salary) > 150000;

-- Identify  list of as criteria departments where the total salary expenditure exceeds a certain threshold:
SELECT Department, SUM(salary) AS total_salary
FROM sales_emp.pr
WHERE Department IN ('IT', 'Engineering')
GROUP BY Department
HAVING  total_salary > 150000;


-- Find employees who have been with the company for more than 5 years:

select * from sales_emp.pr
where Department between  "Finance" and "IT" ;

SELECT *
FROM sales_emp.pr
WHERE Department BETWEEN 'Finance' AND 'IT';
