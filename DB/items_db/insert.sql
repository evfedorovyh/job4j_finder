insert into users(name) values ('Ivan');
insert into users(name) values ('Mary');
insert into users(name) values ('Mark');


insert into roles(name, user_id) values ('Admin', 1);
insert into roles(name, user_id) values ('User', 2);
insert into roles(name, user_id) values ('User', 3);

insert into rules(name) values ('Create');
insert into rules(name) values ('Read');
insert into rules(name) values ('Update');
insert into rules(name) values ('Delete');

insert into roles_rules(role_id, rule_id) values (1, 1);
insert into roles_rules(role_id, rule_id) values (1, 2);
insert into roles_rules(role_id, rule_id) values (1, 3);
insert into roles_rules(role_id, rule_id) values (1, 4);
insert into roles_rules(role_id, rule_id) values (2, 2);
insert into roles_rules(role_id, rule_id) values (2, 3);

insert into categories(name) values ('High-priority');
insert into categories(name) values ('Middle-priority');
insert into categories(name) values ('Low-priority');

insert into states(name) values ('Created');
insert into states(name) values ('In_work');
insert into states(name) values ('Done');

insert into items(name, user_id, state_id, category_id) values ('item1', 1, 1, 1);
insert into items(name,user_id, state_id, category_id) values ('item2', 2, 2, 2);
insert into items(name,user_id, state_id, category_id) values ('item3', 3, 1, 2);
insert into items(name,user_id, state_id, category_id) values ('item4', 3, 3, 3);

insert into comments(name, item_id) values ('Well_done', 2);
insert into comments(name, item_id) values ('Waiting', 1);

insert into attachs(link, item_id) values ('.\images\pic1.jpg', 3);