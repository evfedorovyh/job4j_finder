create table authors(
    id serial primary key,
    name varchar(255)
);

create table books(
    id serial primary key,
    name varchar(255),
    author_id int references authors(id)
);

insert into authors(name) values ('Bulgakov');
insert into books(name, author_id) values ('Master and Margarita', 1);

select * from books;

select * from authors where id in (select author_id from books);