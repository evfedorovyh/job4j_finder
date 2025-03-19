insert into products (name, producer, count, price)
VALUES ('product_1', 'producer_4', 3, 100);
insert into products (name, producer, count, price)
VALUES ('product_2', 'producer_4', 5, 100);
insert into products (name, producer, count, price)
VALUES ('product_3', 'producer_4', 13, 100);
insert into products (name, producer, count, price)
VALUES ('product_4', 'producer_4', 1, 100);
insert into products (name, producer, count, price)
VALUES ('product_5', 'producer_4', 2, 100);

--1
-- trigger STATEMENT AFTER INSERT
create or replace trigger tax_trigger_state
    after insert
    on products
    referencing new table as
                    inserted
    for each statement
    execute procedure tax_state();

-- trigger function STATEMENT AFTER INSERT (tax 20%)
create
or replace function tax_state()
    returns trigger as
$$
    BEGIN
        update products
        set price = price * 1.2
        where id = (select id from inserted);
        return new;
    END;
$$
LANGUAGE 'plpgsql';

--2
-- trigger ROW BEFORE INSERT
create or replace trigger tax_trigger_row
    before insert
    on products
    for each row
    execute procedure tax_row();

-- trigger function ROW BEFORE INSERT (tax 30%)
create
or replace function tax_row()
    returns trigger as
$$
    BEGIN
        new.price = new.price * 1.3;
        return NEW;
    END;
$$
LANGUAGE 'plpgsql';

--3
create table history_of_price
(
    id    serial primary key,
    name  varchar(50),
    price integer,
    date  timestamp
);

-- trigger ROW BEFORE INSERT
create trigger history_trigger
    after insert
    on products
    for each row
    execute procedure history();

-- trigger function ROW BEFORE INSERT (log into history_of_price)
create
or replace function history()
    returns trigger as
$$
    BEGIN
        insert into history_of_price (name, price, date)
        values (new.name, new.price, current_timestamp);
        return NEW;
    END;
$$
LANGUAGE 'plpgsql';