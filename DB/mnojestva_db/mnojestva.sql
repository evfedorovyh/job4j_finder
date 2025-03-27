create TABLE movie
(
    id       SERIAL PRIMARY KEY,
    name     text,
    director text
);

create TABLE book
(
    id     SERIAL PRIMARY KEY,
    title  text,
    author text
);

insert into movie (name, director)
values ('Марсианин', 'Ридли Скотт'),
       ('Матрица', 'Братья Вачовски'),
       ('Властелин колец', 'Питер Джексон'),
       ('Гарри Поттер и узник Азкабана', 'Альфонсо Куарон'),
       ('Железный человек', 'Джон Фавро');

insert into book (title, author)
values ('Гарри Поттер и узник Азкабана', 'Джоан Роулинг'),
       ('Властелин колец', 'Джон Толкин'),
       ('1984', 'Джордж Оруэлл'),
       ('Марсианин', 'Энди Уир'),
       ('Божественная комедия', 'Данте Алигьери');

--1 выведите названия всех фильмов, которые сняты по книге;
select name from movie
intersect
select title from book;

--2 выведите все названия книг, у которых нет экранизации;
select title from book
except
select name from movie;

--3 выведите все уникальные названия произведений из таблиц movie и book
--(т.е фильмы, которые сняты не по книге, и книги без экранизации)
select title from book
union all
select name from movie
except
select title from book
intersect
select name from movie;

