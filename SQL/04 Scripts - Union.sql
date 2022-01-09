-- Создаем таблицу (1) для фабрик

create table factories(
 id serial primary key,
 factory_title varchar(50)
);

-- Заполняем таблицу для фабрик

insert into factories(factory_title)
values ('Hanwai'),
    ('Kenling'),
    ('Dongguan'),
    ('Abis'),
    ('Foxconn');
        
-- Создаем таблицу (2) для мобильных телефонов
 
 create table mobile_phones(
 id serial primary key,
 brand_id int,
 product_model varchar(40),
 price int,
 factory_id int
);

-- Заполняем таблицу для мобильных телефонов

insert into mobile_phones(brand_id, product_model, price, factory_id)
values (2, 'iphone_X', 600, 5),
    (2, 'iphone_11', 700, 4),
    (1, 'A51', 400, 1),
    (3, 'P40', 600, 5),
    (1, 's21', 1500, 5),
    (3, 'H200', 300, 3),
    (2, 'iphone_12', 1000, 5),
    (3, 'Q15', 400, 2),
    (1, 'P50', 900, 1),
    (2, 'iphone_13', 1800, 4),
    (1, 'S22', 1300, 3),
    (1, 'A31', 200, 5);

-- Создаем таблицу (3) для мониторов 

create table monitors(
 id serial primary key,
 brand_id int,
 product_model varchar(40),
 price int,
 factory_id int
);

-- Заполняем таблицу для мониторов

insert into monitors(brand_id, product_model, price, factory_id)
values (2, 'P300', 100, 1),
    (2, 'A320', 200, 3),
    (1, 'NV1000_Ultra', 450, 5),
    (3, 'P400_super_Amolet', 240, 3),
    (1, 'AV_1000', 400, 4),
    (3, 'UKV_100', 900, 2),
    (2, 'KV-200', 2000, 2),
    (3, 'IPS_1980', 550, 1),
    (1, 'IPS_4k', 630, 4),
    (2, 'IPS_8k_1c', 1200, 3),
    (1, 'TFTN_1500', 1300, 2),
    (1, 'BioPixel_2', 12000, 5);

-- Создаем таблицу (4) для скутеров

create table scooters(
 id serial primary key,
 brand_id int,
 product_model varchar(40),
 price int,
 factory_id int
);

-- Заполняем таблицу для скутеров

insert into scooters(brand_id, product_model, price, factory_id)
values (2, 'A-P300', 2000, 2),
    (2, 'B-A320', 280, 4),
    (1, 'C-NV1000_Ultra', 650, 1),
    (3, 'D_P400_super_Amolet', 2400, 2),
    (1, 'E-AV_1000', 1100, 5),
    (3, 'F-UKV_100', 2300, 3),
    (2, 'G-KV-200', 200, 1),
    (3, 'H-IPS_1980', 530, 4),
    (1, 'I-IPS_4k', 6300, 2),
    (2, 'J-IPS_8k_1c', 120, 1),
    (1, 'K-TFTN_1500', 130, 5),
    (1, 'O-BioPixel_2', 1200, 3);
   
-- Создаем таблицу (5) для заказов   

create table orders(
 id serial primary key,
 brand_id int,
 product_model varchar(40),
 price int,
 pcs int
);

-- Заполняем таблицу для заказов

insert into orders(brand_id, product_model, price, pcs)
values (2, 'iphone_13', 1800, 1),
    (2, 'B-A320', 280, 2),
    (1, 'IPS_4k', 630, 1)
    
-- Создаем таблицу (6) для брэндов

   create table brands(
 id serial primary key,
 brand_title varchar(50)
);

-- Заполняем таблицу для брэндов

insert into brands(brand_title)
values ('Samsung'),
    ('Apple'),
    ('Huawei'),
    ('HP'),
    ('Koogu');
    
-- Создаем таблицу (7) для айфонов
   
create table phones_apple(
 id serial primary key,
 model varchar(40),
 ram int not null,
 front_camera int,
 price int
);

-- Заполняем таблицу для айфонов

insert into phones_apple(model, ram, front_camera, price)
values ('X', 4, 8, 400),
    ('11', 6, 10, 700),
    ('12', 8, 12, 1000),
    ('7', 4, 12, 400),
    ('XR', 6, 12, 800),
    ('XS', 6, 12, 1000),
    ('13', 6, 12, 1500),
    ('8', 4, 12, 700),
    ('SE 2020', 6, 8, 700);
       
-- Создаем таблицу (8) для телефонов Самсунг
      
create table phones_samsung(
 id serial primary key,
 model varchar(40),
 ram int not null,
 front_camera int,
 price int
);

-- Заполняем таблицу для телефонов Самсунг

insert into phones_samsung(model, ram, front_camera, price)
values ('A50', 6, 10, 300),
    ('A50', 8, 10, 400),
    ('A52', 8, 16, 500),
    ('S20', 8, 24, 1500),
    ('S21', 8, 12, 1000),
    ('S22', 6, 12, 1200),
    ('A71', 6, 12, 1200),
    ('A91', 4, 12, 1900),
    ('A57', 8, 8, 900),
    ('A32', 8, 4, 800),
    ('A33', 8, 5, 750),
    ('A43', 8, 5, 850);
 
       select * from phones_samsung ;
       
-- Создаем таблицу (9) для заказов айфонов
      
create table apple_orders(
 id serial primary key,
 phone_id int
);

-- Заполняем таблицу для заказов айфонов

insert into apple_orders(phone_id)
values (3),
    (9),
    (5),
    (1),
    (4);
    
-- Создаем таблицу (10) для заказов Самсунг
   
create table samsung_orders(
 id serial primary key,
 phone_id int
);

-- Заполняем таблицу для заказов Самсунг



-- Юнион

select * from monitors
union all
select * from scooters;

-- Соединение колонок с разным типом данных - int и varchar

select cast(brand_id as varchar), price from scooters
union all
select product_model, factory_id from monitors;

-- Соединение таблиц с разным количеством колонок

select id, cast(brand_id as varchar), product_model, price, factory_id from mobile_phones
union all
select id, null, brand_title, null, null from brands;

--  Подзапросы

select * from phones_apple
where price < (select avg(price) from phones_samsung);

-- IN + подзапрос

select * from phones_samsung
where price in(select price from phones_samsung where price < 800);

-- Вывести значение меньше меньшего (450) из списка (список всех телефонов стоимостью меньше 1000)

select * from phones_samsung
where price < all(select price from phones_apple where price < 1000);

--select price from phones_apple where price < 1000;

-- Вывести значения Меньше большего (800) из списка (список всех телефонов стоимостью меньше 1000)  

select * from phones_samsung
where price < any(select price from phones_apple where price < 1000);

--  = any - то же что in, условием будут все значения находящиеся в списке

select * from phones_samsung
where price = any(select price from phones_apple where price < 1000);

-- = all работает как and - выводит только одно значение, либо не выводит ничего.

select * from phones_samsung
where price = all(select price from phones_apple where price < 1000);

-- <>  работает как ИЛИ 

select * from phones_samsung
where price <> any(select price from phones_apple where price > 1000);

select price from phones_apple where price > 1000;