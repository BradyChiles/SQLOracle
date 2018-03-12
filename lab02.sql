/*
Brady Chiles
Exam 2
4/11/17
*/

--Problem 1

SELECT DISTINCT state "State Code", (DECODE(state, 'CA', .10, 'FL', .09, 'GA', .08, .07)*100) || '%' "Sales Tax"  
  FROM customers
    ORDER BY state;
  
--Problem 2

SELECT INITCAP(title) "Title", INITCAP(category) "Category", TO_CHAR(pubdate,'FMMonth DD, YYYY') "Pub Date", TO_CHAR(SUM(retail - cost),'$99.99') "Profit Margin"
  FROM books 
    group by title, category, pubdate
      ORDER BY title;
      
--Problem 3

SELECT c.customer#
  FROM customers c LEFT JOIN orders o ON c.customer# = o.customer#
    WHERE o.customer# IS NULL
      ORDER BY c.customer#;
  
--Problem 4

SELECT b.isbn, INITCAP(b.title) "Title", INITCAP(p.name) "Publisher", INITCAP(a.fname || ' ' || a.lname) "Author" 
  FROM books b JOIN publisher p ON b.pubid = p.pubid
               JOIN bookauthor ba ON b.isbn = ba.isbn
               JOIN author a ON ba.authorid = a.authorid
    ORDER BY b.title, a.lname;
    
--Problem 5

SELECT c.customer# "Customer #", INITCAP(c.firstname || ' ' || c.lastname) "Customer",
       NVL2(c.referred, INITCAP(r.firstname || ' ' || r.lastname), 'N/A') "Referred By"
  FROM customers c LEFT JOIN customers r ON c.referred = r.customer#
    ORDER BY c.customer#;
  