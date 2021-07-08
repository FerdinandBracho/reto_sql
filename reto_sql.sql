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

-- !Seccion Ferdinand 