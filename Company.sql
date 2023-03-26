create database Company

use Company


create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null
)
create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null,
[CountryId] int foreign key references Countries(Id)
)

select * from Countries


create table Employees(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null,
[Surname] nvarchar(50),
[Age] int,
[Salary] decimal,
[Position] nvarchar(50),
[IsDeleted] bit,
[CityId] int foreign key references Cities(Id)
)

insert into Countries([Name])
values ('Azerbaycan'),
       ('Turkiye'),
	   ('Germany'),
	   ('Spain'),
	   ('England')

insert into Cities([Name])
values ('Baku'),
       ('Gence'),
	   ('Berlin'),
	   ('Madrid'),
	   ('London')





insert into Employees([Name],[Surname],[Age],[Salary],[Position], [CityId] )
values('Cahandar','Velibeyli',27,4000,'Director'),
       ('Ismayil','Yusifov',27,3500,'Assistant'),
	   ('Ali','Aliyev',22,2700,'Manager'),
	   ('Ceyhun','Celilzade',26,1700,'Marketing officer'),
	   ('Elcin','Eliyev',21,2000,'Reception'),
	   ('Arzu','Axundova',30,1500,'Reception')
	   

select * from Employees
	   
--1)Ishcilerin ozlerini, yashadiqi sheherlerini ve olkelerini gosterin.

select em.Name,em.Surname,ct.Name,co.Name from Employees em
inner join Cities ct
on em.CityId = ct.Id
inner join Countries co
on co.Id = ct.CountryId

--2)Maashi 2000-den yuxari olan ishcilerin adlari ve yashadiqi olkeleri gosterin.

select em.Name,co.Name from Employees em 
inner join Cities ct
on em.CityId = ct.Id
inner join Countries co
on co.Id = ct.CountryId
where em.Salary > 2000

--3)Hansi sheherin hansi olkeye aid olduqunu gosterin.

select co.Name,ct.Name from Countries co
inner join Cities ct
on co.Id = ct.CountryId

--4)Positioni "Reseption" olan ishcilerin table-larin id-leri daxil olmamaq sherti ile  butun melumatlarini gostermek.


select em.Name,em.Surname,em.Age,em.Salary,em.Position,ct.Name,co.Name from Employees em
inner join Cities ct
on ct.Id = em.CityId
inner join Countries co
on co.Id = ct.CountryId
where em.Position = 'Reception'


--5)Ishden cixan ishcilerin yashadiqi sheher ve olkeleri, hemcinin ishcilerin oz ad ve soyadlarini gosteren query yazin.

select em.Name,em.Surname,ct.Name,co.Name from Employees em
inner join Cities ct
on ct.Id = em.CityId
inner join Countries co
on co.Id = ct.CountryId
where em.IsDeleted = 'True'

