create database fruit;
\l
\c fruit

drop table if exists fruits;
create table fruits (
  id serial primary key,
  name text,
  color text,
  price int
);

create database car;
\c car
drop table if exists cars;
create table cars (
  id serial primary key,
  brand text,
  model text,
  year int,
  price int
);

alter table cars
add column color text;
alter table cars
rename column price to cost;
alter table cars
drop column year;

-- table nomini ozfartirish
alter table cars
rename to vehicles;
\dt

--  Addd 
insert into vehicles (brand, model, cost, color)
values ('bmw', 'x5', 30000, 'black');
select * from vehicles;
--  update 
update vehicles
set cost = 32000
where id = 1;


-- delete

delete from vehicles
where id = 1;
