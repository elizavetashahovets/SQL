-- 1. Создать таблицу employees - id. serial,  primary key, - employee_name. Varchar(50), not null
-- 2. Наполнить таблицу employee 70 строками.

create table employees (
	id serial primary key,
	employee_name Varchar(50) not null
);

select * from employees;

insert into employees(employee_name)
values ('name_1'),
		('name_2'),
		('name_3'),
		('name_4'),
		('name_5'),
		('name_6'),
		('name_7'),
		('name_8'),
		('name_9'),
		('name_10'),
		('name_11'),
		('name_12'),
		('name_13'),
		('name_14'),
		('name_15'),
		('name_16'),
		('name_17'),
		('name_18'),
		('name_19'),
		('name_20'),
		('name_21'),
		('name_22'),
		('name_23'),
		('name_24'),
		('name_25'),
		('name_26'),
		('name_27'),
		('name_28'),
		('name_29'),
		('name_30'),
		('name_31'),
		('name_32'),
		('name_33'),
		('name_34'),
		('name_35'),
		('name_36'),
		('name_37'),
		('name_38'),
		('name_39'),
		('name_40'),
		('name_41'),
		('name_42'),
		('name_43'),
		('name_44'),
		('name_45'),
		('name_46'),
		('name_47'),
		('name_48'),
		('name_49'),
		('name_50'),
		('name_51'),
		('name_52'),
		('name_53'),
		('name_54'),
		('name_55'),
		('name_56'),
		('name_57'),
		('name_58'),
		('name_59'),
		('name_60'),
		('name_61'),
		('name_62'),
		('name_63'),
		('name_64'),
		('name_65'),
		('name_66'),
		('name_67'),
		('name_68'),
		('name_69'),
		('name_70');
        
-- 3. Создать таблицу salary - id. Serial  primary key, - monthly_salary. Int, not null
-- 4. Наполнить таблицу salary 15 строками: - 1000 - 1100 - 1200 - 1300 - 1400 - 1500 - 1600 - 1700 - 1800 - 1900 - 2000 - 2100 - 2200 - 2300 - 2400 - 2500

create table salary (
	id serial primary key,
	monthly_salary int not null
);

select * from salary;

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
        
-- 5. Создать таблицу employee_salary - id. Serial  primary key, - employee_id. Int, not null, unique  - salary_id. Int, not null
-- 6. Наполнить таблицу employee_salary 40 строками: - в 10 строк из 40 вставить несуществующие employee_id        
	
create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id Int not null
);

select * from employee_salary

insert into employee_salary(employee_id, salary_id)
values (1, 3),
		(2, 2),
		(3, 6),
		(4, 10),
		(5, 7),
		(6, 3),
		(7, 5),
		(8, 4),
		(9, 5),
		(10, 7),
		(11, 12),
		(12, 6),
		(13, 5),
		(14, 9),
		(15, 12),
		(16, 5),
		(17, 4),
		(18, 9),
		(19,10),
		(20, 11),
		(21, 13),
		(22, 8),
		(23, 6),
		(24, 13),
		(25, 9),
		(26, 10),
		(27, 4),
		(28, 8),
		(29, 6),
		(30, 13),
		(71, 13),
		(72, 10),
		(73, 5),
		(74, 7),
		(75, 9),
		(76,12),
		(77, 1),
		(78, 2),
		(79, 7),
		(80, 8);
        
-- 7. Создать таблицу roles - id. Serial  primary key, - role_name. int, not null, unique
-- 8. Поменять тип столба role_name с int на varchar(30)
-- 9. Наполнить таблицу roles 20 строками:
	
create table roles (
	id serial primary key,
	role_name int not null unique
);

select * from roles

alter table roles alter column role_name type varchar(30);

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
        
-- 10. Создать таблицу roles_employee - id. Serial  primary key, - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id) - role_id. Int, not null (внешний ключ для таблицы roles, поле id)
-- 11. Наполнить таблицу roles_employee 40 строками:        
	
 create table roles_employee(
 id serial primary key,
 employee_id Int not null unique,
 role_id Int not null,
 foreign key(employee_id)
    references employees(id),
 foreign key(role_id)
    references roles(id)
 );

select * from roles_employee

insert into roles_employee(employee_id, role_id)
values (3,3),
       (5,1),
       (1,14),
       (54,12),
       (23,1),
       (68,13),
       (13,19),
       (2,14),
       (4,20),
       (7,2),
       (8,10),
       (59,3),
       (42,13),
       (64,7),
       (27,16),
       (29,3),
       (57,18),
       (58,12),
       (10,16),
       (12,5),
       (45,7),
       (46,14),
       (70,6),
       (32,8),
       (36,12),
       (31,1),
       (38,18),
       (67,14),
       (24,19),
       (39,5),
       (11,2),
       (43,1),
       (56,2),
       (37,3),
       (62,4),
       (61,5),
       (33,6),
       (66,7),
       (22,8),
       (44,9);





		


		
		


