create table students (
    id   serial primary key,
    name varchar(50)
);

insert into students (name)
values ('Иван Иванов');
insert into students (name)
values ('Петр Петров');
insert into students (name)
values ('Мария Петрова');
insert into students (name)
values ('Илья Сидоров');

create table authors (
    id   serial primary key,
    name varchar(50)
);

insert into authors (name)
values ('Александр Пушкин');
insert into authors (name)
values ('Николай Гоголь');

create table books(
    id serial primary key,
    name varchar(200),
    author_id integer references authors (id)
);

insert into books (name, author_id)
values ('Евгений Онегин', 1);
insert into books (name, author_id)
values ('Капитанская дочка', 1);
insert into books (name, author_id)
values ('Дубровский', 1);
insert into books (name, author_id)
values ('Мертвые души', 2);
insert into books (name, author_id)
values ('Вий', 2);

create table orders (
    id serial primary key,
    active boolean default true,
    book_id integer references books (id),
    student_id integer references students (id)
);

insert into orders (book_id, student_id)
values (1, 1), (2, 1), (4, 1);
insert into orders (book_id, student_id)
values (5, 2), (1, 2), (2, 2);
insert into orders (book_id, student_id)
values (1, 3), (4, 3), (5, 3);
insert into orders (book_id, student_id)
values (1, 4), (2, 4), (3, 4), (4, 4), (5, 4);

create view show_books_if_amount_by_one_student_more_2_ordered_by_desc
as
select b.name as book, a.name as author, count(s.name)
from books as b
		 join orders o on o.book_id = b.id
         join students s on o.student_id = s.id
         join authors a on b.author_id = a.id
group by (b.name, a.name)
having count(a.name) >= 2
order by count(s.name) desc;