/*
Chapter 12
Brady Chiles
*/

--Problem 1

SELECT INITCAP(title) "Title", retail
  FROM books
    WHERE retail < (SELECT AVG(retail)
                      FROM books);

--Problem 2

SELECT INITCAP(b.title) "Title", INITCAP(b.category) "Category"
  FROM books b JOIN (SELECT category, AVG(retail)  avgret
                       FROM books
                     GROUP BY category) c
                 ON b.category = c.category
  WHERE b.retail < c.avgret
ORDER BY b.category;

--Problem 3

SELECT order# "Order#"
  FROM orders
    WHERE shipstate = (SELECT shipstate
                        FROM orders
                          WHERE order#=1014)
 AND order# != 1014;

--Problem 4

SELECT o.order# "Order"
  FROM orders o JOIN orderitems oi ON o.order# = oi.order#
  GROUP BY o.order#
    HAVING SUM(oi.paideach*oi.quantity) >
                  (SELECT SUM(oi.paideach*oi.quantity) 
                    FROM orders o JOIN orderitems oi ON o.order# = oi.order#
                      WHERE o.order# = 1008);
      
--Problem 5

SELECT INITCAP(a.fname || ' ' || a.lname)  "Author"
  FROM books b JOIN bookauthor ba ON b.isbn=ba.isbn
               JOIN author a ON ba.authorid=a.authorid
  WHERE b.isbn = 
                  (SELECT isbn
                     FROM orderitems
                      GROUP BY isbn
                        HAVING COUNT(order#) =
                                          (SELECT MAX(COUNT(order#))
                                             FROM orderitems
                                              GROUP BY isbn));
                                              
--Problem 6

SELECT DISTINCT INITCAP(title) "Title", INITCAP(category) "Category"
  FROM books b JOIN orderitems oi ON b.isbn = oi.isbn
               JOIN orders o ON oi.order# = o.order#
    WHERE b.category IN (SELECT b.category
                          FROM books b JOIN orderitems oi ON b.isbn = oi.isbn
                                       JOIN orders o ON oi.order# = o.order#
                                         WHERE o.customer# = 1007)
  AND customer# != 1007;
  
--Problem 7

SELECT shipstate "Ship State", INITCAP(shipcity) "Ship City"
  FROM orders
    WHERE shipdate-orderdate = (SELECT MAX(shipdate-orderdate) 
                                  FROM orders);

--Problem 8

SELECT INITCAP(firstname || ' ' || lastname) "Name"
  FROM customers c JOIN orders o ON c.customer# = o.customer#
                   JOIN orderitems oi ON o.order# = oi.order#
                   JOIN books b ON oi.isbn = b.isbn
  WHERE b.retail = (SELECT MIN(retail)
                      FROM books);
                      
--Problem 9

SELECT COUNT(o.customer#) "Num Customers"
  FROM orders o JOIN orderitems oi ON o.order# = oi.order#
               JOIN books b ON oi.isbn = b.isbn
               JOIN bookauthor ba ON b.isbn = ba.isbn
               JOIN author a ON ba.authorid = a.authorid
    WHERE a.lname = 'AUSTIN';
    
--Problem 10

SELECT title
  FROM books
    WHERE pubid = (SELECT pubid
                    FROM books
                      WHERE title = 'THE WOK WAY TO COOK')
      AND title != 'THE WOK WAY TO COOK';
