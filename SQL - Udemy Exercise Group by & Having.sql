--SQL - Udemy Exercise Group by & Having

-- *Exercise 01:
-- We are launching a platinum service for our most loyal customers. 
--We will assign platinum status to customers that have had 40 or more transactions payment
-- What customer_ids are elegible for platinum status

SELECT * FROM payment


SELECT customer_id, COUNT(*) FROM payment
GROUP BY customer_id
HAVING COUNT(*)>= 40


-- Exercise 02:
-- What are the ustomer ids of customeres have spent more than $100 in payment transactions with our staff id member 2?
-- cu that spent more than $100
-- payment transactions => staff_id =2

SELECT * FROM payment

SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100