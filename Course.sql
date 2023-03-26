create database Course
USE Course


create table Students(
Id int	primary key identity(1,1),
FullName nvarchar(50),
Birthday date,
Addres nvarchar(50),
CityId int foreign key references Cities(Id)
)

ALTER TABLE Students ADD CityId INT FOREIGN KEY REFERENCES Cities(Id);

create table Educations(
Id int	primary key identity(1,1),
[Name] nvarchar (50),
Duration int,
)

create table Rooms(
Id int	primary key identity(1,1),
[Name] nvarchar (50),
Capacity int
)

create table Teacher (
Id int	primary key identity(1,1),
[Name] nvarchar (50),
Email nvarchar (50) unique,
Addres nvarchar (50),
Salary decimal,
CityId int foreign key references Cities(Id)
)

create table Countries(
Id int	primary key identity(1,1),
[Name] nvarchar (50),

)

create table Cities(
Id int	primary key identity(1,1),
[Name] nvarchar (50),
CountyId int foreign key references Countries(Id)
)

create table Groups(
Id int	primary key identity(1,1),
[Name] nvarchar (50),
EducationId int foreign key references Educations(Id),

)

create table GroupStudents(
Id int	primary key identity(1,1),
GroupId int foreign key references Groups(Id),
StudentId int foreign key references Students(Id),

)

create table GroupTeacher(
Id int	primary key identity(1,1),
GroupId int foreign key references Groups(Id),
TeacherId int foreign key references Teacher(Id),
)


create table StaffMembers (
Id int	primary key identity(1,1),
FullName nvarchar (50),
Salary decimal,
CityId int foreign key references Cities(Id),

)

create table Roles(
Id int	primary key identity(1,1),
[Name] nvarchar (50),

)

create table RoleMembers(
Id int	primary key identity(1,1),
RoleId int foreign key references Roles(Id),
StaffMemberId int foreign key references StaffMembers(Id),
)


create table WeekDays(
Id int	primary key identity(1,1),
[Name] nvarchar (50),

)

create table Seanses(
Id int	primary key identity(1,1),
[Name] nvarchar (50),
 
)

create table WeekDaySeans(
Id int	primary key identity(1,1),
WeekDayId int foreign key references WeekDays(Id),
SeansId int foreign key references Seanses(Id),
)

