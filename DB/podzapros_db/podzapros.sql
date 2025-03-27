CREATE TABLE customers
(
    id         serial primary key,
    first_name text,
    last_name  text,
    age        int,
    country    text
);

INSERT INTO customers(first_name, last_name, age, country) VALUES
('Иван', 'Сидоров', 28, 'Россия'),
('Мария', 'Иванова', 35, 'Америка'),
('Сергей', 'Орлов', 41, 'Франция'),
('Андрей', 'Соколов', 28, 'Германия'),
('Анна', 'Петрова', 54, 'Литва');

--1
SELECT *
FROM customers
WHERE age = (SELECT MIN(age) FROM customers);

CREATE TABLE orders
(
    id          serial primary key,
    amount      int,
    customer_id int references customers (id)
);

INSERT INTO orders(amount, customer_id) VALUES
(1500, 1),
(2500, 3),
(3500, 2),
(4500, 3),
(5500, 2),
(6500, 1);

--2
SELECT *
FROM customers
WHERE id NOT IN (SELECT customer_id FROM orders);
