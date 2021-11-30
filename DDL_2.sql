//DROP TABLES
DROP TABLE IF EXISTS PROFESSOR;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS COURSE;
DROP TABLE IF EXISTS SECTION;
DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS ENROLL;



//CREATE TABLES
CREATE TABLE PROFESSOR(SSN char(9) primary key,
                       NAME varchar(50), STREET char(50),
                       CITY char(50), STATE char(20),
                       ZIPCODE char(5), AREA_CODE char(10),
                       PHONE_NUM varchar(10), SEX varchar(10),
                       TITLE varchar(20), SALARY int, DEGREES int
                        );
                        
CREATE TABLE STUDENT(CWID char(9) primary key,
                    FNAME varchar(25), LNAME varchar(25),
                    ADDRESS char(50), PHONE_NUM char(10),
                    MAJOR char(25) foreign key
                    );
                    
CREATE TABLE COURSE(CNUM char(4) primary key,
                    TITLE varchar(20), TEXTBOOK varchar(50),
                    UNITS int, DEPARTMENT char(25) foreign key
                    );
                    
CREATE TABLE SECTION(SNUM char(3) primary key, COURSE char(20) primary key
                    CLASSROOM varchar(5), NUM_SEATS int,
                    DAYS int, BEGINNING_TIME char(7), ENDING_TIME char(7),
                    PROFESSOR varchar(50) foreign key
                     );                    
                    
CREATE TABLE DEPARTMENT(DNUM char(6) primary key,
                        NAME varchar(25), PHONE_NUM char(10),
                        LOCATION char(20), CHAIRPERSON varchar(20) foreign key
                        );                    

CREATE TABLE ENROLL(CWID char(9) primary key,
                    SNUM char(3) foreign key, CNUM char(6) foreign key,
                    GRADE char(2)
                    );                    