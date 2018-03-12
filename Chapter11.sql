/* 
Brady Chiles
Chapter 11
*/

--Problem 1

SELECT count(*)"Num Cooking Books"
  FROM books
    WHERE category = 'COOKING';
    
--Problem 2

SELECT count(*) "Num Books > $30"
  FROM books
    WHERE retail > 30;
    
--Problem 3

SELECT max(pubdate)
  FROM books;
    
--Problem 4

SELECT o.customer#, TO_CHAR(SUM((oi.paideach * oi.quantity)- b.cost),'$99.99')"Profit"
  FROM orders o JOIN orderitems oi ON o.order# = oi.order#
                JOIN books b ON oi.isbn = b.isbn
    WHERE customer# = 1017
      GROUP BY oi.order#, o.customer#;

--Problem 5

SELECT TO_CHAR(min(retail),'$99.99') "Minimum Retail"
  FROM books
    WHERE category = 'COMPUTER';
      
--Problem 6

SELECT TO_CHAR(AVG(SUM((paideach* quantity)-b.cost)),'$999.99') "Average Profit"
  FROM orders o JOIN orderitems oi ON o.order# = oi.order#
                JOIN books b ON oi.isbn = b.isbn
    GROUP BY o.order#;
    
--Problem 7

SELECT customer#, COUNT(order#)
  FROM orders
    GROUP BY customer#;
    
--Problem 8
      
SELECT p.name, b.title, b.category, TO_CHAR(AVG(b.retail), '$99.99') "Average Retail"
  FROM books b JOIN publisher p ON b.pubid = p.pubid
    WHERE b.category IN ('CHILDREN','COMPUTER') AND b.retail>50 
      Group BY p.name, b.category, b.title;
    
--Problem 9;

SELECT c.lastname, SUM(oi.paideach*oi.quantity) "Order Total"
  FROM customers c JOIN orders o ON c.customer# = o.customer#
                   JOIN orderitems oi ON o.order# = oi.order#
    WHERE (c.state IN ('GA','FL'))
      GROUP BY oi.order#, c.lastname
        HAVING SUM(oi.paideach*quantity)>80;
        
--Problem 10

SELECT b.title, b.retail
  FROM books b JOIN bookauthor ba ON b.isbn = ba.isbn
               JOIN author a ON ba.authorid = a.authorid
    WHERE b.retail = (SELECT MAX(b.retail) 
                        FROM books b JOIN bookauthor ba ON b.isbn = ba.isbn
                                     JOIN author a ON ba.authorid = a.authorid
                            WHERE a.authorid = 'W105');
    