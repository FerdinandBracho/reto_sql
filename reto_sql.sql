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
-- !Seccion Antonio
create table if not exists regions(
	id serial primary key not null,
	name varchar(20)
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