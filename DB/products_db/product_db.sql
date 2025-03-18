create table product(
id serial primary key,
name varchar(255),
type_id int references type(id),
expired_date date,
price float
);

create table type(
id serial primary key,
name varchar(255)
);

insert into type(name) values ('СЫР');
insert into type(name) values ('МОЛОКО');
insert into type(name) values ('МЯСО');

insert into product(name, type_id, expired_date, price)
values ('Свинина', 3, current_date - interval '2 days', 500);
insert into product(name, type_id, expired_date, price)
values ('Говядина', 3, current_date + interval '10 days', 800);
insert into product(name, type_id, expired_date, price)
values ('Баранина', 3, current_date + interval '10 days', 1000);

insert into product(name, type_id, expired_date, price)
values ('Мороженое клубничное', 2, current_date - interval '1 days', 200);
insert into product(name, type_id, expired_date, price)
values ('Мороженое шоколадное', 2, current_date + interval '10 days', 150);
insert into product(name, type_id, expired_date, price)
values ('Мороженое пломбир', 2, current_date + interval '10 days', 210);
insert into product(name, type_id, expired_date, price)
values ('Молоко 2,5', 2, current_date + interval '10 days', 120);
insert into product(name, type_id, expired_date, price)
values ('Масло сливочное', 2, current_date + interval '10 days', 300);

insert into product(name, type_id, expired_date, price)
values ('Сыр моцарелла', 1, current_date + interval '10 days', 500);
insert into product(name, type_id, expired_date, price)
values ('Сыр российский', 1, current_date - interval '3 days', 200);
insert into product(name, type_id, expired_date, price)
values ('Сыр пармезан', 1, current_date + interval '10 days', 1000);

--1
select p.name Наименование, t.name Тип, p.expired_date as "Срок годности", p.price Цена
from product p
join type t on p.type_id = t.id
where t.name = 'СЫР';
--2
select p.name Наименование, t.name Тип, p.expired_date as "Срок годности", p.price Цена
from product p
join type t on p.type_id = t.id
where p.name ilike '%мороженое%';
--3
select p.name Наименование, t.name Тип, p.expired_date as "Срок годности", p.price Цена
from product p
join type t on p.type_id = t.id
where p.expired_date < current_date;
--4
select p.name Наименование, t.name Тип, p.expired_date as "Срок годности", p.price Цена
from product p
join type t on p.type_id = t.id
where p.price = (select max(price) from product);
--5
select t.name Тип, count(*) Количество
from product p
join type t on p.type_id = t.id
group by t.name;
--6
select p.name Наименование, t.name Тип, p.expired_date as "Срок годности", p.price Цена
from product p
join type t on p.type_id = t.id
where t.name like 'СЫР' or t.name like 'МОЛОКО';
--7
select t.name Тип, count(*) Количество
from product p
join type t on p.type_id = t.id
group by t.name
having count(*) < 10;
--8
select p.name Наименование, t.name Тип
from product p
join type t on p.type_id = t.id;



