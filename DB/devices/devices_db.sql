create table devices (
    id serial primary key,
    name  varchar(255),
    price float
);

create table people (
    id serial primary key,
    name varchar(255)
);

create table devices_people (
    id serial primary key,
    device_id int references devices (id),
    people_id int references people (id)
);

insert into people(name) values ('Ivan');
insert into people(name) values ('Ilon');
insert into people(name) values ('Mark');
insert into people(name) values ('Alex');
insert into people(name) values ('Maria');

insert into devices(name, price) values ('Apple', 1500);
insert into devices(name, price) values ('Samsung', 1200);
insert into devices(name, price) values ('Honor', 500);
insert into devices(name, price) values ('Huawei', 700);
insert into devices(name, price) values ('Lg', 900);

insert into devices_people(device_id, people_id) values (1, 1), (1, 3), (1, 5);
insert into devices_people(device_id, people_id) values (2, 2), (2, 3), (2, 4);
insert into devices_people(device_id, people_id) values (3, 1), (3, 2), (3, 3);
insert into devices_people(device_id, people_id) values (4, 2), (4, 4), (4, 5);
insert into devices_people(device_id, people_id) values (5, 1), (5, 3), (5, 5);

select avg(price) from devices;

select p.name, avg(d.price)
from devices_people dp
join people p on dp.people_id = p.id
join devices d on dp.device_id = d.id
group by p.name;

select p.name, avg(d.price)
from devices_people dp
join people p on dp.people_id = p.id
join devices d on dp.device_id = d.id
group by p.name
having avg(d.price) > 1000;