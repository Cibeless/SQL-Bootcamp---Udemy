-- SQL - Udemy Exercise Group by

--Ps.:AGGREGATE FUNCTIONS
SELECT AVG(replacement_cost) FROM film
SELECT MAX(replacement_cost) FROM film

--The number two (2) means that two places after the decimal point in the AVG result
SELECT ROUND (AVG(replacement_cost),2) FROM film
 
--GROUP BY
-- SELECT *category, AGG(data) FROM table GROUP BY *category
--Group by clause must appear right after a from or where statement
--FROM --> WHERE --> GROUP BY
--The select statement must be the same of the group by statement
-- The only excessao se eu chaar uma função de agregada em uma coluna propria

--Exercise 1 - Please, group the customer id
SELECT customer_id FROM payment
GROUP BY customer_id
ORDER BY customer_id

--Exercise 2 - who is spending mor money in total?
-- total sum amount per cu id
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount)DESC

--Exercise 3 - In the previews case, wich is the number of transations
SELECT customer_id, COUNT (amount) FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount)DESC

--Exercise 3 - How much each customer spend?
SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id

--Exercise 4 - Goup by the date
-- date is a function in this case, is remove the time stamp - to be able to group by day
--DATE FUNCTION = extract only the day part of this information and remove the time

SELECT date(payment_date) FROM payment
GROUP BY DATE (payment_date)

--Exercise 5 - How much have been processed in each day?
--DATE FUNCTION = extract only the day part of this information and remove the time
SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE (payment_date)
ORDER BY SUM (amount) DESC

--*Exercise 6 -
--We have two staff embers, with Staff IDs 1 and 2. We want to give a bonus to the 
--staff member that handled the most payments (in terms of number of payment processed )
--How many payments did each staff member handle and who gets the bonus?

SELECT staff_id, COUNT(amount) FROM payment
GROUP BY staff_id

--Exercise 7 -
-- Corporte HQ is conducting a study on the relationship between replacement cost and movie MPA rating
-- What is the AVG replacemtn cost per MPAA rating
---Note: You may need to expand the AVG column to view correct results
-- rating
-- AVG replacement_cost
SELECT * FROM film

SELECT rating, ROUND (AVG(replacement_cost), 2) FROM film
GROUP BY rating

--Exercise 8 - 
--We are running a promotion to reward our top 5 customer with coupons
-- What are the customer ids of the top 5 customers by total spend?
-- customer_id 

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5

--Exercise 8 - wht customer Id SUM amounts bigger than 100
SELECT customer_id, SUM(amount)  FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100

--Exercise 9 - Number of customer per store
SELECT * FROM customer

SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id

--Exercise 10 - Number of customer per store with more than 300 clients

SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT (customer_id)>300

--Exercise 11 - 
--We are launching a platinum service for our most loyal customer.
--We will assign platinum status to customers that have had 40 or more transactions payments.
--What customer_ids are elegible for platinum status?
-- loyal cu - 40 or transactions

SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40
ORDER BY COUNT (amount)

--Exercise 12 - 
--Who are the customer ids of customers who have spent more than $100 in payment transactions with our staff_id member 2?
SELECT * FROM payment

SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >100 

--Exercise 13 -
--Return the customer IDs of customer who have spent at least $100 with the staff member who has a ID of 2?
SELECT * FROM payment

SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >110


--Exercise 14 - How many films begin with the letter J?
SELECT COUNT(title) FROM FILM
WHERE title LIKE 'J%'

--Exercise 15 - What customer has the highest customer ID numer whose 
--name stars with an 'E' and has an address ID lower than 500?

SELECT * FROM customer

SELECT first_name, last_name FROM customer
WHERE first_name like 'E%'
HAVING address_id < 500 
ORDER BY customer_id dESC
LIMIT 1;