create table authors (
    id serial primary key,
    fullname text
);

create table songs (
    id serial primary key,
    name text,
    author_id int references authors(id)
);

insert into authors(fullname) values ('author1');
insert into authors(fullname) values ('author2');
insert into authors(fullname) values ('author3');

insert into songs(name, author_id) values ('Song1', 1);
insert into songs(name, author_id) values ('Song2', 1);
insert into songs(name, author_id) values ('Song3', 2);
insert into songs(name, author_id) values ('Song4', 3);
insert into songs(name, author_id) values ('Song5', 3);
insert into songs(name, author_id) values ('Song6', 1);

select a.fullname, s.name
from authors as a join songs as s on s.author_id = a.id;

select a.fullname Исполнитель, s.name Композиция
from authors as a join songs as s on s.author_id = a.id;

select a.fullname as "Имя исполнителя", s.name Композиция
from authors a join songs s on s.author_id = a.id;
