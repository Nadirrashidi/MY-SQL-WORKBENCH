CREATE DATABASE SESSIONS;

# table create
create table test(
id int ,
name varchar(255),
address varchar(255)
);

# insert records
insert into test (id,name ,address) values (1,'nadir','gujrat');
insert into test (id,name ,address) values (2,'rashidi','new delhi');
insert into test (id,name ,address) values (3,'jilani','surat');
insert into test (id,name ,address) values (4,'shivam','baroda');
insert into test (id,name ,address) values (5,'sssss','baroda');

# select all
select * from test ;

# select distnict address
select distinct address from test;

# select with where condition all selection
select*from test where address='baroda'

#select with where condition with limit selection
select name ,address from test where address ='baroda'
select id ,name ,address  from test order by id;
select id ,name ,address  from test order by id desc;
select id ,name ,address  from test order by name;

select*from test where id=4 and address='baroda'; 


select*from test where id=4 or address='baroda';

select*from test where  not address ='baroda'

select id,name from test where not address ='baroda'

select * from test where name like 'n%'

select * from test where name not like 'n%'

select id,name from test where id between 1 and  3


select id,name from test where id not  between 1 and  3

select id,address from test where id>3

select id,address from test where not id<3 

select id,name,address from test where id is not null

update test set name='svit'  where id=1
select*from test
update test set name='gtu',address='ahmedabad' where id=3

select top 3*from test
select top 3 id,name from test

--select * from test limit 3;
select min(id) from test
select max(id) from test 

select max(id) as maxid from test

select count(id) as total_no_col from test
select count(*) from test

select count(id) as greater_than_three from test where id>3
select * from test

select count (distinct address) from test

select sum(id) from test

select sum(id)  from test where id>3

select sum(id) from test where id=4 

select sum(id*5) from test

select avg(id) as avg_price from test

select * from test

select id,name,address from test where name like's%' 
select id ,name ,address from  test where name like '%s%'
select id,name,address from test where name like 's%' 
or name like 'r%'

select id,name from test where name like '[sr]%'
select * from test
select id,name ,address from test where address  in 
('baroda','new delhi')

select id,name ,address from test where address not in 
('baroda','new delhi')

select address+name as addressname from test


create table orders(
orderid int,
customerid int,
orderdate date
);

select * from orders
insert into orders (orderid,customerid,orderdate) values
(10308,2,'1996-09-18')
insert into orders (orderid,customerid,orderdate) values
(10309,37,'1996-09-19')
insert into orders (orderid,customerid,orderdate) values
(10310,77,'1996-09-20');

select* from orders


create table customers(
customerid int,
customername varchar(255),
contactname varchar(255),
country varchar(255)
);


select*from customers

insert into customers (customerid,customername,contactname,country)
values (1,	'Alfreds Futterkiste',	'Maria Anders'	,'Germany')

insert into customers (customerid,customername,contactname,country)
values (2,	'Ana Trujillo Emparedados y helados',	'Ana Trujillo'	,'Mexico')

insert into customers (customerid,customername,contactname,country)
values (3,	'Alfreds Futterkiste',	'Maria Anders'	,'Germany')

select * from customers


SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

# union
select * from orders o
right join customers c ON o.customerid=c.customerid;

# union
select customerid from customers
union 
select customerid from orders

select customerid from customers
union 
select orderid from orders

# constraints at the definition of table
create table users (
id integer not null primary key,
name varchar(255) unique,
email varchar(255),
age int ,
check (age>18)
);
select * from users
insert into users (id,name,email,age) values
(1,'Nadir','nadir@gmai.com',22)

insert into users (id,name,email,age) values
(2,'aaa','aaa@gmai.com',32)

insert into users (id,name,email,age) values
(3,'eee','eee@gmai.com',28)

insert into users (id,name,email,age) values
(4,'ddd','ddd@gmai.com',20)

insert into users (id,name,email,age) values
(5,'ggg','ggg@gmai.com',45)


select * from users;





create table order1 (
order1_id int not null primary key,
user_id int ,
foreign key(user_id) references users(id)
);

# using alter we want to add pk and fk
CREATE TABLE pkexample (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

alter table pkexample add constraint pkid primary key (id)

CREATE TABLE fkexample (
   Studentid int NOT NULL,
    Age int
);

alter table fkexample add constraint fkstdid foreign key(Studentid)
references pkexample(id)

create table groupbyexample(
customerid int,
contactame varchar(255),
city varchar(255),
country varchar(255)
);

insert into groupbyexample(customerid,contactame,city,country)
values (1,'new delhi','abulfazal','india')
insert into groupbyexample(customerid,contactame,city,country)
values (2,'aaa','ddd','india')
insert into groupbyexample(customerid,contactame,city,country)
values (3,'ggg','ablgftrd','UK')
insert into groupbyexample(customerid,contactame,city,country)
values (4,'JHJHHF','HGYTF','india')
insert into groupbyexample(customerid,contactame,city,country)
values (5,'khvg','jkygtff','Germany')

select * from groupbyexample

select  count(customerid) , country from groupbyexample group by country

select  count(customerid) , country from groupbyexample group by country
order by count(customerid) desc

# Create Table
CREATE TABLE EMPLOYEE(
Emp_Id INT,
Emp_Name VARCHAR(50),
Emp_Salary INT,
Emp_City VARCHAR(50),
Emp_State VARCHAR(50)
);
INSERT INTO EMPLOYEE(Emp_Id,Emp_Name,Emp_Salary,Emp_City,Emp_State)
VALUES (1001,	'Akshay',	20000,	'Noida','U.P')
INSERT INTO EMPLOYEE(Emp_Id,Emp_Name,Emp_Salary,Emp_City,Emp_State)
VALUES (1002,	'RAM',	3500,	'JAIPUR','U.P')
INSERT INTO EMPLOYEE(Emp_Id,Emp_Name,Emp_Salary,Emp_City,Emp_State)
VALUES (1003,	'SHAYAM',	2500,	'GURGAON','U.P')
INSERT INTO EMPLOYEE(Emp_Id,Emp_Name,Emp_Salary,Emp_City,Emp_State)
VALUES (1004,	'MIRA',	3500,	'OLD DEHI','Delhi')
INSERT INTO EMPLOYEE(Emp_Id,Emp_Name,Emp_Salary,Emp_City,Emp_State)
VALUES (1005,	'AAAA',	5400,	'MAHARASTRA','MUMBAI')
INSERT INTO EMPLOYEE(Emp_Id,Emp_Name,Emp_Salary,Emp_City,Emp_State)
VALUES (1006,	'MOHAN',	6333,	'VADORA','GUJRAT')

SELECT * FROM EMPLOYEE

# CREATION OF INDEX ON SINGLE COLOUMN
# Indexes are used to retrieve data from the database more quickly than otherwise. 
# The users cannot see the indexes, they are just used to speed up searches/queries.
CREATE INDEX INDX ON EMPLOYEE(EMP_STATE)
select * from EMPLOYEE
# CREATION OF INDEX ON MULTI COLUMN
CREATE INDEX INDX2 ON EMPLOYEE(EMP_ID,EMP_NAME)
# CREATION OF UNIQUE INDEX Creates a unique index on a table.
#Duplicate values are not allowed

CREATE UNIQUE INDEX UNINDX ON EMPLOYEE(EMP_ID)

# DROP THE INDEX SYNTAX : ALTER TABLE table_name DROP INDEX index_name;


# STORE PROCEDURE : A stored procedure is a prepared SQL code that you can save, 
# so the code can be reused over and over again.So if you have an SQL query that you 
#write over and over again, save it as a stored procedure, and then just call it to 
# execute it.You can also pass parameters to a stored procedure, so that the stored 
# procedure can act based on the parameter value(s) that is passed.
# 1.CREATION OF STORE PROCEDURE
DELIMITER //
CREATE PROCEDURE SelectALLCustomer()
BEGIN
    select * from employee;
END //
DELIMITER ;

# USING PROCEDURE
call SelectAllCustomer

# one more example of creating stored procedure
DELIMITER //
CREATE PROCEDURE selectidname()
BEGIN
SELECT EMP_ID,EMP_NAME FROM EMPLOYEE;
END //
DELIMITER;

call selectidname

# STORE PROCEDURE WITH ONE PARAMETER
CREATE TABLE CUST(
CustomerID INT,
CustomerName VARCHAR(20),
City VARCHAR(20),
PostalCode INT,	
Country VARCHAR(20)
);

INSERT INTO CUST(CustomerID,CustomerName, City,	PostalCode,	Country)
VALUES(1,'Alfreds',	'Berlin',	12209	,'Germany')
INSERT INTO CUST(CustomerID,CustomerName, City,	PostalCode,	Country)
VALUES(2,'Ana',	'Mexio',	05610	,'Mexio')
INSERT INTO CUST(CustomerID,CustomerName, City,	PostalCode,	Country)
VALUES(3,'Alf',	'london',	98765	,'london')
INSERT INTO CUST(CustomerID,CustomerName, City,	PostalCode,	Country)
VALUES(4,'fggds',	'lulea',	12458	,'uk')

DELIMITER //
create procedure SELECTALLCUST()
begin
select * from CUST ;
END //
DELIMITER ;

call SELECTALLCUST()

# With one parameters
DELIMITER //
create procedure SelectAll(in Cityname varchar(20))
BEGIN
SELECT * FROM CUST WHERE City = Cityname ;
END//
DELIMITER ;

# calling stored procedure with one parameter
call SelectAll ('london');




# store procedure with multiple parameter
DELIMITER //
CREATE PROCEDURE SelectAllmultipara (IN Cityname varchar(20) , Countryname varchar(20))
BEGIN
SELECT * FROM Cust WHERE City =Cityname  AND Country =Countryname ;
END //
DELIMITER //

call SelectAllmultipara ('Berlin','Germany')




# pivoting the  table
# pivot table : A pivot table in SQL allows you to transform rows into columns, 
#providing a summary of data in a way that’s easier to analyze. While SQL does not 
#have a direct PIVOT function in MySQL like some other databases (e.g., SQL Server),
#you can achieve similar results using conditional aggregation with CASE statements or
# by using GROUP BY and SUM (or other aggregate functions).

create table pivotexample
( year int,
  region varchar(255),
  sales int
);

insert into pivotexample(year,region,sales) values
(2019,'north',1500);
insert into pivotexample(year,region,sales) values
(2019,'south',1900);
insert into pivotexample(year,region,sales) values
(2020,'north',900);
insert into pivotexample(year,region,sales) values
(2020,'south',2200);

select * from pivotexample

SELECT 
    year,
    SUM(CASE WHEN region = 'North' THEN sales ELSE 0 END) AS North,
    SUM(CASE WHEN region = 'South' THEN sales ELSE 0 END) AS South
FROM 
    pivotexample
GROUP BY 
    year;





# virtual table : In SQL, a view is a virtual table based on the result-set of an SQL
 statement.A view contains rows and columns, just like a real table. The fields in a 
 view are fields from one or more real tables in the database.
 
 select * from cust
 
# creation of view 
CREATE VIEW viewkanaam AS
SELECT CustomerID, CustomerName
FROM cust
WHERE Country = 'Germany';

select * from viewkanaam

# update view
ALTER  VIEW viewkanaam AS
SELECT CustomerID, CustomerName,City
FROM Cust
WHERE Country = 'Germany';

select * from viewkanaam

# Drop view
syntax : drop view viewname 

My sql functions : there are two types of user defined functions
1.Scalar Functions
2.Table Valued Functions
In SQL, functions and stored procedures are both types of routines that help 
encapsulate and reuse SQL logic, but they have different purposes and characteristics:
Functions
Purpose: Functions are used to perform calculations or transformations on data and 
return a single value or a table.
Return Type: They must return a value (scalar or table) and can be used in SQL 
expressions.
Usage: Functions can be used in queries like regular SQL expressions. For example, 
they can be used in SELECT statements or in WHERE clauses.
Side Effects: Functions are generally expected to have no side effects. 
They should not modify the database state.


-- Create Employees1 table
CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Position NVARCHAR(100),
    Salary DECIMAL(10, 2),
    DepartmentID INT
);

-- Create Departments table
CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);


-- Insert data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (1, 'HR'), (2, 'Sales'), (3, 'Engineering');

-- Insert data into Employees
INSERT INTO Employees (EmployeeID, Name, Position, Salary, DepartmentID)
VALUES 
(1, 'Alice Johnson', 'HR Manager', 70000.00, 1),
(2, 'Bob Smith', 'Sales Executive', 60000.00, 2),
(3, 'Carol Davis', 'Software Engineer', 80000.00, 3),
(4, 'David Wilson', 'Sales Manager', 75000.00, 2);


 -- Create scalar function
DELIMITER //

-- Create scalar function
CREATE FUNCTION CalculateTotalSalary(
    EmployeeID INT,
    Bonus DECIMAL(10, 2)
)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE TotalSalary DECIMAL(10, 2);

    -- Get the base salary of the employee
    SELECT Salary INTO TotalSalary
    FROM Employees
    WHERE EmployeeID = EmployeeID;

    -- Add the bonus to the base salary
    SET TotalSalary = TotalSalary + Bonus;

    RETURN TotalSalary;
END;
//
DELIMITER ;

-- Use the scalar function
SELECT CalculateTotalSalary(1, 5000.00) AS TotalSalary;
SELECT CalculateTotalSalary(2, 5000.00) AS TotalSalary;

# pagination :Pagination in MySQL is a technique used to retrieve a subset of 
# records from a larger result set, which is useful for displaying data in chunks
# or pages, such as in web applications where you want to show results over multiple 
#pages.
CREATE TABLE Employees_paginations (
    EmployeeID INT  PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2)
    
);
select * from Employees_paginations

INSERT INTO Employees_paginations( EmployeeID,Name, Position, Salary) VALUES
(1,'Alice Johnson', 'HR Manager', 70000.00),
(2,'Bob Smith', 'Sales Executive', 60000.00),
(3,'Carol Davis', 'Software Engineer', 80000.00),
(4,'David Wilson', 'Sales Manager', 75000.00),
(5,'Eva Brown', 'Marketing Director', 90000.00),
(6,'Frank White', 'Accountant', 55000.00),
(7,'Grace Green', 'Product Manager', 85000.00),
(8,'Hannah Black', 'Business Analyst', 65000.00),
(9,'Ian Gray', 'DevOps Engineer', 78000.00),
(10,'Jill Adams', 'UX Designer', 70000.00),
(11,'Kara Scott', 'Customer Support', 53000.00),
(12,'Leo Turner', 'Web Developer', 62000.00),
(13,'Mia Wilson', 'Software Architect', 90000.00),
(14,'Nate Young', 'Data Scientist', 85000.00),
(15,'Olivia King', 'Chief Technology Officer', 100000.00);

# Example Query to Retrieve Page 1 with 5 Results per Page
SELECT *
FROM employees_paginations
ORDER BY EmployeeID
LIMIT 5 OFFSET 0;

#Example Query to Retrieve Page 2 with 5 Results per Page
SELECT *
FROM employees_paginations
ORDER BY EmployeeID
LIMIT 5 OFFSET 5;

# with clause 

create table data (
id int,
name varchar(24),
age int ,
salary int 
);

insert into data values(101 , 'raja', 25,55452);
insert into data values(102 , 'roja', 29,66452);
insert into data values(103 , 'raj', 35,77452);

select * from data 

WITH CTE  as (select id ,name ,age , salary from data ) 
Select * from CTE;


---CTE FOR MULTIPLE TABLE 

CREATE TABLE CUSTOMERS10 (
   ID INT NOT NULL,
   NAME VARCHAR (20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   SALARY DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);


INSERT INTO CUSTOMERS10 VALUES 
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00 ),
(2, 'Khilan', 25, 'Delhi', 1500.00 ),
(3, 'Kaushik', 23, 'Kota', 2000.00 ),
(4, 'Chaitali', 25, 'Mumbai', 6500.00 ),
(5, 'Hardik', 27, 'Bhopal', 8500.00 ),
(6, 'Komal', 22, 'Hyderabad', 4500.00 ),
(7, 'Muffy', 24, 'Indore', 10000.00 );

WITH CUSTOMER_AGE AS (
SELECT * FROM customers10 WHERE AGE = 23)
# using
SELECT ID, NAME, AGE FROM CUSTOMER_AGE;

WITH
CUSTOMERS_IN_DELHI AS (
   SELECT * FROM CUSTOMERS10 WHERE ADDRESS = 'Delhi'),   
CUSTOMERS_IN_MUMBAI AS (
   SELECT * FROM CUSTOMERS10 WHERE ADDRESS = 'Mumbai')
SELECT ID, NAME, ADDRESS FROM CUSTOMERS_IN_DELHI
UNION ALL
SELECT ID, NAME, ADDRESS FROM CUSTOMERS_IN_MUMBAI;

