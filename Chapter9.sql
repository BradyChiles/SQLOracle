--Created by Brady Chiles
--Chapter 9


--Problem 1

SELECT b.title, p.contact, p.phone
  FROM Books b JOIN Publisher p
    ON b.pubid = p.pubid;
    
--Problem 2

SELECT c.firstname || ' ' || c.lastname "Customer", o.orderdate
  FROM customers c JOIN orders o
    ON c.customer# = o.customer#
      WHERE shipdate IS null
        ORDER BY o.orderdate;
        
--Problem 3

SELECT DISTINCT c.firstname || ' ' || c.lastname "Customer"
  FROM customers c JOIN orders o ON c.customer# = o.customer#
                   JOIN orderitems oi ON o.order# = oi.order#
                   JOIN books b ON oi.isbn = b.isbn
    WHERE state = 'FL' AND b.category = 'COMPUTER';
    
--Problem 4

SELECT DISTINCT b.title
  FROM customers c JOIN orders o ON c.customer# = o.customer#
                   JOIN orderitems oi ON o.order# = oi.order#
                   JOIN books b ON oi.isbn = b.isbn
    WHERE c.lastname = 'LUCAS';
    
--Problem 5

SELECT b.title, oi.paideach - b.cost "Profit"
  FROM customers c JOIN orders o ON c.customer# = o.customer#
                   JOIN orderitems oi ON o.order# = oi.order#
                   JOIN books b ON oi.isbn = b.isbn
    WHERE c.lastname = 'LUCAS'
      ORDER BY o.orderdate DESC;
      
--Problem 6

SELECT a.lname, b.title
  FROM books b JOIN bookauthor ba ON b.isbn = ba.isbn
               JOIN author a ON ba.authorid = a.authorid
    WHERE a.lname = 'ADAMS';
    
--Problem 7

SELECT b.title, p.gift
  FROM books b JOIN promotion p ON b.retail BETWEEN p.minretail AND p.maxretail
    WHERE b.title = 'SHORTEST POEMS';
    
--Problem 8

SELECT b.title, a.fname || ' '|| a.lname "Author"
  FROM customers c JOIN orders o ON c.customer# = o.customer#
                   JOIN orderitems oi ON o.order# = oi.order#
                   JOIN books b ON oi.isbn = b.isbn
                   JOIN bookauthor ba ON b.isbn = ba.isbn
                   JOIN author a ON ba.authorid = a.authorid
    WHERE c.lastname = 'NELSON';
    
--Problem 9

SELECT b.title, o.order#, c.state
  FROM customers c JOIN orders o ON  c.customer# = o.customer#
                   JOIN orderitems oi ON o.order# = oi.order#
                   RIGHT OUTER JOIN books b  ON b.isbn = oi.isbn;

--Problem 10

SELECT e.fname || ' '|| e.lname "Employee", e.job,m.fname || ' ' || m.lname "Manager"
  FROM employees e LEFT JOIN employees m ON e.mgr = m.empno;
  

    