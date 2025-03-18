create table car_bodies(
id serial primary key,
name  varchar(255)
);

create table car_engines(
id serial primary key,
name  varchar(255)
);

create table car_transmissions(
id serial primary key,
name  varchar(255)
);

create table cars(
id serial primary key,
name  varchar(255),
body_id int references car_bodies(id),
engine_id int references car_engines(id),
transmission_id int references car_transmissions(id)
);

insert into car_bodies(name) values ('седан'), ('хетчбек'), ('универсал');
insert into car_engines(name) values ('бензин'), ('дизель'), ('газ');
insert into car_transmissions(name) values ('ручная'), ('автомат'), ('робот');
insert into cars(name, body_id, engine_id, transmission_id) values ('car1', 1, 1, 1);
insert into cars(name, body_id, engine_id, transmission_id) values ('car2', 1, 1, 2);
insert into cars(name, body_id, engine_id, transmission_id) values ('car3', 1, 2, 1);
insert into cars(name, body_id, engine_id, transmission_id) values ('car4', 2, 1, 1);
insert into cars(name, body_id, engine_id, transmission_id) values ('car5', 2, 1, 2);
insert into cars(name, body_id, engine_id, transmission_id) values ('car6', 2, 2, 1);
insert into cars(name, body_id, transmission_id) values ('car7', 1, 1);
insert into cars(name, body_id, engine_id) values ('car8', 2, 2);

--1
select c.id id, c.name car_name, b.name body_name, e.name engine_name, t.name transmission_name
from cars c
left join car_bodies b on c.body_id = b.id
left join car_engines e on c.engine_id = e.id
left join car_transmissions t on c.transmission_id = t.id

--2
select b.id, b.name from car_bodies b
left join cars c on c.body_id = b.id
where c.body_id is null

--3
select e.id, e.name from car_engines e
left join cars c on c.engine_id = e.id
where c.engine_id is null

--4
select t.id, t.name from car_transmissions t
left join cars c on c.transmission_id = t.id
where c.transmission_id is null


