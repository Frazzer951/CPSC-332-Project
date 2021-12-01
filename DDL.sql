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
    CLASSROOM varchar(5),
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
    FOREIGN KEY (SNUM) references SECTION(SNUM),
    FOREIGN KEY (CNUM) references SECTION(CNUM)
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

-- Prereq --

-- Section --

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

-- Enroll --
