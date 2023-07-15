	CREATE DATABASE SERVICES;
    USE SERVICES;
    
    CREATE TABLE SCHOOL(
    SCHOOL_NAME VARCHAR(255) NOT NULL,
    ADDRESS VARCHAR(255),
    STUDENT_COUNT INT,
    DRIVER_COUNT INT,
    START_TIME TIME,
    END_TIME TIME,
    primary key(SCHOOL_NAME)
    );
    CREATE TABLE DRIVERS(
    DRIVER_NAME VARCHAR(255) NOT NULL,
    SCHOOL_NAME VARCHAR(255) NOT NULL,
    STUDENT_COUNT VARCHAR(255),
    CONTACT VARCHAR(255) NOT NULL,
    VEHICLE_NUMBER VARCHAR(255) NOT NULL,
    VEHICLE_CAPACITY INT,
    VEHICLE_NAME VARCHAR(255),
    primary key (DRIVER_NAME),
    foreign key (SCHOOL_NAME) references SCHOOL(SCHOOL_NAME)
    );
    
    create table PARENTS(
    PARENTS_NAME VARCHAR(255) NOT NULL,
    ADDRESS VARCHAR(255),
    CHILD_NAME VARCHAR(255) NOT NULL,
    CONTACT varchar(255) NOT NULL,
    DRIVER_NAME VARCHAR(255),
    SCHOOL_NAME VARCHAR(255),
    ARRIVAL_TIME TIME,
    DEPARTURE_TIME TIME,
    FEE_STATUS BOOL,
    primary key(PARENTS_NAME),
    FOREIGN KEY (DRIVER_NAME) references DRIVERS(DRIVER_NAME),
    FOREIGN KEY (SCHOOL_NAME) references SCHOOL(SCHOOL_NAME)
    );
    Alter table PARENTS
    modify CONTACT varchar(255);
    
    INSERT INTO school (SCHOOL_NAME, ADDRESS, STUDENT_COUNT, DRIVER_COUNT, START_TIME, END_TIME) VALUES
	('ABC School', '123 Main St', 500, 10, '08:00:00', '15:30:00'),
	('XYZ Academy', '456 Elm St', 800, 15, '07:30:00', '16:00:00'),
	('PQR High School', '789 Oak St', 1000, 20, '08:30:00', '15:45:00'),
	('LMN Elementary', '321 Maple St', 300, 5, '08:15:00', '14:45:00'),
	('DEF Middle School', '654 Pine St', 600, 12, '07:45:00', '15:15:00');
    
    INSERT INTO DRIVERS (DRIVER_NAME, SCHOOL_NAME, STUDENT_COUNT, CONTACT, VEHICLE_NUMBER, VEHICLE_CAPACITY, VEHICLE_NAME)
VALUES
  ('John Smith', 'ABC School', 'John Doe, Jane Smith', '1234567890', 'ABC123', 15, 'Van 1'),
  ('Sarah Johnson', 'XYZ Academy', 'Mike Johnson, Emily Davis', '9876543210', 'XYZ456', 20, 'Van 2'),
  ('David Brown', 'PQR High School', 'Chris Anderson', '4567890123', 'PQR789', 10, 'Van 3'),
  ('Jessica Taylor', 'LMN Elementary', 'Olivia Wilson', '8901234567', 'LMN321', 5, 'Van 4'),
  ('Michael Davis', 'DEF Middle School', 'David Williams, Jessica Taylor', '5678901234', 'DEF654', 12, 'Van 5');
    
    INSERT INTO PARENTS (PARENTS_NAME, ADDRESS, CHILD_NAME, CONTACT, DRIVER_NAME, SCHOOL_NAME, ARRIVAL_TIME, DEPARTURE_TIME, FEE_STATUS)
VALUES
  ('John Doe', '123 Main St', 'John Doe Jr.', '1111111111', 'John Smith', 'ABC School', '08:00:00', '15:30:00', 1),
  ('Jane Smith', '456 Elm St', 'Jane Smith Jr.', '2222222222', 'Sarah Johnson', 'XYZ Academy', '07:30:00', '16:00:00', 1),
  ('Mike Johnson', '789 Oak St', 'Mike Johnson Jr.', '3333333333', 'David Brown', 'PQR High School', '08:30:00', '15:45:00', 0),
  ('Emily Davis', '321 Maple St', 'Emily Davis Jr.', '4444444444', 'Jessica Taylor', 'LMN Elementary', '08:15:00', '14:45:00', 1),
  ('David Williams', '654 Pine St', 'David Williams Jr.', '5555555555', 'Michael Davis', 'DEF Middle School', '07:45:00', '15:15:00', 0);
  
  
  select * from parents;
  select * from school;
  select * from drivers;
  
  create table student(
  student_name varchar(25) not null primary key,
  school_name varchar(25),
  parents_name varchar(25),
  pickup_time time,
  drop_time time,
  driver_name varchar(25),
  foreign key (parents_name) references parents(parents_name),
  foreign key (driver_name) references drivers(driver_name),
  foreign key (school_name) references school(school_name)
  );
  -- Insert random data entries
INSERT INTO student (student_name, school_name, parents_name, pickup_time, drop_time, driver_name)
VALUES
  ('John Doe Jr.', 'ABC School', 'John Doe', '08:00:00', '15:30:00', 'John Smith'),
  ('Jane Smith Jr.', 'XYZ Academy', 'Jane Smith', '07:30:00', '16:00:00', 'Sarah Johnson'),
  ('Mike Johnson Jr.', 'PQR High School', 'Mike Johnson', '08:30:00', '15:45:00', 'David Brown'),
  ('Emily Davis Jr.', 'LMN Elementary', 'Emily Davis', '08:15:00', '14:45:00', 'Jessica Taylor'),
  ('David Williams Jr.', 'DEF Middle School', 'David Williams', '07:45:00', '15:15:00', 'Michael Davis');


select * from parents;
  select * from school;
  select * from drivers;
  select * from student