-- Exported from QuickDBD: Specifying Data Types, Primary Keys & Foreign Keys 
-- Import CSV Files Into Corresponding SQL Table
CREATE TABLE "departments" (
    "dept_no" varchar(10)  NOT NULL ,
    "dept_name" varchar(30)  NOT NULL ,
    CONSTRAINT PK_departments PRIMARY KEY (
        "dept_no"
    )
);

CREATE TABLE "titles" (
    "title_id" varchar(10)  NOT NULL ,
    "title" varchar(30)  NOT NULL ,
    CONSTRAINT PK_titles PRIMARY KEY (
        "title_id"
    )
);

CREATE TABLE "employees" (
    "emp_no" int  NOT NULL ,
    "employee_title_id" varchar(30)  NOT NULL ,
    "birth_date" date  NOT NULL ,
    "first_name" varchar(20)  NOT NULL ,
    "last_name" varchar(20)  NOT NULL ,
    "sex" varchar(5)  NOT NULL ,
    "hire_date" date  NOT NULL ,
    CONSTRAINT PK_employees PRIMARY KEY (
        "emp_no"
    )
);

CREATE TABLE "dept_emp" (
    "emp_no" int  NOT NULL ,
    "dept_no" varchar(10)  NOT NULL 
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(10)  NOT NULL ,
    "emp_no" int  NOT NULL 
);

CREATE TABLE "salaries" (
    "emp_no" int  NOT NULL ,
    "salaries" int  NOT NULL 
);

ALTER TABLE "employees" ADD CONSTRAINT FK_employees_employee_title_id FOREIGN KEY("employee_title_id")
REFERENCES "titles" ("title_id");

--ALTER TABLE "employees" ADD CONSTRAINT FK_employees_employee_title_id ;

ALTER TABLE "dept_emp" ADD CONSTRAINT FK_dept_emp_emp_no FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

--ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_emp_no]

ALTER TABLE "dept_emp"  ADD CONSTRAINT FK_dept_emp_dept_no FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

--ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_dept_no]

ALTER TABLE "dept_manager" ADD CONSTRAINT FK_dept_manager_dept_no FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

--ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_dept_no]

ALTER TABLE "dept_manager" ADD CONSTRAINT FK_dept_manager_emp_no FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

--ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_emp_no]

ALTER TABLE "salaries" ADD CONSTRAINT FK_salaries_emp_no FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

--ALTER TABLE [salaries] CHECK CONSTRAINT [FK_salaries_emp_no];

-- Query * FROM Each Table Confirming Data
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salaries
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;



