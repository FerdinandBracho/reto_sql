-- ? Creacion base de datos 
create database human_resources_control_system;

-- !Seccion Aaron 
create table if not exists countries(
	id serial primary key not null,
	name varchar(25) not null,
	region_id int not null
	foreign key region_id references regions(id)
);

create table if not exists jobs(
	id serial primary key not null,
	title varchar(25) not null,
	max_salary float not null,
	min_salary float not null

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

--FORMULARIOS (INSERTS)

insert into countries (name,region_id)
values ('China',1),('Thailand',2),('Brazil',3),('Indonesia',4),('Russia',5),('Mexico',1),('Portugal',2),('Spain',3),('Philippines',4),('United States',5);

insert into jobs (title,max_salary,min_salary)
values ('Research Associate',30000,15000),('Legal Assistant',15000,12000),('Research Assistant II',18000,15000),('Software Engineer III',25000,18000),('Financial Analyst',30000,20000),('Staff Accountant IV',25000,20000),('Librarian',13000,10000),('Desktop Support Technician',18000,14000),('Automation Specialist IV',30000,25000),('Account Coordinator',22000,17000);

insert into locations (city,state_province,street_address,postal_code,country_id)
values ('Fort Worth','Texas','1885 Comanche Park',76178,2),('Praia de Mira','Coimbra','9 New Castle Junction',3070725,3),('Mujães','Viana do Castelo','8166 Jay Plaza',4905515,4),('Champagnole','Franche-Comté','8675 Washington Way',39304 ,1),('El Calvario','Oaxaca','465 Merchant Alley',68213,5);


-- !Seccion Antonio
create table if not exists regions(
	id serial primary key not null,
	name varchar(10)
);

create table if not exists departments(
  id serial primary key not null,
  name varchar(50),
  manager_id int,
  location_id int,
  constraint fk_managers
		foreign key(manager_id) references managers(id)
  constraint fk_locations
    foreign key(location_id) references locations(id)
);
create  table if not exists employees(
	id serial primary key not null,
  	first_name varchar(50),
  	last_name varchar(50),
  	phone_number varchar(20),
	email varchar(100),
  	hire_date date
);
insert into regions(name)
values
	('North America'),
	('Europe'),
	('Asia'),
	('South America'),
	('Oceania');

-- !Seccion Ferdinand 

-- ? Creacion tabla managers
create table if not exists managers (
	id serial primary key not null unique, 
	employee_id int not null,
	
	constraint fk_employee
		foreign key (employee_id)
			references employees(id)
);

    -- ?Carga de datos en tabla managers
    insert into managers (employee_id)
    values 
        (3),
        (4),
        (8)

-- ? Creacion tabla hirings
create table if not exists hirings ( 
	id serial primary key not null unique,
	employee_id int not null,
	start_date date not null,
	end_date date not null,
	job_id int not null,
	salary float not null,
	comission_pct float not null,
	manager_id int not null,
	departament_id int not null,
	
	constraint fk_employee
		foreign key (employee_id)
			references employees(id),
		
	constraint fk_job 
		foreign key (job_id)
			references jobs(id),
		
	constraint fk_manager 
		foreign key (manager_id)
			references managers(id),
			
	constraint fk_departament
		foreign key (departament_id)
			references departaments(id)
);