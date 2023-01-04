CREATE TABLE Employee(
    EmpId integer, 
    FirstName varchar(20), 
    LastName varchar(20), 
    Email varchar(25), 
    PhoneNo varchar(25), 
    Salary integer
);


INSERT INTO Employee VALUES(1,'John','King','john.king@abc.com','123.123.1834',33000);
INSERT INTO Employee(EmpId, FirstName, LastName)VALUES(2,'James','Bond');
INSERT INTO Employee VALUES (4,'Jyothi','Madhusudhan','Madhusudhan@test.com','123.456.4568',100000);
INSERT INTO Employee VALUES (5,'Khushi','Mulge','Khushi@test.com','123.456.4768',19000);
INSERT INTO Employee VALUES (6,'Savyatha','Reddy','Savyatha@test.com','123.486.4568',77000);
INSERT INTO Employee VALUES (7,'Vasanth','Kumar','Vasanth@test.com','123.4569.4568',97000);
INSERT INTO Employee VALUES (8,'Abdhulla','Shaik','Abdhulla@test.com','123.4056.4568',67000);
INSERT INTO Employee VALUES (9,'Vanamu','Giridhar','Vanamu@test.com','123.45637.4568',57000);

create table salary (
    salary int
    );

create or replace procedure add_sal 
is
    cursor c is
    select salary from employee;
    res c%rowtype;
begin
    open c;
    loop
    fetch c into res;
    exit when c%notfound;
    insert into salary values res;
    end loop;
    close c;
end;

-- execute the procedure
execute add_sal;


select * from salary;  --salary table

--select * from employee;
----------------------------------------------------------------------------
create table employee_name (
    FirstName varchar(20), 
    LastName varchar(20)
    );

create or replace PROCEDURE employee_details 
is  
    cursor c is
    select Firstname, lastname from employee;
    res c%rowtype;
    
begin
    open c;
    loop
    fetch c into res;
    exit when c%notfound;
    insert into employee_name values (res.firstname, res.lastname);
    end loop;
    close c;
end;


execute employee_details;

select * from employee_name;

