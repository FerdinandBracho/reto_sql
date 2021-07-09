-- ! Creacion base de datos 
create database HR_Control;

-- ! Creacion de tablas 
create table if not exists jobs(
	id serial primary key not null,
	title varchar(50) not null,
	max_salary float not null,
	min_salary float not null
);

create  table if not exists employees(
	id serial primary key not null,
  	first_name varchar(50),
  	last_name varchar(50),
  	phone_number varchar(20),
	email varchar(100),
  	hire_date date
);

create table if not exists regions(
	id serial primary key not null,
	name varchar(20)
);

create table if not exists countries(
	id serial primary key not null,
	name varchar(25) not null unique,
	region_id int not null,
	foreign key (region_id) references regions(id)
);

create table if not exists locations(
	id serial primary key not null,
	city varchar (25) not null,
	state_province varchar (25) not null,
	street_address varchar (25) not null,
	postal_code int not null,
	country_id int not null,
	foreign key (country_id) references countries(id)
);

create table if not exists managers (
	id serial primary key not null unique, 
	employee_id int not null,
	
	constraint fk_employee
		foreign key (employee_id)
			references employees(id)
);

create table if not exists departments(
  id serial primary key not null,
  name varchar(50),
  manager_id int,
  location_id int,
  constraint fk_managers
		foreign key(manager_id) references managers(id),
  constraint fk_locations
    foreign key(location_id) references locations(id)
);

create table if not exists hirings ( 
	id serial primary key not null unique,
	employee_id int not null,
	start_date date not null,
	end_date date,
	job_id int not null,
	salary float not null,
	comission_pct float not null,
	manager_id int not null,
	department_id int not null,
	
	constraint fk_employee
		foreign key (employee_id)
			references employees(id),
		
	constraint fk_job 
		foreign key (job_id)
			references jobs(id),
		
	constraint fk_manager 
		foreign key (manager_id)
			references managers(id),
			
	constraint fk_department
		foreign key (department_id)
			references departments(id)
);

-- !Insercion de datos 
insert into regions(name)
values
	('North America'),
	('Europe'),
	('Asia'),
	('South America'),
	('Oceania');

insert into countries (name,region_id)
values ('China',1),('Thailand',2),('Brazil',3),('Indonesia',4),('Russia',5),('Mexico',1),('Portugal',2),('Spain',3),('Philippines',4),('United States',5);

insert into jobs (title,max_salary,min_salary)
values ('Research Associate',30000,15000),('Legal Assistant',15000,12000),('Research Assistant II',18000,15000),('Software Engineer III',25000,18000),('Financial Analyst',30000,20000),('Staff Accountant IV',25000,20000),('Librarian',13000,10000),('Desktop Support Technician',18000,14000),('Automation Specialist IV',30000,25000),('Account Coordinator',22000,17000);

insert into locations (city,state_province,street_address,postal_code,country_id)
values ('Fort Worth','Texas','1885 Comanche Park',76178,2),('Praia de Mira','Coimbra','9 New Castle Junction',3070725,3),('Mujães','Viana do Castelo','8166 Jay Plaza',4905515,4),('Champagnole','Franche-Comté','8675 Washington Way',39304 ,1),('El Calvario','Oaxaca','465 Merchant Alley',68213,5);

insert into employees(first_name,last_name,phone_number,email,hire_date)
values
	('Gilbertine', 'Goaley', '975-270-8218', 'ggoaley0@bing.com', '01/15/2021'),
	('Leonanie', 'Gildea', '446-383-6209', 'lgildea1@aboutads.info', '08/05/2020'),
	('Lyell', 'Ikins', '514-722-3305', 'likins2@pen.io', '04/22/2021'),
	('Baxter', 'Jervoise', '520-120-4295', 'bjervoise3@yellowbook.com', '12/03/2020'),
	('Lanni', 'Gilardengo', '548-824-1693', 'lgilardengo4@abc.net.au', '11/10/2020'),
	('Tiffi', 'Jatczak', '673-341-6555', 'tjatczak5@ucoz.ru', '04/16/2021'),
	('Yardley', 'Silversmid', '840-768-8816', 'ysilversmid6@ezinearticles.com', '11/28/2020'),
	('Patrizio', 'Sayers', '984-660-3650', 'psayers7@paginegialle.it', '01/13/2021'),
	('Godiva', 'Antley', '594-185-2663', 'gantley8@reference.com', '04/28/2021'),
	('Teddi', 'Trenbey', '166-884-6680', 'ttrenbey9@nyu.edu', '01/16/2021');
insert into employees(first_name,last_name,phone_number,email,hire_date)
values
	('Carlos', 'Santana', '975-270-3418', 'carlsantana0@bing.com', '04/23/2018')
returning id;
insert into managers (employee_id)
values 
  (3),
  (4),
  (8);

insert into departments(name,manager_id,location_id)
values
	('Legal',3,5),
	('Services',2,4),
	('Engineering',1,3),
	('Accounting',3,2),
	('Support',2,1),
	('Engineering',1,5),
	('Product Management',3,4),
	('Accounting',2,3),
	('Research and Development',1,2),
	('Legal',2,2);

insert into hirings (employee_id, start_date, end_date, job_id, salary, comission_pct, manager_id, department_id)
values 
	(1,'04/12/2020',NULL,8,17000,30,2,5),
	(2,'11/29/2020',NULL,7,15000,10,1,6),
	(3,'1/21/2021',NULL,7,13000,30,3,1),
	(4,'09/05/2019','9/16/2019',5,18000,40,1,2),
	(5,'03/10/2021',NULL,10,13000,10,2,7),
    (6,'04/12/2020',NULL,8,17000,30,2,5),
	(7,'11/29/2020',NULL,7,15000,10,1,6),
	(8,'1/21/2021',NULL,7,13000,30,3,1),
	(9,'09/05/2019','9/16/2019',5,18000,40,1,2),
	(10,'03/10/2021',NULL,10,13000,10,2,7);

-- !Actualizaciones de datos 
update hirings
set end_date = '07/08/2021'
where employee_id = 1;

insert into hirings (employee_id, start_date, end_date, job_id, salary, comission_pct, manager_id, department_id)
values (1, '07/08/2021', null, 1, 30000, 40, 3, 7);

update employees 
set first_name = 'nuevo_nombre',
	last_name = 'nuevo_apellido',
	email = 'nuevo-mail',
	phone_number = 'nuevo_num',
	hire_date = '01/01/2022'
where id = 10;

-- !Vistas 
select first_name, last_name from employees;

select * from employees
	left join hirings
		on employees.id = hirings.employee_id;
-- List of locations 
select 
	locations.id,
	city ,
	state_province ,
	street_address ,
	postal_code ,
	countries.name as country
from locations
inner join countries
	on countries.id = locations.country_id ;

-- List of locations per region
select
	locations.id,
	city ,
	state_province ,
	street_address ,
	postal_code ,
	countries.name as country,
	regions.name as region
from locations
inner join countries
	on countries.id = locations.country_id
inner join regions
	on regions.id = countries.region_id
order by regions.name;

-- Employee History
select 
	employees.id,
	first_name ,
	last_name ,
	hire_date ,
	start_date,
	end_date,
	jobs.title as job
from employees
inner join hirings
	on hirings.employee_id = employees.id
inner join jobs
	on jobs.id = hirings.job_id 
where employees.id = 4;

delete from locations
where id = 1;

-- List of departments per Location
select 
	departments.id,
	departments.name as department,
	city,
	state_province,
	street_address,
	postal_code,
	countries.name as country
from departments
inner join locations
	on locations.id = departments.location_id
inner join countries
	on countries.id = locations.country_id;

-- Responsabilities, List of Employees per manager
select 
	manager_emp.first_name as manager_name,
	manager_emp.last_name as manager_last_name,
	man.employee_name,
	man.employee_last_name
from (select 
	e.first_name as employee_name,
	e.last_name as employee_last_name,
	m.employee_id 
from hirings
inner join employees e
	on e.id = hirings.employee_id 
inner join managers m 
	on m.id = hirings.manager_id 
where hirings.end_date is null) as man
inner join employees manager_emp
	on manager_emp.id = man.employee_id
order by manager_emp.first_name ;

--List all employees of a location
select first_name as "FIRST NAME",last_name as "LAST NAME",locations.city as "CITY" ,state_province as "STATE",street_address as "STREET",postal_code as "ZIP",countries.name as "COUNTRY",regions.name as "REGION"  
from employees 
left join hirings on employees.id = hirings.employee_id
inner join departments on hirings.departament_id = departments.id
inner join locations on departments.location_id = locations.id
inner join countries on locations.country_id = countries.id 
inner join regions on countries.region_id  = regions.id 
where locations.city = 'El Calvario'
order by first_name; 
	
--List all employees in a department	
select first_name as "FIRST NAME",last_name as "LAST NAME", departments."name" as "DEPARTMENT" 
from employees 
left join hirings on employees.id = hirings.employee_id
inner join departments on hirings.departament_id = departments.id
where departments."name" = 'Engineering'
order by first_name;

--all employees by position
select first_name as "FIRST NAME",last_name as "LAST NAME",jobs.title as "JOB TITLE" 
from employees
left join hirings on employees.id = hirings.employee_id 
inner join jobs on hirings.job_id  = jobs.id 
order by first_name,jobs.title; 

--Displays the details of a job	
select title as "JOB TITLE",max_salary as "MAX SALARY",min_salary as "MIN SALARY" 
from jobs where title='Software Engineer III' order by title, max_salary;  

-- Muestra los detalles de un departamento (supervisior, empleados, ubicacion)
select 
        distinct departments.name, 
        employees.first_name as "manager",
        locations.city,
        count(hirings.employee_id) as "# employees"
from departments
        inner join managers 
                on departments.manager_id = managers.id
        left join employees
                on managers.employee_id = employees.id
        left join locations 
                on departments.location_id = locations.id
        left join hirings
                on departments.id = hirings.department_id 
where employees.id in (select managers.employee_id)
group by departments.name, employees.first_name, locations.city;

-- Muestra los empleados que trabajan para un supervisor
select 
        manager_emp.first_name as manager_name,
        man.employee_name
from (select 
        e.first_name as employee_name,
        e.last_name as employee_last_name,
        m.employee_id 
from hirings
inner join employees e
        on e.id = hirings.employee_id 
inner join managers m 
        on m.id = hirings.manager_id ) as man
inner join employees manager_emp
        on manager_emp.id = man.employee_id
order by manager_emp.first_name ;
