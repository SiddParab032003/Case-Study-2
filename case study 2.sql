create database case2
use case2

CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');


  CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);


INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

	   CREATE TABLE JOB (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

CREATE TABLE JOB
(JOB_ID INT PRIMARY KEY,
DESIGNATION VARCHAR(20))

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')


CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)

select * from LOCATION
select * from DEPARTMENT
select * from JOB
select * from EMPLOYEE

--Simple Queries

/* 1. List all the employee details. */

select * from EMPLOYEE

/* 2. List all the department details. */

select * from DEPARTMENT

/* 3. List all job details. */

select * from JOB

/* 4. List all the locations. */

select * from LOCATION

/* 5. List out the First Name, Last Name, Salary, Commission for all Employees.  */

select FIRST_NAME,LAST_NAME,SALARY,COMM from EMPLOYEE

/* 6. List out the Employee ID, Last Name, Department ID for all employees and alias Employee ID as "ID of the Employee", Last Name as "Name of the 
Employee", Department ID as "Dep_id".  */

select EMPLOYEE_ID as 'ID of the Employee',LAST_NAME as 'Name of the Employee',DEPARTMENT_ID as 'Dep_id'  from EMPLOYEE

/* 7. List out the annual salary of the employees with their names only. */

select FIRST_NAME,(salary*12) as Annual_salary from EMPLOYEE

-- WHERE Condition: 
/* 1. List the details about "Smith". */

select * from EMPLOYEE where LAST_NAME='Smith'

/* 2. List out the employees who are working in department 20. */

select * from EMPLOYEE where DEPARTMENT_ID = 20

/* 3. List out the employees who are earning salary between 2000 and 3000. */

select * from EMPLOYEE where SALARY between 2000 and 3000

/* 4. List out the employees who are working in department 10 or 20. */

select * from EMPLOYEE where DEPARTMENT_ID = 10 or DEPARTMENT_ID = 20

/* 5. Find out the employees who are not working in department 10 or 30. */

select * from EMPLOYEE where DEPARTMENT_ID not in (10,30)

/* 6. List out the employees whose name starts with 'L'. */

select * from EMPLOYEE where FIRST_NAME  like 'L%'

/* 7. List out the employees whose name starts with 'L' and ends with 'E'. */

select * from EMPLOYEE where FIRST_NAME like 'L%E'

/* 8. List out the employees whose name length is 4 and start with 'J'. */

select * from EMPLOYEE where len(FIRST_NAME)=4 and FIRST_NAME like'J%'

/* 9. List out the employees who are working in department 30 and draw the salaries more than 2500. */

select * from EMPLOYEE where DEPARTMENT_ID = 30 and SALARY > 2500

/* 10. List out the employees who are not receiving commission. */

select * from EMPLOYEE where COMM is null

--ORDER BY Clause: 

/* 1. List out the Employee ID and Last Name in ascending order based on the Employee ID. */

select EMPLOYEE_ID,LAST_NAME from EMPLOYEE order by EMPLOYEE_ID asc

/* 2. List out the Employee ID and Name in descending order based on salary. */

select EMPLOYEE_ID,FIRST_NAME from EMPLOYEE order by SALARY desc

/* 3. List out the employee details according to their Last Name in ascending-order. */

select * from EMPLOYEE order by LAST_NAME asc

/* 4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order. */

select * from EMPLOYEE order by LAST_NAME asc ,DEPARTMENT_ID desc

--GROUP BY and HAVING Clause: 

/* 1. List out the department wise maximum salary, minimum salary and average salary of the employees. */

select DEPARTMENT_ID,max(Salary) as Max_salary,MIN(salary)as Min_salary,AVG(salary)as Avg_salary from EMPLOYEE group by DEPARTMENT_ID

/* 2. List out the job wise maximum salary, minimum salary and average salary of the employees. */

select JOB_ID,Max(salary)as Max_salary,Min(salary)as Min_salary,Avg(salary)as	Avg_salary from EMPLOYEE group by JOB_ID

/* 3. List out the number of employees who joined each month in ascending order. */

select DATENAME(MONTH, HIRE_DATE) AS Month_Name,count(employee_id)as No_of_Employees from EMPLOYEE group by DATENAME(MONTH, HIRE_DATE) ,Month(HIRE_DATE) order by MONTH (HIRE_DATE) asc

/* 4. List out the number of employees for each month and year in ascending order based on the year and month. */

select concat(DATENAME(month,HIRE_DATE),'-',YEAR(Hire_date)) as Month_year, count(employee_id) as No_of_employees from EMPLOYEE
group by year(HIRE_DATE),Month(Hire_date),DATENAME(month,HIRE_DATE) order by year(hire_date) asc,MONTH(hIRE_date) asc

/* 5. List out the Department ID having at least four employees. */

select DEPARTMENT_ID from EMPLOYEE group by DEPARTMENT_ID having count(EMPLOYEE_ID) >= 4

/* 6. How many employees joined in February month. */

select month(Hire_date) as Feb_month,count(employee_id)as No_of_employees from EMPLOYEE group by month(HIRE_DATE) having MONTH(hire_date) = 2

/* 7. How many employees joined in May or June month. */

select MONTH(hire_date) as May_or_June, count(employee_id) as No_of_employees from EMPLOYEE group by month(hire_date) having month(hire_date)=5 or month(hire_date)=6

/* 8. How many employees joined in 1985? */

select year(hire_date) as Year_1985 , Count(employee_id) as No_of_employees from EMPLOYEE group by Year(Hire_date) having YEAR(hire_date) = 1985

/* 9. How many employees joined each month in 1985? */

select concat(datename(month,hire_date),'-' , Year(hire_date))  as Month_Year_1985, Count(employee_id) as No_of_employees from EMPLOYEE group by Year(Hire_date),month(Hire_date),DATENAME(Month,HIRE_DATE)
having year(hire_date) = 1985 order by MONTH(hire_date)

/* 10. How many employees were joined in April 1985? */

select concat(datename(month,HIRE_DATE),'-',YEAR(Hire_date)) as April_1985,count(EMPLOYEE_id) as No_of_employees from EMPLOYEE group  by Year(HIRE_DATE), Month(Hire_date),DATENAME(month,hire_date)
having year(HIRE_DATE)=1985 and month(hire_date)=4

/* 11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985? */

select DEPARTMENT_ID,count(employee_id) as No_of_employees from EMPLOYEE where year(hire_date)=1985 and month(hire_date)=4
group by department_id having count(employee_id) >= 3

--Joins:
--/*1. List out employees with their department names. */

select e.employee_Id,e.first_name,e.middle_name,e.last_name,d.Department_Id,d.Name as Department_Name from EMPLOYEE e inner join DEPARTMENT d on e.DEPARTMENT_ID = d.Department_Id

/* 2. Display employees with their designations. */

select e.employee_Id,e.first_name,e.middle_name,e.last_name,j.Designation from EMPLOYEE e inner join job j on e.JOB_ID = j.Job_ID

/* 3. Display the employees with their department names and city.  */

select e.employee_Id,e.first_name,e.middle_name,e.last_name,d.Name as Department_Name, l.city from EMPLOYEE e inner join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id 
inner join LOCATION l on d.Location_Id=l.Location_ID

/* 4. How many employees are working in different departments? Display with department names. */

select count(e.employee_id)as No_of_employees,d.name as Department_Names from EMPLOYEE e inner join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id group by d.Name

/* 5. How many employees are working in the sales department? */

select count(e.employee_id) as No_of_Employees,d.name as Department_Names from EMPLOYEE e inner join DEPARTMENT d on e.DEPARTMENT_ID = d.Department_Id
where d.Name = 'sales'group by d.Name 

/* 6. Which is the department having greater than or equal to 3 employees and display the department names in ascending order. */

select count(e.employee_id) as No_of_Employees,d.name as Department_Names from EMPLOYEE e inner join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id
group by d.Name having count(e.employee_id)>=3 order by d.Name asc

/*	7. How many employees are working in 'Dallas'? */

select count(e.employee_id) as No_of_Employees, l.city from EMPLOYEE e inner join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id inner join LOCATION l on
d.Location_Id=l.Location_ID where l.City='Dallas' group  by l.City

/* 8. Display all employees in sales or operation departments. */

select e.employee_Id,e.first_name,e.middle_name,e.last_name ,d.Name as Department_Names from EMPLOYEE e inner join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id
where d.Name = 'Sales'or d.Name = 'Operations' 

-- CONDITIONAL STATEMENT 
/* 1. Display the employee details with salary grades. Use conditional statement to create a grade column. */

select employee_Id,first_name,middle_name,last_name,salary,
case
when salary < 800 then 'Grade C'
when salary between 900 and 2000 then 'Grade C'
when salary between 2000 and 2500 then 'Grade B'
when salary > 2600 then 'Grade A'
else 'No Grade'
end as Grade
from EMPLOYEE

/* 2. List out the number of employees grade wise. Use conditional statement to create a grade column. */

select
case
when salary < 800 then 'Grade C'
when salary between 900 and 2000 then 'Grade C'
when salary between 2000 and 2500 then 'Grade B'
when salary > 2600 then 'Grade A'
else 'No Grade'
end as Grade,
count(employee_id) as No_of_Employees
from EMPLOYEE
group by 
case 
when salary < 800 then 'Grade C'
when salary between 900 and 2000 then 'Grade C'
when salary between 2000 and 2500 then 'Grade B'
when salary > 2600 then 'Grade A'
else 'No Grade'
end
order by grade

/* 3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary. */

select 
case 
when salary between 2000 and 2500 then 'Grade B'
when salary between 2501 and 3500 then 'Grade A'
when salary between 3501 and 5000 then 'Grade A+'
else 'No grade'
end as Grade,
count(employee_id) as No_of_Employees
from EMPLOYEE
where salary between 2000 and 5000
group by 
case
when salary between 2000 and 2500 then 'Grade B'
when salary between 2501 and 3500 then 'Grade A'
when salary between 3501 and 5000 then 'Grade A+'
else 'No grade'
end 
order by Grade

--Subqueries: 
/* 1. Display the employees list who got the maximum salary. */

select * from EMPLOYEE where salary = ( select max(salary) from EMPLOYEE)

/* 2. Display the employees who are working in the sales department. */

select e.* from EMPLOYEE e inner join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id where d.Name = 'Sales'

/* 3. Display the employees who are working as 'Clerk'. */

select e.* from Employee e inner join Job j on e.job_id = j.Job_ID where j.Designation = 'Clerk'

/* 4. Display the list of employees who are living in 'Boston'. */

select e.*,l.City from EMPLOYEE e inner join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id inner join LOCATION l on d.Location_Id=l.Location_ID where l.city = 'Boston'

/* 5. Find out the number of employees working in the sales department. */

select count(*) as No_of_Employees from EMPLOYEE e inner join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id where d.Name='Sales'

/* 6. Update the salaries of employees who are working as clerks on the basis of 10%. */

update e set e.SALARY = e.salary*1.10 from EMPLOYEE e inner join JOB j on e.JOB_ID=j.Job_ID where j.Designation = 'Clerk'

/* 7. Display the second highest salary drawing employee details. */

select * from EMPLOYEE where SALARY=(select max(salary) from EMPLOYEE where salary <( select max(salary) from EMPLOYEE))

/* 8. List out the employees who earn more than every employee in department 30. */

select * from EMPLOYEE where SALARY > (select max(salary) from EMPLOYEE where DEPARTMENT_ID = 30)

/* 9. Find out which department has no employees. */

select d.Department_Id from DEPARTMENT d left join EMPLOYEE e  on d.DEPARTMENT_ID=e.Department_Id where e.EMPLOYEE_ID is null

/* 10. Find out the employees who earn greater than the average salary for their department. */

select * from EMPLOYEE e where SALARY > ( select avg(salary) from EMPLOYEE where DEPARTMENT_ID= e.DEPARTMENT_ID)