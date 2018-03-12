/*
Brady Chiles
Exam 3
5/4/17
*/

--Problem 1

SELECT INITCAP(b.title) "TITLE", INITCAP(p.name) "PUBLISHER"
  FROM books b JOIN publisher p ON b.pubid = p.pubid
    WHERE b.retail = (SELECT MAX(retail)
                        FROM books);

--Problem 2

SELECT b.isbn, INITCAP(b.title) "TITLE"
  FROM books b JOIN publisher p ON b.pubid = p.pubid
    WHERE p.name = (SELECT p.name 
                      FROM books b JOIN publisher p ON b.pubid = p.pubid
                        WHERE b.title = 'SHORTEST POEMS')
    AND b.title != 'SHORTEST POEMS';

--Problem 3

SELECT INITCAP(c.lastname || ', ' || c.firstname) "CUSTOMER", SUM(oi.quantity)"BOOKS"
  FROM customers c JOIN orders o ON c.customer# = o.customer#
                   JOIN orderitems oi ON o.order# = oi.order#
    HAVING SUM(oi.quantity) > 1
      GROUP BY c.lastname, c.firstname
        ORDER BY BOOKS DESC, c.lastname;

--Problem 4

SELECT b.title, COUNT(oi.quantity) "SOLD"
  FROM books b LEFT JOIN orderitems oi ON b.isbn = oi.isbn
    GROUP BY b.title
      ORDER BY b.title;


--Problem 5

SELECT c.customer#, COUNT(o.order#) "ORDERS"
  FROM customers c LEFT JOIN orders o ON c.customer# = o.customer#
    GROUP BY c.customer#
      ORDER BY c.customer#;
--Problem 6 (Extra Credit)

SELECT INITCAP(b.category) "CATEGORY", INITCAP(b.title) "TITLE", TO_CHAR(b.retail, '$99.99') "PRICE"
  FROM books b JOIN (SELECT category, MAX(retail) maxret
                      FROM books
                        GROUP BY category) c
                ON b.category = c.category
    WHERE b.retail = c.maxret
      ORDER BY b.category;