--1.	Display the list of categories in alphabetical order according to the category name 
SELECT categoryname
FROM categories
ORDER BY categoryname ASC; 
 

--2.	Display the list of orders and their details (orderlines)
SELECT *
FROM orderlines
 

--3.	Update order date of the order number 2 (ordereid) to Jan 2, 2004 
UPDATE orders
SET orderdate = '2004-01-02'
WHERE orderid = 2;

UPDATE orderlines
SET orderdate = '2004-01-02'
WHERE orderid = 2;
 

--4.	Re-execute the query number 2. Is there any difference between the answer of these 2 queries 
Yes, the ordered=2 got moved to the bottom of table
 

--5.	Display the list of customers and their order if any 
SELECT C.customerid, C.firstname, C.lastname, C.email, O.orderid
FROM orders O JOIN customers C ON O.customerid=C.customerid;
 

--6.	Display the list of products appeared in the order(s) on Jan 1, 2004 
SELECT DISTINCT P.title, O.orderdate
FROM orderlines O JOIN products P ON O.prod_id=P.prod_id
WHERE O.orderdate='2004-01-01';
 

--7.	Delete all orders on Jan 1, 2004
DELETE FROM orderlines
WHERE orderdate='2004-01-01';
DELETE FROM orders
WHERE orderdate='2004-01-01';
 

--8.	Do you have any comment/remarks on the previous query (number 7)
I think we shouldn’t have done that.

--9.	Display the orders in January, 2004
SELECT O.*, P.title
FROM orders O JOIN orderlines OL ON O.orderid=OL.orderid
	JOIN products P ON OL.prod_id=P.prod_id
WHERE to_char(O.orderdate, 'MM-YYYY')='01-2004';
 

--10.	Display the list of customers whose credit card is expired in May 2012
SELECT *
FROM customers
WHERE creditcardexpiration > '2012/05';
 
--11.	Display the list of products and total ordered quantities per month
--1-- 
SELECT
    p.title AS product_title,
    EXTRACT(MONTH FROM ol.orderdate) AS order_month,
    SUM(ol.quantity) AS total_ordered_quantity
FROM
    orderlines ol
JOIN
    products p ON ol.prod_id = p.prod_id
GROUP BY
    p.title, order_month
ORDER BY
    p.title, order_month;
-----
--2--
SELECT
    p.prod_id,
    p.title AS product_title,
    EXTRACT(MONTH FROM ol.orderdate) AS order_month,
    EXTRACT(YEAR FROM ol.orderdate) AS order_year,
    SUM(ol.quantity) AS total_ordered_quantity
FROM
    products p
JOIN
    orderlines ol ON p.prod_id = ol.prod_id
JOIN
    orders o ON ol.orderid = o.orderid
GROUP BY
    p.prod_id, p.title, order_month, order_year
ORDER BY
    order_year, order_month, p.prod_id;
-----
--3--
SELECT
    p.prod_id,
    p.title,
    EXTRACT(MONTH FROM ol.orderdate) AS order_month,
    SUM(ol.quantity) AS total_ordered_quantity
FROM
    products p
JOIN
    orderlines ol ON p.prod_id = ol.prod_id
GROUP BY
    p.prod_id, p.title, EXTRACT(MONTH FROM ol.orderdate)
ORDER BY
    p.prod_id, order_month;
-----



--12.	Display the products that is not ordered yet 


SELECT P.*
FROM products P
WHERE P.prod_id NOT IN (
	SELECT OL.prod_id
	FROM orderlines OL
)
 
--13.	Display the customers and the total amount of their orders

 
SELECT C.firstname, C.lastname, C.customerid, t.cnt
FROM (
	SELECT C.customerid AS id, COUNT(DISTINCT O.customerid) AS cnt
	FROM customers C JOIN orders O ON C.customerid=O.customerid
	GROUP BY C.customerid
	) t JOIN customers C ON t.id=C.customerid; 

--14.	Display the list of states and the number of customers in each state if it is greater than 200 
SELECT C.state, COUNT(*)
FROM customers C
GROUP BY C.state
HAVING COUNT(*) > 200;
 
