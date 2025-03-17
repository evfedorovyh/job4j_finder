create table fauna (
    id             serial primary key,
    name           text,
    avg_age        int,
    discovery_date date
);

insert into fauna(name, avg_age, discovery_date)
values ('Слон (mammal)', 23000, '1758-01-01');
insert into fauna(name, avg_age, discovery_date)
values ('Лев (mammal)', 4000, null);
insert into fauna(name, avg_age, discovery_date)
values ('Тигр (mammal)', 6000, '1958-01-01');
insert into fauna(name, avg_age, discovery_date)
values ('Волк (mammal)', 4500, '1908-01-01');

insert into fauna(name, avg_age, discovery_date)
values ('Филин (bird)', 15000, '1788-01-01');
insert into fauna(name, avg_age, discovery_date)
values ('Сокол (bird)', 12000, null);
insert into fauna(name, avg_age, discovery_date)
values ('Попугай_ара (bird)', 20000, '1911-01-01');
insert into fauna(name, avg_age, discovery_date)
values ('Утка (bird)', 5500, '1961-01-01');

insert into fauna(name, avg_age, discovery_date)
values ('Карп (fish)', 18500, '1861-01-01');
insert into fauna(name, avg_age, discovery_date)
values ('Щука (fish)', 16500, null);
insert into fauna(name, avg_age, discovery_date)
values ('Сом (fish)', 25500, '1901-01-01');
insert into fauna(name, avg_age, discovery_date)
values ('Сельдь (fish)', 2500, '1973-01-01');


select * from fauna where name like '%fish%';
select * from fauna where avg_age >= 10000 and avg_age <= 21000;
select * from fauna where discovery_date is null;
select * from fauna where discovery_date < '1950-01-01';

