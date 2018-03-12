/*
Brady Chiles
Chapter 10
*/

--Problem 1

SELECT INITCAP(firstname) || ' ' || INITCAP(lastname) "Name"
  FROM customers;
  
--Problem 2

SELECT customer#, NVL2(referred, 'Referred', 'Not Referred') "Referred"
  FROM customers;
  
--Problem 3

SELECT b.title, TO_CHAR(((b.retail-b.cost)*oi.quantity), '$999.99') "Profit"
  FROM orderitems oi JOIN books b ON oi.isbn = b.isbn
    WHERE oi.order# = 1002;
    
--Problem 4

SELECT title, TRUNC((((retail-cost)/cost)*100), 0) || '%' "Percent Markup" 
  FROM books;
  
--Problem 5

SELECT TO_CHAR(CURRENT_DATE, 'DAY HH:MI:SS')
  FROM dual;
  
--Problem 6

SELECT title, LPAD(cost,12,'*') "Cost" 
  FROM books;
  
--Problem 7

SELECT DISTINCT LENGTH(isbn) "ISBN Length"
  FROM books;
  
--Problem 8

SELECT title, pubdate, TO_CHAR(CURRENT_DATE, 'DD-MON-YY') "Current Date",
        TRUNC(MONTHS_BETWEEN(CURRENT_DATE ,pubdate),0) || ' Mo.' "Age"
  FROM books;
  
--Problem 9

SELECT NEXT_DAY(CURRENT_DATE, 'WEDNESDAY')
  FROM dual;
  
--Problem 10

SELECT customer#, SUBSTR(zip,3,2) "3rd and 4th Zip Digit", 
        INSTR(customer#,'3') "First 3 in Customer #"
  FROM customers;