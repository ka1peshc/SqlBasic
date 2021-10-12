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
