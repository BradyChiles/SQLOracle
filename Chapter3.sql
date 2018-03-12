/*Creatded by Brady Chiles
  Chapter 3 Assignment
*/

-- Query the data dictionary
SELECT * 
  From user_tables
  where table_name = 'CATEGORY';
  
-- Problerm 1

create table category(
  catcode char(2),
  catdesc varchar2(10)
);
  
  --Problem 2
  
create table employees(
    emp# number(5),
    lastname varchar2(25),
    firstname varchar2(25),
    job_class varchar2(4)
);

--Problem 3

ALTER TABLE employees
  ADD (EmpDate DATE DEFAULT SYSDATE, EndDate DATE);
  
--Problem 4

ALTER TABLE employees
  MODIFY (job_class VARCHAR2(2));

--Problem 5

ALTER TABLE employees
  DROP COLUMN enddate;
  
--Problem 6

RENAME employees TO jl_emps;

--Problem 7

CREATE TABLE book_pricing(id, cost, retail, category)
  AS (SELECT isbn, cost, retail, category
        FROM books);
        
--Problem 8

ALTER TABLE book_pricing
  SET UNUSED (category);
  
--Problem 9

TRUNCATE TABLE book_pricing;

--Problem 10

DROP TABLE book_pricing PURGE;

DROP TABLE jl_emps;

FLASHBACK TABLE jl_emps
  TO BEFORE DROP;



  