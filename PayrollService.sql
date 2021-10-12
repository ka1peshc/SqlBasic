--UC1
create database payroll_service;

--SHOW DATABASES;

use payroll_service;

--UC2
create table employee_payroll(
id int,
name varchar(100),
salary int,
start_date Date);

--UC3
insert into employee_payroll values (101,'kalpesh chindarkar','52000','2022/01/01'),
(304,'Ketan Chindarkar','58000','2021/05/14');

--UC4
select * from employee_payroll;

--UC5
--INSERTING FEW RECORD
insert into employee_payroll values (201,'Bill','91050','2019/01/01'),
(204,'Bharati','80000','2020/05/14');
--searching for employee name is bill
select salary from employee_payroll where name='Bill';

--searching name and salary for people how join from 2018-01-01
select name,salary from employee_payroll where start_date between CAST('2018-01-01' AS date) and GETDATE();

--UC6
Alter table employee_payroll add gender char;

update employee_payroll set gender='M' where name='Bill' or name='kalpesh chindarkar' or name='Ketan Chindarkar';
update employee_payroll set gender='F' where name='Bharati';
Select * from employee_payroll;

--UC7
--Average
select AVG(salary) from employee_payroll;
--Sum 
select SUM(salary) from employee_payroll;
--Minimum
select MIN(salary) from employee_payroll;
--Maximum
select MAX(salary) from employee_payroll;
--Count
select COUNT(salary) from employee_payroll;
-- Group by 
SELECT SUM(salary) FROM employee_payroll
WHERE gender = 'F' GROUP BY gender;
SELECT SUM(salary) FROM employee_payroll
WHERE gender = 'M' GROUP BY gender;

--UC 8
Alter table employee_payroll add address varchar(255) default 'TBS'; 
Alter table employee_payroll add phonenumber varchar(255);
Alter table employee_payroll add department varchar(255) not null default 'bench';

--UC9
Alter table employee_payroll add basicPay float, Deduction float, TaxablePay float, IncomeTax float, NeyPay float;