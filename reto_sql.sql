-- !Seccion Aaron 

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
  hire_date date,
);
-- !Seccion Ferdinand 