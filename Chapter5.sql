--Written by Brady Chiles

--Problem 1

INSERT INTO orders (order#, customer#, orderdate)
  VALUES (1021, 1009, '20,JUL,09');
  
--Problem 2

UPDATE orders
  SET shipzip = 33222
    WHERE customer# = 1017;
    
--Problem 3

COMMIT;

--Problem 4

INSERT INTO orders (order#, customer#, orderdate)
  VALUES(1022, 2000, '06,AUG,09');
  --The customer# entered does not have a matching primary key in the
  --customers table
  
--Problem 5

INSERT INTO orders (order#, customer#)
  VALUES (1023, 1009);
  --Did not enter an order date, which cannot take a null value
  
--Problem 6
SAVEPOINT one;
UPDATE books
  SET cost = '&Cost'
    WHERE isbn = '&ISBN';
--Problem 7

--Inserted the given values

--Problem 8

ROLLBACK TO one;

--Problem 9
SAVEPOINT two;
DELETE FROM orderitems 
  WHERE order# = 1005;
  
DELETE FROM orders
  WHERE order# = 1005;

--Problem 10

ROLLBACK TO two;
