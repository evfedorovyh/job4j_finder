create trigger tax_trigger
    after insert
    on products
    referencing new table as
                    inserted
    for each statement
    execute procedure tax();

create
or replace function tax()
    returns trigger as
$$
    BEGIN
        update products
        set price = price - price * 0.2
        where id = (select id from inserted)
        and count <= 5;
        return new;
    END;
$$
LANGUAGE 'plpgsql';

insert into products (name, producer, count, price)
VALUES ('product_1', 'producer_4', 3, 50);
insert into products (name, producer, count, price)
VALUES ('product_2', 'producer_4', 5, 100);
insert into products (name, producer, count, price)
VALUES ('product_3', 'producer_4', 13, 100);
insert into products (name, producer, count, price)
VALUES ('product_4', 'producer_4', 1, 100);
insert into products (name, producer, count, price)
VALUES ('product_5', 'producer_4', 2, 100);

alter table products disable trigger tax_trigger;