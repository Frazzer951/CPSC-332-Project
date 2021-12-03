-- clear tables --
DROP TABLE IF EXISTS PROFESSOR;
DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS COURSE;
DROP TABLE IF EXISTS PREREQ;
DROP TABLE IF EXISTS SECTION;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS MINOR;
DROP TABLE IF EXISTS ENROLL;

-- creating tables --
CREATE TABLE PROFESSOR (
    SSN char(9) PRIMARY KEY,
    PNAME varchar(50),
    STREET varchar(50),
    CITY varchar(50),
    STATE varchar(13),
    ZIPCODE char(5),
    AREACODE char(3),
    PNUMBER char(7),
    SEX enum("Male", "Female", "Other"),
    TITLE varchar(4),
    SALARY int,
    DEGREES varchar(50)
);

CREATE TABLE DEPARTMENT (
    DNUM char(4) PRIMARY KEY,
    DNAME varchar(20),
    PHONE_NUM char(13),
    LOCATION varchar(50),
    CHAIRPERSON char(9),
    FOREIGN KEY (CHAIRPERSON) references PROFESSOR(SSN)
);

CREATE TABLE COURSE (
    CNUM varchar(10) PRIMARY KEY,
    TITLE varchar(50),
    TEXTBOOK varchar(75),
    UNITS INT,
    DEPARTMENT char(4),
    FOREIGN KEY (DEPARTMENT) references DEPARTMENT(DNUM)
);

CREATE TABLE PREREQ (
    CNUM varchar(10),
    NEEDS varchar(10),
    PRIMARY KEY (CNUM, NEEDS),
    FOREIGN KEY (CNUM) references COURSE(CNUM),
    FOREIGN KEY (NEEDS) references COURSE(CNUM)
);

CREATE TABLE SECTION (
    SNUM char(6),
    CNUM varchar(4),
    CLASSROOM varchar(6),
    NUM_SEATS INT,
    DAYS TEXT,
    BEGIN_TIME char(5),
    END_TIME char(5),
    PROFESSOR char(9),
    PRIMARY KEY (SNUM, CNUM),
    FOREIGN KEY (CNUM) references COURSE(CNUM),
    FOREIGN KEY (PROFESSOR) references PROFESSOR(SSN)
);

CREATE TABLE STUDENT (
    CWID char(9) PRIMARY KEY,
    FNAME varchar(20),
    LNAME varchar(20),
    ADDRESS varchar(50),
    PHONE_NUM varchar(13),
    MAJOR char(4),
    FOREIGN KEY (MAJOR) references DEPARTMENT(DNUM)
);

CREATE TABLE MINOR (
    STUDENT_ID char(9),
    DEPARTMENT char(4),
    PRIMARY KEY (STUDENT_ID, DEPARTMENT),
    FOREIGN KEY (STUDENT_ID) references STUDENT(CWID),
    FOREIGN KEY (DEPARTMENT) references DEPARTMENT(DNUM)
);

CREATE TABLE ENROLL (
    CWID char(9),
    SNUM char(6),
    CNUM varchar(4),
    GRADE varchar(2),
    PRIMARY KEY (CWID, SNUM, CNUM),
    FOREIGN KEY (CWID) references STUDENT(CWID),
    FOREIGN KEY (CNUM, SNUM) references SECTION(CNUM, SNUM)
);

-- inserting data into tables --
-- Professor --
INSERT INTO PROFESSOR VALUES ( '123456789', 'John Smith', '435 Green Apple Ln.', 'Oxford', 'Washington', '11254', '777', '5555555', 'Male', 'Doctor', '125000', '10' );
INSERT INTO PROFESSOR VALUES ( '754327899', 'Jack Turner', '368 Chamber Lane Dr.', 'Miami', 'Florida', '31708', '111', '4578979', 'Male', 'Doctor', '200000', '3' );
INSERT INTO PROFESSOR VALUES ( '987654321', 'Einion Rolf', '123 Candy Lane', 'Fullerton', 'California', '90621', '714', '2341234', 'Male', '80000', '1');

-- Department --
INSERT INTO DEPARTMENT VALUES ('CPSC', 'Computer Science', '6572783700', 'Fullerton', '123456789')
INSERT INTO DEPARTMENT VALUES ('EGME', 'Mechanical Engineering', '6572783014', 'Fullerton', '754327899')
INSERT INTO DEPARTMENT VALUES ('MATH', 'Mathmatics', '6572783631', 'Fullerton', '987654321')

-- Course --
INSERT INTO STUDENT VALUES('CPSC 120', 'Introduction to Computer Science', 'Introduction to Computer Science 7th Ed.', 3, 'CPSC')
INSERT INTO STUDENT VALUES('CPSC 121', 'Object-Oriented Programming', 'Computer Science 112th Ed.', 3, 'CPSC')
INSERT INTO STUDENT VALUES('CPSC 131', 'Data Structures', 'C++ Data Structures', 3, 'CPSC')
INSERT INTO STUDENT VALUES('EGME 335', 'Kienmatics of Mechanisms', 'Kinematics', 3, 'EGME')
INSERT INTO STUDENT VALUES('MATH 302', 'Modern Algebra', 'MATH 3.0', 3, 'MATH')

-- Prereq --
INSERT INTO PREREQ VALUES('CPSC 121', 'CPSC 120')
INSERT INTO PREREQ VALUES('CPSC 131', 'CPSC 121')

-- Section --
INSERT INTO SECTION VALUES('01', 'CPSC 120', 'CS-232', '10', 'MWF', '08:00', '09:00', '123456789')
INSERT INTO SECTION VALUES('02', 'CPSC 120', 'CS-102', '15', 'TTh', '14:00', '15:30', '123456789')
INSERT INTO SECTION VALUES('10', 'EGME 335', 'CS-404', '20', 'MW', '17:00', '18:15', '754327899')
INSERT INTO SECTION VALUES('14', 'EGME 335', 'CS-304', '25', 'TTh', '09:45', '11:00', '754327899')
INSERT INTO SECTION VALUES('04', 'MATH 302', 'CS-404', '45', 'MF', '07:00', '08:15', '987654321')
INSERT INTO SECTION VALUES('05', 'MATH 302', 'CS-304', '60', 'W', '08:00', '11:00', '987654321')

-- Student --
INSERT INTO STUDENT VALUES('111111111', 'Eilish', 'Barron', '654 Grove Street', '5624533463', 'CPSC')
INSERT INTO STUDENT VALUES('234165845', 'Harriett', 'Rayner', '21 Jump Street', '7124372942', 'MATH')
INSERT INTO STUDENT VALUES('999545234', 'Jim', 'Mcguire', '66 Elm Street', '2392102323', 'ENGL')
INSERT INTO STUDENT VALUES('564234123', 'Stephan', 'Gamble', '123 Paper Street', '7142349102', 'PHYS')
INSERT INTO STUDENT VALUES('435233987', 'Trinity', 'Kouma', '2312 Rainey Street', '8182328188', 'CPSC')
INSERT INTO STUDENT VALUES('845834321', 'Zohaib', 'Leal', '74 61st Street', '5629348128', 'CPSC')
INSERT INTO STUDENT VALUES('562134132', 'Abby', 'Cornish', '234 Main Street', '5624533463', 'COMM')
INSERT INTO STUDENT VALUES('823451221', 'Ayomide', 'Lees', '172 Hollywood Boulevard', '7141273127', 'MATH')

-- Minor --
INSERT INTO MINOR VALUES('111111111', 'MATH')
INSERT INTO MINOR VALUES('234165845', 'EGME')

-- Enroll --
