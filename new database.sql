CREATE DATABASE SPORTCLUB;
USE  SPORTCLUB;

CREATE TABLE player(
pid INT NOT NULL auto_increment,
pname varchar(50) not null,
dob date,
address varchar(100),
gender varchar(6),
joindate date,
primary key (pid)
); 

create table sport(
sid varchar(10) not null,
sname varchar(20) not null,
pracdate date,
practime time,
primary key(sid)
);

alter table sport modify pracdate varchar(20);

create table coach(
cid int auto_increment not null,
cname varchar(50) not null,
exp int,
sid varchar(10),
primary key(cid),
foreign key(sid) references sport(sid)
);

alter table coach add salary float;
alter table coach add gender varchar(7);

create table relationplayer(
pid int,
sid varchar(10),
cid int,
foreign key(pid) references player(pid) On delete cascade,
foreign key(sid) references sport(sid),
primary key (pid,sid)
);



create table performance(
pid int,
sid varchar(10),
lev int,
marks int,
foreign key (pid) references player(pid) On delete cascade,
foreign key(sid) references sport(sid)
);

create table payment(
payid int auto_increment,
amount float not null,
transdate date,
pid int,
primary key(payid),
foreign key(pid) references player(pid) On delete cascade
);

create table tournament(
tid int auto_increment not null,
tname varchar(20) not null,
sid varchar(10),
primary key(tid),
foreign key (sid) references sport(sid)
);

create table sponsor(
sponid int auto_increment not null,
sponname varchar(20) not null,
tid int,
primary key(sponid),
foreign key(tid) references tournament(tid) On delete cascade
);

insert into player(pname,dob,address,gender,joindate)
values 
('Amila Dissanayaka','1998-05-12','Kandy','Male',curdate());

insert into player(pname,dob,address,gender,joindate)
values 
('Sandali Perea','1999-06-12','Kadawatha','Female',curdate()),
('Sandun Samadhi','2000-09-05','Kurunegala','Male',curdate()),
('Dulanjan Buddhadasa','2001-01-29','Malabe','Male',curdate()),
('Rishini De Silva','1997-07-12','Kuliyapitiya','Female',curdate());



insert into sport(sid,sname,pracdate,practime)
values
('S001','Cricket','Saturday','08:00:00'),
('S002','Batminton','Sunday','08:00:00'),
('S003','Swimming','Saturday','10:00:00');

insert into coach(cname,exp,salary,sid)
values
('Nandana De Silva',10,70000,'S001'),
('Upali senarathne',12,75000,'S001'),
('Mahinda Rajapaksha',10,70000,'S002'),
('Neranjan pradeep',8,70000,'S003');

insert into relationplayer(pid,sid,cid)
values
(1,'S001',1),
(2,'S001',2),
(3,'S001',1),
(4,'S002',3);

insert into performance(pid,sid,lev,marks)
values
(1,'S001',2,75),
(2,'S001',1,70),
(3,'S001',2,80),
(4,'S002',3,90),
(5,'S003',1,60);

insert into payment(amount,transdate,pid)
values
(1500,curdate(),2),
(1500,curdate(),3);

insert into tournament(tname,sid)
values
('ABC trophy','S001');

insert into sponsor(sponname,tid)
values
('MAS',1);





