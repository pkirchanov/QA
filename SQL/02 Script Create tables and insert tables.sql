--	1) Создать таблицу employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null

create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

select * from employees;

--  2)	Наполнить таблицу employee 70 строками.

insert into employees (employee_name)
values ('Kathy'),('Shawn'),('Sandra'),('Pauline'),('Patricia'),('Christopher'),('Edward'),('Judith'),('Jennifer'),('Julie'),('Shirley'),('Kathy'),('Brandon'),
('Dennis'),('Rene'),('Michael'),('Monica'),('Deborah'),('Gloria'),('Brian'),('Teresa'),('Stephanie'),('Lauren'),('Tracy'),('Virginia'),('Margaret'),('Thomas'),
('William'),('Pamela'),('Norman'),('Rosa'),('Kenneth'),('Charles'),('Karen'),('Edward'),('Cindy'),('Lois'),('Michelle'),('Harold'),('Connie'),('Travis'),
('Lillie'),('Phillip'),('Steven'),('Lori'),('Dawn'),('Philip'),('Chad'),('Peggy'),('Carol'),('Karen'),('Esther'),('Christine'),('Edward'),('Carol'),('Claude'),
('Paul'),('Anna'),('Michael'),('Carlos'),('Donald'),('Jenny'),('Juan'),('Diane'),('Carmen'),('Brett'),('Beverly'),('Larry'),('John'),
('Kimberly');

-- 3)	Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null

create table salary(
	id serial primary key,
	monthly_salary int not null
);

select * from salary;

-- 4)	Наполнить таблицу salary 15 строками::

insert into salary(monthly_salary)
values (1000),
 	   (1100),
	   (1200),
  	   (1300),
  	   (1400),
 	   (1500),
 	   (1600),
 	   (1700),
 	   (1800),
 	   (1900),
 	   (2000),
 	   (2100),
 	   (2200),
 	   (2300),
 	   (2400),
 	   (2500);
 	   
-- 5)	Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

drop table employee_salary;

select * from employee_salary;

-- 6)	Наполнить таблицу employee_salary 40 строками:
--  в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary (employee_id, salary_id)
values  (1, 2),   (2, 2),   (6, 6),   (7, 6),   (10, 7), 
		(11, 7),  (13, 1),  (14, 3),  (15, 3),  (16, 3),
		(19, 7),  (20, 7),  (21, 7),  (22, 7),  (23, 8),
		(24, 8),  (26, 4),  (27, 4),  (29, 8),  (30, 9),
		(31, 5),  (32, 10), (33, 11), (34, 14), (35, 13), 
		(36, 16), (37, 15), (38, 2),  (39, 7),  (40, 8),
		(71, 7),  (72, 39), (73, 37), (75, 36), (76, 35), 
		(77, 34), (74, 37), (78, 36), (79, 35), (80, 34);
		
-- 7)	Создать таблицу roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique

create table roles(
	id serial primary key,
	role_name int not null unique
);

select * from roles;

-- 8)	Поменять тип столба role_name с int на varchar(30)

alter table roles
alter column role_name type varchar(50) using role_name::varchar(50);

-- 9)	Наполнить таблицу roles 20 строками

insert into roles(role_name)
values ('Junior Python developer'),
	   ('Middle Python developer'),
	   ('Senior Python developer'),
	   ('Junior Java developer'),
	   ('Middle Java developer'),
	   ('Senior Java developer'),
	   ('Junior JavaScript developer'),
	   ('Middle JavaScript developer'),
	   ('Senior JavaScript developer'),
	   ('Junior Manual QA engineer'),
	   ('Middle Manual QA engineer'),
	   ('Senior Manual QA engineer'),
	   ('Project Manager'),
	   ('Designer'),
	   ('HR'),
	   ('CEO'),
	   ('Sales manager'),
	   ('Junior Automation QA engineer'),
	   ('Middle Automation QA engineer'),
	   ('Senior Automation QA engineer');

-- 10)	Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)


create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key(employee_id)
		references employees(id),
	foreign key(role_id)
		references roles(id)
);	  

select * from roles_employee;
	  
-- 11)	Наполнить таблицу roles_employee 40 строками:	  
	  
insert into roles_employee(employee_id, role_id)
values 	(1, 1),  (2, 1),   (3, 1),  (4, 1),
		(5, 1),  (6, 2),   (7, 2),  (8, 2),
		(9, 2),  (10, 3),  (11, 3), (12, 3),
		(14, 4), (15, 4),  (16, 4), (17, 4),
		(18, 4), (19, 5),  (20, 5), (21, 5),
		(22, 5), (23, 6),  (24, 6), (25, 6),
		(26, 7), (27, 7),  (28, 7), (29, 8),
		(30, 9), (13, 10), (31, 11),(32, 12),
		(33, 13),(34, 14), (35, 15),(36, 16),
		(37, 17), (38, 18),(39, 19),(40, 20);
	

		