/* Written by Brady Chiles
   Chapter 2 Assignment
*/
--Problem 1

SELECT *
  FROM Books;
  
--Problem 2

SELECT Title
  FROM Books;
  
--Problem 3

SELECT title, pubdate "Publication Date"
  FROM Books;
  
--Problem 4

SELECT customer#, city, state
  FROM Customers;
  
--Problem 5

SELECT name, contact "Contact Person", phone
  FROM Publisher;
  
--Problem 6

SELECT UNIQUE category
  FROM Books;
  
--Problem 7

SELECT UNIQUE customer#
  FROM Orders;

--Problem 8

SELECT category, title
  FROM Books;

--Problem 9

SELECT lname ||', '|| fname
  FROM Author;

--Problem 10

SELECT order#, item#, isbn, paideach * quantity as "Item Total"
  FROM OrderItems;