create table departments
(
    id   serial primary key,
    name varchar(255)
);

create table employees
(
    id       serial primary key,
    name     varchar(255),
    department_id int references departments (id)
);

insert into departments(name)
values ('Department 1');
insert into departments(name)
values ('Department 2');
insert into departments(name)
values ('Department 3');
insert into departments(name)
values ('Department 4');

insert into employees(name, department_id)
values ('Employee 1', 1);
insert into employees(name, department_id)
values ('Employee 2', 2);
insert into employees(name, department_id)
values ('Employee 3', 3);
insert into employees(name, department_id)
values ('Employee 4', null);
insert into employees(name, department_id)
values ('Employee 5', null);
insert into employees(name, department_id)
values ('Employee 6', 1);

--2
select * from employees e
left join departments d on e.department_id = d.id;

select * from employees e
right join departments d on e.department_id = d.id;

select * from employees e
full join departments d on e.department_id = d.id;

select * from employees
cross join departments;

--3
select * from departments d
left join employees e on e.department_id = d.id
where e.id is null;

--4
select e.id, e.name, e.department_id, d.id, d.name from employees e
left join departments d on e.department_id = d.id;
select e.id, e.name, e.department_id, d.id, d.name from departments d
right join employees e on e.department_id = d.id;

--5
create table teens(
    id   serial primary key,
    name varchar(255),
    gender char
);

insert into teens(name, gender) values ('Маша', 'Ж');
insert into teens(name, gender) values ('Даша', 'Ж');
insert into teens(name, gender) values ('Катя', 'Ж');
insert into teens(name, gender) values ('Миша', 'М');
insert into teens(name, gender) values ('Ваня', 'М');
insert into teens(name, gender) values ('Саша', 'М');

select t1.gender as Мальчик, t2.gender as Девочка, (t1.name ||'-'|| t2.name) as "Пара="
	from teens t1 cross join teens t2
		 where t1.gender = 'М' and t2.gender = 'Ж';