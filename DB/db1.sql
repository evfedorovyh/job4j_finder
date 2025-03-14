create table users(
    id serial primary key,
    name varchar(255),
    email text,
    groupId integer
 );
insert into users(name, email, groupId) values('Ivan', 'ivan@gmail.com', 4);
insert into users(name, email, groupId) values('Sergey', 'sergey@gmail.com', 5);
update users set groupId = 3;
delete from users;
select * from users;