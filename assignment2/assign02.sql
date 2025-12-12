show databases;
create database assignment1;
use assignment1;
create table user(email varchar(50) primary key,password varchar(20),role enum("student","user"));
create table student(reg_no int primary key,name varchar(40),email varchar(50),course_id int,mobile_no int,profile_pic blob,constraint c1 foreign key(email) references user(email),constraint c5 foreign key(course_id) references courses(course_id));
create table courses(course_id int primary key,course_name varchar(40),description varchar(60),fees int,start_date date,end_date date,video_expire_days int);
create table videos(video_id int primary key,course_id int,title varchar(30),description varchar(60),youtube_url varchar(50),added_at date,constraint c3 foreign key(course_id) references courses(course_id) );

insert into courses VALUES(7,'AI','some course related to AI',10000,'2025-12-24','2026-01-24',5);
insert into courses VALUES(8,'Android','Android related course',9999,'2025-12-24','2026-01-24',7);
insert into courses VALUES(11,'python','py',10000,'2025-12-24','2026-01-24',20);

insert into user VALUES('s1',1234,'student');
insert into user VALUES('s2',4567,'student');
insert into user VALUES('s3',8969,'student');
insert into user VALUES('s5',4758,'user');

insert into student VALUES(1,'student1','s1',7,'123456',null);
insert into student VALUES(2,'student1','s3',8,'123456',null);
insert into student VALUES(3,'student1','s2',11,'123456',null);

insert into videos VALUES(2,7,'learning java','java related course','avsdfrg','2025-01-23');
insert into videos VALUES(4,11,'learning python','python related course','avsdrtrg','2025-06-23');
insert into videos VALUES(3,8,'learning cpp','cpp related course','avsdfrthg','2025-07-27');

select *
from courses
where start_date > curdate();

SELECT reg_no,course_name 
from student s INNER JOIN courses c
on s.course_id=c.course_id;

select s.reg_no,s.name,s.email,s.mobile_no,c.course_id,c.description,c.fees,c.start_date,c.end_date,c.video_expire_days
from student s
JOIN courses c
on s.course_id=c.course_id 
where email='s1';

INSERT INTO videos VALUES
(10, 7, 'new video', 'testing active video', 'url', CURDATE());

SELECT 
    c.course_id,
    c.course_name,
    c.start_date,
    c.end_date,
    c.video_expire_days,
    v.video_id,
    v.title,
    v.added_at,
    s.email
FROM student s
JOIN courses c ON s.course_id = c.course_id
JOIN videos v ON c.course_id = v.course_id
WHERE s.email = 's1'
  AND DATE_ADD(v.added_at, INTERVAL c.video_expire_days DAY) >= CURDATE();




