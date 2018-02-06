Homework-2

Links:

Q1. 	http://sqlfiddle.com/#!15/245d21

INSERT INTO HotelStays(roomNum, arrDate, depDate, guestName) VALUES (123, to_date('20160204', 'YYYYMMDD'), to_date('20160208','YYYYMMDD'), 'B');

INSERT INTO HotelStays(roomNum, arrDate, depDate, guestName) VALUES (201, to_date('20160210', 'YYYYMMDD'), to_date('20160206','YYYYMMDD'), 'C'); 

Q2.	http://sqlfiddle.com/#!9/449b70/3

Q3.	http://sqlfiddle.com/#!7/e4dd5/4

Q4.	http://sqlfiddle.com/#!15/e6733/2

Q5. 	http://sqlfiddle.com/#!7/98528/1

	http://sqlfiddle.com/#!7/98528/2

	http://www.sqlfiddle.com/#!9/f13c9d/2


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Queries:

Q1.

CREATE TABLE HotelStays
(roomNum INTEGER NOT NULL unique,
arrDate DATE NOT NULL,
depDate DATE NOT NULL,
guestName CHAR(30) NOT NULL,
PRIMARY KEY (roomNum, arrDate),
check (arrDate<depDate));

INSERT INTO HotelStays(roomNum, arrDate, depDate, guestName) VALUES 
(123, to_date('20160202', 'YYYYMMDD'), to_date('20160206','YYYYMMDD'), 'A');

INSERT INTO HotelStays(roomNum, arrDate, depDate, guestName) VALUES 
(123, to_date('20160204', 'YYYYMMDD'), to_date('20160208','YYYYMMDD'), 'B');

INSERT INTO HotelStays(roomNum, arrDate, depDate, guestName) VALUES 
(201, to_date('20160210', 'YYYYMMDD'), to_date('20160206','YYYYMMDD'), 'C'); 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Q2.

create table course
(sid integer not null, classname char(25), grade char(5));

insert into course values(123, 'ART123', 'A');
insert into course values(123, 'BUS456', 'B');
insert into course values(666, 'REL100', 'D');
insert into course values(666, 'ECO966', 'A');
insert into course values(666, 'BUS456', 'B');
insert into course values(345, 'BUS456', 'A');
insert into course values(345, 'ECO966', 'F');

CREATE VIEW course1 AS(
SELECT classname as classname1,count(classname) as total
  FROM course
 GROUP by classname);

select * from course1 order by total asc;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Q3.

create table project
(p_id char(15) not null, step integer not null, status char(2) not null);


insert into project(p_id, step, status)
values
('P100',0,'C'),
('P100',1,'W'),
('P100',2,'W'),
('P201',0,'C'),
('P201',1,'C'),
('P333',0,'W'),
('P333',1,'W'),
('P333',2,'W'),
('P333',3,'W');


select p_id from project where step=0 and status ='C'
intersect
select p_id from project where step=1 and status='W'
intersect 
select p_id from project where step=2 and status='W';

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Q4.

create table mail 
(name char(50) not null, address char(5), id integer not null, samefam integer);

insert into mail values ('Alice', 'A', 10, NULL);
insert into mail values ('Bob', 'B', 15, NULL);
insert into mail values ('Carmen', 'C', 22, NULL);
insert into mail values ('Diego', 'A', 9, 10);
insert into mail values ('Ella', 'B', 3, 15);
insert into mail values ('Farkhad', 'D', 11, NULL);


delete from mail m where m.samefam is NULL and exists(select * from mail m1 where m.id=m1.samefam);

select * from mail;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Q5.

create table chefs (chef char(10) NOT NULL ,dish char(100) Not null);

Insert into chefs(chef, dish) values ('A','Mint chocolate brownie');
Insert into chefs(chef, dish) values ('B','Upside down pineapple cake');
Insert into chefs(chef, dish) values ('B','Creme brulee');
Insert into chefs(chef, dish) values ('B','Mint chocolate brownie');
Insert into chefs(chef, dish) values ('C','Upside down pineapple cake');
Insert into chefs(chef, dish) values ('C','Creme brulee');
Insert into chefs(chef, dish) values ('D','Apple pie');
Insert into chefs(chef, dish) values ('D','Upside down pineapple cake');
Insert into chefs(chef, dish) values ('D','Creme brulee');
Insert into chefs(chef, dish) values ('E','Apple pie');
Insert into chefs(chef, dish) values ('E','Upside down pineapple cake');
Insert into chefs(chef, dish) values ('E','Creme brulee');
Insert into chefs(chef, dish) values ('E','Bananas Foster');


select chef from chefs where dish='Apple pie'
intersect 
select chef from chefs where dish='Upside down pineapple cake'
intersect
select chef from chefs where dish='Creme brulee';



select distinct c.chef from chefs c where c.dish='Apple pie' and exists(select c1.chef from chefs c1 
where c1.dish='Upside down pineapple cake' and exists(select c2.chef from chefs c2 where c2.dish='Creme brulee'));


-------------------------


CREATE TABLE chefs
(chef char(10) NOT NULL, Mint_chocolate_brownie INTEGER NOT NULL, Upside_down_pineapple_cake INTEGER NOT NULL, Creme_brulee INTEGER NOT NULL, Bananas_Foster INTEGER NOT NULL, Apple_pie INTEGER NOT NULL);

INSERT INTO chefs(chef, Mint_chocolate_brownie, Upside_down_pineapple_cake, Creme_brulee, Bananas_Foster, Apple_pie)
VALUES 
('A', 1, 0, 0, 0, 0),
('B', 1, 1, 1, 0, 0),
('C', 0, 1, 1, 0, 0),
('D', 0, 1, 1, 0, 1),
('E', 0, 1, 1, 1, 1);


SELECT chef FROM chefs WHERE Apple_pie=1 AND Upside_down_pineapple_cake=1 AND Creme_brulee=1;
