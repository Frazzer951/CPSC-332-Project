CREATE TABLE PROFESSOR(SSN char(9) primary key,
					   Name varchar(40),
					   Street varchar(50),
					   City varchar(25),
					   State varchar(13),
					   Zipcode char(5),
					   Areacode char(3),
					   Number char(7),
					   Sex varchar(6),
					   Salary int,
					   Degrees int);
					
CREATE TABLE DEPARTMENT(DNUM char(4) primary key,
					    Name varchar(20),
						Phone_num char(13)
						Location varchar(50),
						Chairperson varchar(40));

CREATE TABLE COURSE(CNUM varchar(4) primary key,
					Title varchar(50),
					Textbook varchar(75),
					Units int,
					Department varchar(25));

CREATE TABLE SECTION(SNUM char(2) primary key,
					 Course char(6),
					 Classroom  varchar(5),
					 Num_seats int,
					 Days int,
					 Begin_time char(5),
					 End_time char(5),
					 Professor varchar(40));
			
CREATE TABLE STUDENT(CWID char(9) primary key,
					 Fname varchar(20),
					 Lname varchar(20),
					 Address varchar(50),
					 Phone_num char(13),
					 Major char(4));
					 
CREATE TABLE ENROLL(CWID char(9) primary key,
					SNUM char(2),
					CNUM varchar(4),
					Grade char(2));