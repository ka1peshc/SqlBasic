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

--UC10
insert into employee_payroll values
(901,'Terisa',3000000, '2018-01-03' , 'F','New York',9922003699,'Marketting',  3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00)
, (911,'Terisa',3000000, '2018-01-03' , 'F','New York',9922003699,'Sales',  3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00);
select * from employee_payroll where name='Terisa';

--UC 11
CREATE TABLE Company(
CompanyID int identity(1,1) PRIMARY KEY,
CompanyName varchar(100) not null);

CREATE TABLE Department(
DepartmentID int identity(1,1) PRIMARY KEY,
DepartmentName varchar(100) not null);

CREATE TABLE employee(
ID int identity(1,1) PRIMARY KEY,
EmployeeName varchar(100) NOT NULL,
EmployeePhoneNumber int not null,
EmployeeAddress varchar(255),
EmployeeGender char(1),
EmployeeJoining date,
Fk_CompanyID int,
Foreign key(Fk_CompanyID) REFERENCES Company(CompanyID)
);

CREATE TABLE Payment(
PaymentID int identity(1,1) PRIMARY KEY,
Fk_EmployeeID int not null,
basicPay float not null, 
Deduction float not null, 
TaxablePay float not null, 
IncomeTax float not null,
NetPay float  not null
Foreign key(Fk_EmployeeID) REFERENCES employee(id)
);

CREATE TABLE EmployeeDepartment(
EmployeeID int,
DepartmentID int,
Foreign key(EmployeeId) REFERENCES employee(id),
Foreign key(DepartmentID) REFERENCES Department(DepartmentID)
);
--Insert in Company and Department
INSERT INTO Company VALUES ('Apple'),('Amazon'),('Microsoft');
INSERT INTO Department Values ('Marketing'),('Sales'),('R&D');

--Insert in Employee table
INSERT INTO employee VALUES ('Kalpesh',986926455,'Sewri Mumbai','M','2019/02/15',(SELECT CompanyID FROM Company WHERE CompanyName='Amazon'));
INSERT INTO employee VALUES ('Abhishek','828241418','Khar Mumbai','M','2017/01/28',(Select CompanyID from Company where CompanyName='Microsoft'));
INSERT INTO employee VALUES ('Terissa','78787878','Mumbai','F','2018/05/07',(Select CompanyID from Company where CompanyName='Apple'));

--Insert in Payment table
INSERT INTO Payment VALUES ((Select ID from employee where EmployeeName='Kalpesh'),50000,5000,45000,2500,42500);
INSERT INTO Payment VALUES ((Select ID from employee where EmployeeName='Abhishek'),60000,6000,54000,2500,53500);
INSERT INTO Payment VALUES ((Select ID from employee where EmployeeName='Terissa'),60000,6000,54000,2500,53500);

--Insert in EmployeeDepartment
INSERT INTO EmployeeDepartment VALUES ((Select ID from employee where EmployeeName='Terissa'),(SELECT DepartmentID from Department where DepartmentName='Marketing')),
((Select ID from employee where EmployeeName='Terissa'),(SELECT DepartmentID from Department where DepartmentName='Sales'));

