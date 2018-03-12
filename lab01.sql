/*
  Created by Brady Chiles 
  Exam 1 
*/

--Problem 1 

DROP TABLE employee;

CREATE TABLE employee(
id number(4),
first_name varchar2(25),
middle_name varchar2(25),
last_name varchar2(25),
dept_id number(4));

--Problem 2

DROP TABLE department;

CREATE TABLE department(
id number(4),
name varchar2(30));

--Problem 3

ALTER TABLE employee
  MODIFY(last_name varchar2(30));
  
ALTER TABLE employee
  DROP COLUMN middle_name;
  
ALTER TABLE employee
  ADD CONSTRAINT employee_id_pk PRIMARY KEY (id);

ALTER TABLE department 
  ADD CONSTRAINT dept_id_pk PRIMARY KEY (id);
  
ALTER TABLE employee
  ADD CONSTRAINT emp_dept_fk FOREIGN KEY(dept_id)
    REFERENCES department(id);

ALTER TABLE employee
  ADD(status char(1) DEFAULT 'A'
    CONSTRAINT employee_status_ck CHECK (status IN('A','I')));
    
--Problem 4

DROP SEQUENCE dept_seq;

CREATE SEQUENCE dept_seq
  INCREMENT BY 10
  START WITH 100
  MAXVALUE 9900
  NOCYCLE;
  
--Problem 5

INSERT INTO department(id ,name)
  VALUES(dept_seq.NEXTVAL ,'&name');

COMMIT;
  