create table books(
    id serial primary key,
    name varchar(255),
    author_id int references authors(id)
);

create table ISBNs(
    id serial primary key,
    number int
);

create table books_ISBNs(
    id serial primary key,
    book_id int references books(id) unique,
    ISBN_id int references ISBNs(id) unique
);

insert into ISBNs(number) values ('159');
insert into ISBNs(number) values ('147');
insert into ISBNs(number) values ('695');

insert into books(name) values ('Learning Java');
insert into books(name) values ('Learning Phyton');
insert into books(name) values ('Learning HTML');

insert into books_ISBNs(book_id, ISBN_id) values (1, 1);
insert into books_ISBNs(book_id, ISBN_id) values (2, 2);
insert into books_ISBNs(book_id, ISBN_id) values (3, 3);