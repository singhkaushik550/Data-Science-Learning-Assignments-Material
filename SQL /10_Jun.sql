CREATE TABLE students (
    s_id INT PRIMARY KEY,
    s_name VARCHAR(50),
    math INT,
    hindi INT,
    cs INT,
    total_marks INT,
    avg DECIMAL(5,2)
);

INSERT INTO students
(s_id, s_name, math, hindi, cs, total_marks, avg)
VALUES
(101, 'Rohan',   85, 78, 92, 255, 85.00),
(102, 'Aman',    76, 82, 88, 246, 82.00),
(103, 'Priya',   91, 89, 95, 275, 91.67),
(104, 'Neha',    67, 74, 80, 221, 73.67),
(105, 'Rahul',   88, 90, 84, 262, 87.33),
(106, 'Anjali',  95, 92, 98, 285, 95.00),
(107, 'Vikas',   72, 68, 75, 215, 71.67),
(108, 'Pooja',   81, 85, 87, 253, 84.33),
(109, 'Karan',   69, 73, 70, 212, 70.67),
(110, 'Sneha',   90, 94, 89, 273, 91.00);

select * from students

update students set math = math+10 where s_id = 101;

select * from students

update students set s_id = 111 where s_name ='Rohan'

select * from students

alter table students rename to students_data

select * from students

select * from students_data

alter table students_data drop column avg

select * from students_data

alter table students_data 
alter column s_name type varchar(100) 

Alter TABLE students_data
ADD CONSTRAINT unique_student_name UNIQUE (s_name);

select * from students_data

\d students_data


select * from 
information_schema.columns
where table_name = 'students_data'



select * from students_data

