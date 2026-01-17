--  1 - dars
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




-- --------------2 dars----------------------

-- create ------ 

drop database if exists school_db;
create database school_db;
\c school_db
-- ----------------------------
drop table if exists talabalar;

create table talabalar (
  student_id serial primary key,
  full_name text,
  age int,
  city text,
  grade int,
  birth_date date,
  course_id int
);

drop table if exists kurslar;

create table kurslar (
  course_id serial primary key,
  course_name text
);

drop table if exists oqituvchilar;

create table oqituvchilar (
  teacher_id serial primary key,
  full_name text,
  city text
);


-- -----Indexing----

create index idx_student_id
on talabalar(student_id);

create index idx_teacher_id
on oqituvchilar(teacher_id);

-- add info -----

insert into kurslar (course_name) values
('backend'),
('frontend'),
('database');


-- -----------------------------

insert into talabalar (full_name, age, city, grade, birth_date, course_id) values
('shoxrux', 20, 'toshkent', 85, '2004-05-12', 1),
('sardor', 22, 'samarqand', 90, '2003-03-10', 2),
('shahlo', 19, 'xorazm', 75, '2005-01-01', 1),
('ali', 24, 'toshkent', 88, '2002-09-09', 3),
('shoira', 21, 'buxoro', 92, '2003-07-07', 2);

--  ------------------------------------------

insert into oqituvchilar (full_name, city) values
('rasul', 'toshkent'),
('rustam', 'samarqand'),
('jamshid', 'xorazm');


-- --- Order by------

select * from talabalar
order by grade desc;


select * from talabalar
order by grade asc;


-- ------Offset va  limit -----

select * from talabalar
offset 4
limit 10;

-- ------- Group by ------

select city, count(*) as student_count
from talabalar
group by city;


-- -------- As----

select birth_date as tugilgan_sana
from talabalar;


-- -----Union-----

select full_name from talabalar where course_id = 1
union
select full_name from talabalar where course_id = 2;

-- -------- Having----

select course_id, avg(grade) as avg_grade
from talabalar
group by course_id
having avg(grade) > 80;



-- ------ Betwween ,, and  Or -----

select * from talabalar
where grade between 70 and 90
or city = 'toshkent';


-- ------ like, ilike--------

select * from talabalar
where full_name ilike 'sh%'
or full_name ilike '%sh';

-- --------union + as------

select city, 'talaba' as shaxs_turi
from talabalar
union
select city, 'oqituvchi' as shaxs_turi
from oqituvchilar;
