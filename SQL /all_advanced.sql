CREATE TABLE employee_table1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    gender VARCHAR(10),
    department VARCHAR(30),
    designation VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    joining_date DATE
);

INSERT INTO employee_table1 VALUES
(101,'Aman','Male','IT','Developer',50000,'Noida','2020-01-15'),
(102,'Shivam','Male','IT','Senior Developer',70000,'Delhi','2019-03-10'),
(103,'Rohan','Male','HR','HR Executive',40000,'Noida','2021-07-20'),
(104,'Kamal','Male','Finance','Accountant',55000,'Mumbai','2018-05-25'),
(105,'Neha','Female','Sales','Sales Execu tive',45000,'Pune','2022-02-12'),
(106,'Priya','Female','IT','Developer',60000,'Delhi','2020-09-11'),
(107,'Anjali','Female','HR','Manager',75000,'Noida','2017-04-01'),
(108,'Vikas','Male','Finance','Manager',85000,'Mumbai','2016-08-15'),
(109,'Rahul','Male','Sales','Sales Executive',48000,'Pune','2023-01-10'),
(110,'Pooja','Female','Marketing','Executive',52000,'Delhi','2019-12-01'),
(111,'Arjun','Male','Marketing','Manager',78000,'Noida','2018-06-18'),
(112,'Sneha','Female','IT','Tester',55000,'Delhi','2021-11-25'),
(113,'Mohit','Male','IT','Developer',62000,'Noida','2020-04-15'),
(114,'Kiran','Female','Finance','Analyst',58000,'Mumbai','2022-05-05'),
(115,'Deepak','Male','Sales','Manager',90000,'Pune','2017-09-09');

select * from employee_table1

----- Store procedure 
--- create procedure 
create procedure  ____ as
begin
    ---- logic
end





--- create the procedure for see all the data
--1)
create procedure sp_test() as
begin 
    select * from employee_table1

end




execute sp_test
exec sp_test
sp_test

create proc sp_test() as
begin 
    select * from employee_table1

end

----------- views
---- views is a virtual table that can store data on fly not physicaly
---- it is used for enhenced security purpose and improve readibility
create view view_1 as 
(
    select emp_name, department from employee_table1
)

select * from view_1

---------- Indexes -----------
select * from employee_table1

create index ix_1 on employee_table1(emp_id)


drop index ix_1

------- these are two types 
--- 1) clustered index
--- 2) non-clustered index
create clustered index ix_2 on employee_table1(emp_name)



create nonclustered index ix_5 on employee_table(emp_name) 

 