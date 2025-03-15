create table books(
    id serial primary key,
    name varchar(255),
    author_id int references authors(id)
);

create table reductions(
    id serial primary key,
    name varchar(255)
);

create table books_reductions(
    id serial primary key,
    book_id int references books(id),
    reduction_id int references reductions(id)
);

insert into reductions(name) values ('reduction1');
insert into reductions(name) values ('reduction2');
insert into reductions(name) values ('reduction3');

insert into books(name) values ('Learning Java');
insert into books(name) values ('Learning Phyton');
insert into books(name) values ('Learning HTML');

insert into books_reductions(book_id, reduction_id) values (8, 1);
insert into books_reductions(book_id, reduction_id) values (8, 2);
insert into books_reductions(book_id, reduction_id) values (9, 1);
insert into books_reductions(book_id, reduction_id) values (9, 2);
insert into books_reductions(book_id, reduction_id) values (9, 3);
insert into books_reductions(book_id, reduction_id) values (10, 1);