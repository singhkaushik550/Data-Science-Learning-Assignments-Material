CREATE TABLE wind (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO wind VALUES
(101, 'Aman', 'IT', 50000),
(102, 'Shivam', 'IT', 65000),
(103, 'Rohan', 'IT', 55000),
(104, 'Kamal', 'IT', 70000),

(105, 'Priya', 'HR', 45000),
(106, 'Neha', 'HR', 60000),
(107, 'Ankit', 'HR', 50000),

(108, 'Rahul', 'Sales', 40000),
(109, 'Pooja', 'Sales', 55000),
(110, 'Rakesh', 'Sales', 65000),
(111, 'Simran', 'Sales', 60000);

select * from wind

--- row_number() -> unique number/ rank return either data is duplicate or not
select *, row_number()over(order by salary desc) as rn from wind


---- rank() -> rank use for rankingf the data but when we meet with the duplicate value it can skip the next rank
select *, rank()over(order by salary desc) as rn from wind


---- dense_rank() -> it can not skip the rank when we meet the duplicate value

select *, dense_rank()over(order by salary desc) as rn from wind


---- lead() -> it return next row value
select *, lead(salary)over(order by salary) from wind

---- lag() -> it return previous row value
select *, lag(salary)over(order by salary) from wind


--- first_value() -> 
select *, first_value(salary)over(partition by department) from wind

--- last_value() -> 
select *, last_value(salary)over(partition by department rows between unbounded preceding and unbounded following ) from wind


select * from wind order by salary desc

------- complex cte

---1) find the 2nd highest salary
select max(salary) from wind where salary <(select max(salary) from wind where salary < (select max(salary) from wind))

---2nd method
with cte as (
    select *, dense_rank()over(order by salary desc) as rn from wind

)
select distinct salary from cte where rn = 3

-- find the duplicate
with cte as (
    select *, row_number()over(partition by department order by salary desc) as rn from wind
)
select * from cte where rn>1



select max(salary) from employee where salary <(select max(salary from emp))

---------- Multiple cte --------
------- 
select * from wind

with cte1 as (), cte2 () select * from cte1 union all select * from cte2

with cte1 as (
    select emp_id from wind where emp_id in (102,103)
), cte2 as (
    select emp_id from wind where emp_id in (103,105)
)
select * from cte1
union
select * from cte2

--------- Recursive cte 
with cte1 as (
------ anchor query -----
union all
----- recursive query
)
select * from cte1

with recursive cte1 as (
    select 1 as n

    union all 
    select n+1 from cte1 where n<=4
)
select * from cte1

select 1 as n

---- store proceder
---- views 
---- index (cluster,unclustered)
---- 