--Brady Chiles
--Chapter 6

--Problem 1

CREATE SEQUENCE customers_customer#_seq
  INCREMENT BY 1
  START WITH 1021
  NOCYCLE
  NOCACHE;
  
--Problem 2

INSERT INTO customers (customer#, lastname, firstname, zip)
  VALUES (customers_customer#_seq.NEXTVAL, 'Shoulders', 'Frank', 23567);
  
--Problem 3

CREATE SEQUENCE my_first_sequence
  INCREMENT BY -3
  START WITH 5
  MINVALUE 0
  MAXVALUE 5
  NOCYCLE;
  
--Problem 4

SELECT my_first_sequence.NEXTVAL
  FROM DUAL;
  
SELECT my_first_sequence.NEXTVAL
  FROM DUAL;

SELECT my_first_sequence.NEXTVAL
  FROM DUAL;  
  
  --Initiating NEXTVAL violates MINVALUE
  
--Problem 5

ALTER SEQUENCE my_first_sequence
  MINVALUE -1000;
  
--Problem 6
CREATE TABLE email_log
  (emailid number GENERATED AS IDENTITY PRIMARY KEY,
   emaildate date,
   customer# number);
   
INSERT INTO email_log (emaildate, customer#)
  VALUES(sysdate, 1007);

INSERT INTO email_log (emailid, emaildate, customer#)
  VALUES(default, sysdate, 1008);
  
INSERT INTO email_log (emailid, emaildate, customer#)
  VALUES(25, sysdate, 1009);
  
  --Error due to the attmept of entering a value into a generated column
  
--Problem 7

CREATE SYNONYM numgen
  FOR my_first_sequence;
  
--Problem 8

SELECT NUMGEN.CURRVAL
  FROM DUAL;
  
DROP SYNONYM numgen;

DROP SEQUENCE my_first_sequence;

--Problem 9

CREATE BITMAP INDEX customers_state_idx
  ON customers(state);
  
SELECT table_name, index_name, index_type
  FROM user_indexes
    WHERE table_name = 'CUSTOMERS';
    
DROP INDEX customers_state_idx;

--Problem 10

CREATE INDEX customers_lastname_idx
  ON customers (lastname);
  
SELECT table_name, index_name, index_type
  FROM user_indexes
    WHERE table_name = 'CUSTOMERS';
    
DROP INDEX customers_lastname_idx;

--Problem 11

CREATE INDEX orders_daystoship_idx
  ON orders (shipdate - orderdate);