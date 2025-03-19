create table products
(
    id       serial primary key,
    name     varchar(50),
    producer varchar(50),
    count    integer default 0,
    price    integer
);

insert into products (name, producer, count, price)
VALUES ('product_1', 'producer_1', 3, 50);
insert into products (name, producer, count, price)
VALUES ('product_2', 'producer_2', 0, 50);
insert into products (name, producer, count, price)
VALUES ('product_3', 'producer_3', 0, 50);

--1 PROCEDURE (удаляем все строки, где производитель = параметр1;
-- удаляем все строки, где id = параметр2)
create or replace procedure delete_data(u_producer varchar(50), u_id integer)
language 'plpgsql'
as $$
    BEGIN
        if u_producer like '%' THEN
            delete from products
            where producer like u_producer;
        end if;
        if u_id != 0 THEN
            delete from products
            where id = u_id;
        end if;
    END;
$$;

call delete_data('producer_2', 3);

--2 FUNCTION (удаляем все строки, где количество товара = параметр1)
create or replace function f_delete_data(u_count integer)
returns integer
language 'plpgsql'
as
$$
    declare
        result integer;
    begin
    delete from products
        where count = u_count;
    select into result sum(price)
    from products;
    return result;
    end;
$$;

select f_delete_data(0);