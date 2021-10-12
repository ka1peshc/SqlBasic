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
