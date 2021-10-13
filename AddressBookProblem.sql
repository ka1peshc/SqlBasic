create database AddressBookDB;
USE AddressBookDB;

CREATE TABLE Person(
PersonID int identity(101,1) PRIMARY KEY,
FirstName varchar(25) NOT NULL,
LastName varchar(25) NOT NULL,
Email varchar(50) NOT NULL,
PhoneNumber char(10) NOT NULL
);

--Insert record in person
INSERT INTO Person VALUES ('Kalpesh','Chindarkar','kalpesh@gmail.com','9920036999'),
('Omkar','Hunchate','omkarH@gmail.com','8870544129'),
('Anuja','Pawar','AnujaPawar@gmail.com','9012345678');

CREATE TABLE Address(
City varchar(20),
State varchar(20),
ZipCode char(6) NOT NULL,
Fk_PersonID int,
FOREIGN KEY(Fk_PersonID) REFERENCES Person(PersonID) 
);

INSERT INTO Address VALUES ('Mumbai','Maharashtra','400015',(SELECT PersonID FROM Person WHERE FirstName='Kalpesh')),
('Mumbai','Maharashtra','400012',(SELECT PersonID FROM Person WHERE FirstName='Omkar')),
('Satara','Maharashtra','415508',(SELECT PersonID FROM Person WHERE FirstName='Anuja'));

SELECT * FROM Person;
SELECT * FROM Address WHERE Fk_PersonID=(SELECT PersonID from Person where FirstName='Anuja');