--					DATABASE MANAGEMENT SYSTEM

-- DATA DEFINITION LANGUAGE (DDL) - #Create, #Alter( Add, Drop, Alter ), #Drop

CREATE Database Practice_DB

Use Practice_DB			-- under which database

CREATE TABLE employee		-- create table <t_name> { col_name datatype };
(   						-- they are case insensitive create, CReate are same
	emp_id int,
	first_name varchar(20) NOT NULL,	-- we want to make it mandatory that 
	last_name varchar(20),				-- the values should not be NULL
	mgr_id numeric(4),
	hire_data date,
	job_id numeric(2),
	deptno numeric(2)
);

-- Alter Table <table_name> add <col_name> <datatype>  

Alter Table employee add age int  

Alter Table employee add Salary int

-- Alter Table <table_name> drop column <col_name>

Alter Table employee drop column Salary 

--Alter Table <table_name> Alter column <col_name> <datatype>   #changing datatype

Alter Table employee Alter column mgr_id int

--#DROP

create table something(column_name int, col2 varchar(23) );

--Drop table <table_name>

Drop table something     --Drop table something; 
						 --#we can include ';' since it won't change anything

--			#Constraints

create table emp1	-- primary key where the values uniquely identifies the rows
(	emp_id int Primary key,	 
	f_name varchar(20)	NOT NULL, -- NOT NULL - values should be present
	l_name varchar(20),
	age int unique	-- values should be unique
);

-- if we don't give anything before it just creates the table in the master database,
-- which is a system database

use Practice_DB

create table emp2	-- primary key where the values uniquely identifies the rows
(	emp_id int Primary key,	 
	f_name varchar(20)	NOT NULL, -- NOT NULL - values should be present
	l_name varchar(20),
	age int unique	-- values should be unique
);

use Practice_DB -- #Alternate method (method 2)

create table emp3	-- primary key where the values uniquely identifies the rows
(	emp_id int ,	 
	f_name varchar(20)	NOT NULL, -- NOT NULL - values should be present
	l_name varchar(20),
	salary int,
	age int unique,	-- values should be unique
	constraint p_key1 Primary key (emp_id),
);

-- this method will be useful when we try to have primary keys as set of columns

use Practice_DB -- #Alternate method (method 2)

create table emp4	-- primary key where the values uniquely identifies the rows
(	emp_id int ,	 
	f_name varchar(20)	NOT NULL, -- NOT NULL - values should be present
	l_name varchar(20),
	salary int,
	age int unique,	-- values should be unique
	constraint p_key2 Primary key (emp_id, salary), -- key value #p_key2 should be unique
);							-- in every database

--  METHOD #3

use Practice_DB
CREATE TABLE emp5	
(   						
	emp_id int,
	first_name varchar(20) NOT NULL,	 
	last_name varchar(20)
);

alter table emp5 add constraint p_key3 primary key(emp_id)
-- ERROR : Cannot define PRIMARY KEY constraint on nullable column in table 'emp5'.

use Practice_DB
CREATE TABLE emp6	
(   						
	emp_id int NOT NULL,
	first_name varchar(20) NOT NULL,	 
	last_name varchar(20)
);

alter table emp6 add constraint p_key3 primary key(emp_id)

alter table emp6 drop constraint p_key3  -- #it will drop the constraints

--					#FORIEGN KEY 

-- one table gets linked with another table by references


use Practice_DB
create table Product -- #Parent table
(	prod_id int primary key,
	p_name varchar(20),
	available int
);

create table orders -- #child table 
(	order_id int Primary Key,
	p_id int,		-- refers prod_id from product table
	quantity int,

	constraint fk_pid foreign key (p_id) references Product (prod_id)
);

 --METHOD #2
alter table orders add constraint fk_pid foreign key (p_id) references Product (prod_id)

drop table Product

-- ERROR : Could not drop object 'Product' because it is referenced 
--         by a FOREIGN KEY constraint.
/*
now if we try to delete the table product from the database,it will throw error
since it has the reference to some other table ( orders ) but if we want to delete that 'Product' table and it 
should not produce any error means, we can give the condition that whenever we try to 
delete this table, delete the tables associated with it.
*/

alter table orders 
add constraint fk_pid foreign key (p_id) 
references Product (prod_id)
on delete cascade

--this will delete the child table as well when parent table is getting deleted

--					#VIEW

/*
use Practice_DB
CREATE TABLE emp6	
(   						
	emp_id int NOT NULL,
	first_name varchar(20) NOT NULL,	 
	last_name varchar(20)
);
*/


create view view_emp as select * from emp6

create view view_emp1 as select emp_id, first_name from emp6
/*
In SQL, a view is a virtual table that is derived from one or more tables or other views. 
It is a saved SQL query that can be treated as a table in subsequent queries. 
A view does not store any data itself; instead, it retrieves data dynamically 
from the underlying tables whenever the view is queried.

Views can restrict the data that users have access to.
By granting users access to specific views instead of the underlying tables,
you can control the data they can retrieve or modify. This allows for 
fine-grained access control and enhances security.
*/
