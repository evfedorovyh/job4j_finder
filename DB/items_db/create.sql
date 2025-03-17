create table users (
    id serial primary key,
    name text
);

create table roles (
    id serial primary key,
    name text,
    user_id int references users(id)
);

create table rules (
    id serial primary key,
    name text
);

create table roles_rules (
    id serial primary key,
    role_id int references roles(id),
    rule_id int references rules(id)
);

create table states (
    id serial primary key,
    name text
);

create table categories (
    id serial primary key,
    name text
);

create table items (
    id serial primary key,
    name text,
    user_id int references users(id),
    state_id int references states(id),
    category_id int references categories(id)
);

create table comments (
    id serial primary key,
    name text,
    item_id int references items(id)
);

create table attachs (
    id serial primary key,
    link text,
    item_id int references items(id)
);