CREATE TABLE  major(
major_id SERIAL,
major_name varchar(50),
   PRIMARY KEY( major_id )
);

CREATE TABLE  course(
course_id SERIAL,
course_name varchar(50),
   PRIMARY KEY( course_id )
);

CREATE TABLE student(

fname varchar(50),
lname varchar (50),
major_id int,
susername varchar(50),
spasword varchar(50),
phone varchar(11),
   PRIMARY KEY( susername ),
    FOREIGN KEY (major_id) REFERENCES major (major_id) 
);
CREATE TABLE student_history(

history_id SERIAL,
course_id int,
teacher_name varchar(50),
course_date date,
fee int ,
susername varchar(50),
   PRIMARY KEY( history_id ),
   FOREIGN KEY (susername) REFERENCES student (susername) ,
     FOREIGN KEY (course_id) REFERENCES course (course_id) 
);

CREATE TABLE student_order(

order_id SERIAL,
course_id int,
order_date date,
fee int ,
susername varchar(50),
   PRIMARY KEY( order_id ),
   FOREIGN KEY (susername) REFERENCES student (susername) ,
       FOREIGN KEY (course_id) REFERENCES course (course_id) 
);

CREATE TABLE teacher(

fname varchar(50),
lname varchar (50),
major_id int,
tusername varchar(50),
tpasword varchar(50),
phone varchar(11),
   PRIMARY KEY( tusername ),
    FOREIGN KEY (major_id) REFERENCES major (major_id) 
);
CREATE TABLE  teacher_history(
history_id SERIAL,
course_id int,
student_name varchar(50),
tusername varchar(50),
course_date date,
fee int ,
susername varchar(50),
   PRIMARY KEY( history_id ),
   FOREIGN KEY (tusername) REFERENCES teacher (tusername) ,
    FOREIGN KEY (course_id) REFERENCES course (course_id) 
);

ALTER TABLE main.student_history 
ADD CONSTRAINT teacher_name
FOREIGN KEY (teacher_name) 
REFERENCES teacher(tusername);


ALTER TABLE main.teacher_history 
ADD CONSTRAINT student_name
FOREIGN KEY (student_name) 
REFERENCES student(susername);
