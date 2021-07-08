-- !Seccion Aaron 

-- !Seccion Antonio

-- !Seccion Ferdinand
-- ? Creacion base de datos 
create database human_resources_control_system;

-- ? Creacion tabla managers
create table if not exists managers (
	id serial primary key not null unique, 
	employee_id int not null 
	
	constraint fk_employee
		foreign key (employee_id)
			references employees(id)
);

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
	departament_id int not null
	
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

