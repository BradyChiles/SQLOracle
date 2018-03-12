/* 
Created by Brady Chiles
Chapter 8
*/
   
--Problem 1

SELECT lastname, firsname, state
  FROM customers
    WHERE state = 'NJ';
    
--Problem 2

SELECT order#, shipdate
  FROM orders
    WHERE shipdate > '01-APR-09';
    
--Problem 3

SELECT title, category
  FROM books
    WHERE category != 'FITNESS';
    
--Problem 4

SELECT customer#, lastname, state
  FROM customers
    WHERE state IN ('GA','NJ')
      ORDER BY lastname;

      
--Problem 5

SELECT order#, orderdate
  FROM orders
    WHERE orderdate <= '01-APR-16';
    
--Problem 6

SELECT lname, fname
  FROM author
    WHERE lname like '%IN%'
      ORDER BY lname, fname;
      
--Problem 7

SELECT lastname, referred
  FROM customers
    WHERE referred IS NOT NULL;
    
--Problem 8

SELECT title, category
  FROM books
    WHERE category IN('CHILDREN','COOKING');
    
--Problem 9

SELECT isbn, title
  FROM books
    WHERE title like '_A_N%'
      ORDER BY title DESC;
    
--Problem 10

SELECT title, pubdate
  FROM books
    WHERE pubdate like '%05';
