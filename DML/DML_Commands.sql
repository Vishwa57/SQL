		--DATA MANIPULATION LANGUAGE

--		#1. INSERT

use Practice_DB
insert into employee (emp_id, first_name, last_name) 
values	(133, 'Vishwa', 'Srinivasan')

select * from employee

insert into employee 
values	(132, 'Gowsi', 'Srinivasan')

select * from employee

-- ERROR : Column name or number of supplied values does not match table definition.
/*
But if we want to insert values for all the col then no need to
specify the col names separately. but order should be preserved.*/

-- for eg

alter table employee drop column hire_data --# which has date datatype

select * from employee

insert into employee values (132, 'Gowsi', 'Srinivasan', null, null, null, null, NULL)

-- here all the values get updated so no need to give names of col

drop table employee

-- SAMPLE DATA TABLE
use Practice_DB
CREATE TABLE EMPLOYEE
(
   EmpCode      INT,
   EmpFName     VARCHAR(15),
   EmpLName     VARCHAR(15),
   Job          VARCHAR(45),
   Manager      CHAR(4),
   HireDate     DATE,
   Salary       INT,
   Commission   INT,
   DEPTCODE     INT
);

INSERT INTO EMPLOYEE  
VALUES (9369, 'TONY', 'STARK', 'SOFTWARE ENGINEER', 7902, '1980-12-17', 2800,0,20),
       (9499, 'TIM', 'ADOLF', 'SALESMAN', 7698, '1981-02-20', 1600, 300,30),    
       (9566, 'KIM', 'JARVIS', 'MANAGER', 7839, '1981-04-02', 3570,0,20),
       (9654, 'SAM', 'MILES', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
       (9782, 'KEVIN', 'HILL', 'MANAGER', 7839, '1981-06-09', 2940,0,10),
       (9788, 'CONNIE', 'SMITH', 'ANALYST', 7566, '1982-12-09', 3000,0,20),
       (9839, 'ALFRED', 'KINSLEY', 'PRESIDENT', 7566, '1981-11-17', 5000,0, 10),
       (9844, 'PAUL', 'TIMOTHY', 'SALESMAN', 7698, '1981-09-08', 1500,0,30),
       (9876, 'JOHN', 'ASGHAR', 'SOFTWARE ENGINEER', 7788, '1983-01-12',3100,0,20),
       (9900, 'ROSE', 'SUMMERS', 'TECHNICAL LEAD', 7698, '1981-12-03', 2950,0, 20),
       (9902, 'ANDREW', 'FAULKNER', 'ANAYLYST', 7566, '1981-12-03', 3000,0, 10),
       (9934, 'KAREN', 'MATTHEWS', 'SOFTWARE ENGINEER', 7782, '1982-01-23', 3300,0,20),
       (9591, 'WENDY', 'SHAWN', 'SALESMAN', 7698, '1981-02-22', 500,0,30),
       (9698, 'BELLA', 'SWAN', 'MANAGER', 7839, '1981-05-01', 3420, 0,30),
       (9777, 'MADII', 'HIMBURY', 'ANALYST', 7839, '1981-05-01', 2000, 200, NULL),
       (9860, 'ATHENA', 'WILSON', 'ANALYST', 7839, '1992-06-21', 7000, 100, 50),
       (9861, 'JENNIFER', 'HUETTE', 'ANALYST', 7839, '1996-07-01', 5000, 100, 50);

select * from employee -- #case insensitive

select * from emp6

insert into emp6 (emp_id, first_name, last_name) 
select empcode, empfname, emplname from employee where salary>2000

use Practice_DB
CREATE TABLE emp_test
(
   EmpCode      INT NOT NULL,
   EmpFName     VARCHAR(15),
   EmpLName     VARCHAR(15),
   Job          VARCHAR(45),
   Manager      CHAR(4),
   HireDate     DATE,
   Salary       INT,
   Commission   INT,
   DEPTCODE     INT
);

insert into emp_test select * from EMPLOYEE -- copy complete table

select * from emp_test

use Practice_DB
CREATE TABLE emp_test1
(
   EmpCode      INT NOT NULL,
   EmpFName     VARCHAR(15),
   EmpLName     VARCHAR(15),
   Job          VARCHAR(45),
   Manager      CHAR(4),
   HireDate     DATE,
   Salary       INT,
   Commission   INT,
   DEPTCODE     INT
);

insert into emp_test1(job, DEPTCODE) select job, DEPTCODE from EMPLOYEE 

/* ERROR : Cannot insert the value NULL into column 'EmpCode', table 'Practice_DB.dbo.emp_test1';
		   column does not allow nulls. INSERT fails. */
   -- Reason : empcode should have values

--			#2. UPDATE

select * from emp_test

update emp_test set salary = 7000 where empcode = 9369

update emp_test set hiredate = '1980-12-17'  -- #every rows gets affected

update emp_test set salary = 6000, Commission=400 where empcode = 9499

--			#3. DELETE

select * from emp6

delete from emp6 where first_name = 'TONy' -- TONY or TonY doesn't matter

delete from emp6 -- deletes all rows 

--			#4. SELECT

select * from employee

select top(5) * from employee

select top(5) EmpCode, EmpFName from employee

select distinct deptcode from employee -- #display unique values

select top(5) EmpCode as ecode, EmpFName as _name from employee -- here we are 
						-- giving alias name for empcode and empfname
select top(5) EmpCode, EmpFName as _name from employee -- only alias for empfname


--			#5. SORTING

select * from employee

select * from employee order by salary  -- #by default ascending
select * from employee order by salary asc -- ascending
select * from employee order by salary desc -- descending

select top(5) * from employee order by salary desc 

select top(5) * from employee where deptcode = 50 order by salary desc

--			#6. FILTERING

---			NOT, AND, OR, >, <, =, !=, <=, >=, BETWEEN, IN, LIKE

use Practice_DB
SELECT * from employee

SELECT * from employee where EmpFName='tony' and EmpLName='stark'

SELECT * from employee where EmpFName='tony' or EmpLName='adolf'

SELECT * from employee where DEPTCODE in (10,20)

SELECT * from employee where DEPTCODE not in (10,20)

SELECT * from employee where DEPTCODE between 10 and 20 -- ends are inclusive

-- LIKE used with strings '%' represents no or all characters, '_' represents single char

SELECT * from employee where job like 'm%'  -- manager, mechanic, ..

SELECT * from employee where job like '%n' -- lineman, salesman, ..

SELECT * from employee where job like 's%n' -- salesman

SELECT * from employee where job like 'salesm__'	-- salesman

--       #7. CASE

--  case ( col_name )
--- WHEN cond THEN do_THIS
--- ELSE	DO_THIS

declare @k int   -- this is how we declare variable here
set @k=2

select case(@k)
when 1 then 'one'
when 2 then 'two'
else 'default'
end


select  case(deptcode) 
when 10 then 'ece'
when 20 then 'eee'
else 'non-circuit'
end
from employee
