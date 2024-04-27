create database Employeer
use Employeer
------NGUY HIỂM---------------
drop table Employees
----------------------------
-- BÀI 1-------------
create table Employees(
   employeeID int primary key identity not null,
   firstName nvarchar(100),
   lastName nvarchar(100),
   position nvarchar(100),
   departmentID int not null,
   salary money
)
insert into[dbo].[Employees] (firstName, lastName, position, departmentID, salary)
values(N'Nguyễn Văn',N'A',N'Trưởng phòng',1,900),
       (N'Nguyễn Văn',N'B',N'Nhân viên',1,600),
	   (N'Nguyễn Văn',N'C',N'Nhân Viên',1,500),
	   (N'Nguyễn Văn',N'D',N'Nhân Viên',1,500),
	   (N'Nguyễn Văn',N'E',N'Nhân Viên',2,900),
	   (N'Nguyễn Văn',N'F',N'Nhân Viên',2,450),
	   (N'Nguyễn Văn',N'G',N'Nhân Viên',2,500),
	   (N'Nguyễn Văn',N'H',N'Nhân Viên',3,900),
	   (N'Nguyễn Văn',N'J',N'Nhân Viên',3,400),
	   (N'Nguyễn Văn',N'K',N'Nhân Viên',3,500),
	   (N'Nguyễn Văn',N'L',N'Nhân Viên',3,500);

select * from Employees
-- --------------BÀI 2 ------------------
create table Departments(
departmentID int primary key identity not null,
departmentName nvarchar(2000))

insert into Departments(departmentName)
values(N'Phòng IT'),
      (N'Phòng Nhân Sự'),
	  (N'Phòng Kế Toán');

select * from Departments
------INNER JOIN--------
select firstName + lastName as FullName, departmentName
from Employees e
INNER JOIN Departments d
ON e.departmentID = d.departmentID
-------------------------------------------------
select *from Employees
--------BÀI 3--------------------------
--- Tính Tổng Lương các Phòng ban
select Sum(salary) as SalaryOfDeparment,departmentName
from Employees e 
inner join Departments d
on e.departmentID = d.departmentID 
group by departmentName ;
-- sắp xếp theo thứ tự giảm dần
select Sum(salary) as SalaryOfDeparment,departmentName
from Employees e 
inner join Departments d
on e.departmentID = d.departmentID 
group by departmentName order by  SalaryOfDeparment desc;
--- Phòng Ban có tiền lương cao nhất
select  top 1 departmentName,Sum(salary) as SalaryOfDeparment
from Employees e 
inner join Departments d
on e.departmentID = d.departmentID 
group by departmentName order by  SalaryOfDeparment desc;
