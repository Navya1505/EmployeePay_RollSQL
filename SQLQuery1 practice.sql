---Welcome To Employee Pay Roll Data Base Problem---

--uc1 Create Payroll_Service1 Database--
create database payroll_service1;
select name from sys.databases;
use payroll_service1

--uc2 employee_payroll table--
create table employee_payroll
(
id int identity(1,1) primary key,
name varchar(50) not null,
salary money not null,
start_date date not null
);

--uc3 Create employee_payroll data as part of CURD Operation
insert into employee_payroll(name,salary,start_date)
values('navya', 15000,'2021-05-15'),
('Geetha',35000,'2019-12-05'),
('Ram',50000,'2018-08-25');

--uc4 Retrieve employee_payroll data
select * from employee_payroll

--uc5  Retrieve salary of particular employee and particular date range
select salary from employee_payroll where name = 'navya'
select name from employee_payroll where start_date<= '2021-01-01'
select getdate()
select name from employee_payroll where start_date between '2020-01-01' and getdate()

--uc6 add Gender to Employee_Payroll Table and Update the Rows to reflect the correct Employee Gender
alter table employee_payroll add gender char
update employee_payroll set gender = 'F' where name ='navya' or name ='geetha' --or
update employee_payroll set gender = 'F' where name in ('navya','Geetha')
update employee_payroll set gender = 'M' where name ='Ram'

--adding names to table
insert into employee_payroll values('Lakshman', 60000,'2017-02-01','M'),
('sita',45000,'2015-01-04','F'),('Kavya',40000,'2022-07-25','F');

--uc7 find sum, average, min, max and number of male and female employees
select sum(salary) from employee_payroll
select (salary), name from employee_payroll where gender = 'F'
select sum(salary) from employee_payroll where gender = 'F' group by gender;
select sum(salary) from employee_payroll where gender = 'F'
select avg(salary) from employee_payroll where gender = 'F' group by name
select min(salary) from employee_payroll where gender = 'F'
select max(salary) from employee_payroll where gender = 'M'
select count(salary) from employee_payroll where gender = 'F'
select min(salary) from employee_payroll
select count(*) from employee_payroll
select name,max(salary) from employee_payroll group by name

--uc8 add employee phone, department(not null), Address (using default values)
alter table employee_payroll add phone varchar(13),
address varchar(100) default 'India' not null,
department varchar(30) default 'CS' not null;
update employee_payroll set phone = '7396523229' where name ='navya'
select * from employee_payroll

-- adding and deleting column,rows 
alter table employee_payroll add extra varchar(30)
alter table employee_payroll drop column extra ;
set Identity_insert employee_payroll on
insert into employee_payroll(id,name,salary,gender,start_date) values(9,'Mounika',675585875,'F',GETDATE())
insert into employee_payroll(id,name,salary,gender,start_date) values(10,'Tom',675585875,'F',GETDATE())
update employee_payroll set name = 'Fathima' where name='Mounika'
delete from employee_payroll where name in ('Fathima','Mounika')
