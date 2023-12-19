-- Exercise1: grab the frist and last names of every customer and their email address

SELECT first_name, last_name, email FROM customer;

-- Exercise2: Distinct - used to return only the disting values in a column
SELECT * FROM film;

--Exercise3: Wich is ther years of release of the films?
SELECT DISTINCT release_year FROM film;

--Exercise4:How many rental rates we have?
SELECT DISTINCT rental_rate from film;

--Exercise5: what ratings do we have avalible?
SELECT DISTINCT rating from film;

-- Exercise6: number of rows in the table
SELECT COUNT(*) FROM payment;

--Exercise7: what is the amout /payment
SELECT amount FROM payment;

--Exercise8: WHAT ARE THE VALUES OF EXCLUSIVE PAYMENTS? (all the unique)
--in this case the values are unique, duplicates are not counted
SELECT DISTINCT amount FROM PAYMENT;

-- Exercise9: How many different quantities are there? (whatever the result is, how many?)
-- in this case is ineed to use the pharentesis to specify how many different quantities whaterver the results is
SELECT COUNT (DISTINCT amount) FROM PAYMENT;

-- Exercise10: Who have the vrist name Jared?
SELECT * FROM customer
WHERE first_name = 'Jared'

-- Exercise11: what rental rate is more than 4 dollers?
SELECT * FROM FILM
WHERE rental_rate > 4;

--Exercise12: what rental reate is more than 4 dollars and also replacement cost is gratter than 19.99
SELECT * FROM FILM
WHERE rental_rate > 4 AND replacement_cost > 19.99;

--Exercise13: what title is more than 5 dollars and also replacement cost is gratter than 25.99
SELECT title FROM film
WHERE rental_rate > 5 AND replacement_cost > 25.99;


--Exercise14: How many films have the rating 'r' and rating 'PG-13'?
SELECT COUNT (*) FROM film
WHERE rating = 'R' or rating = 'PG-13';

-- Exercise15: What/How many is the films that dont have the rating equal 'R'?
SELECT * FROM film
WHERE rating != 'R'


SELECT count(*) FROM film
WHERE rating != 'R' 

--Exercise 16 A customer forgot their wallet at our store.We need to track down their email to inform them.
--What is the email for the customer with the name 'Nancy Thomas'?

SELECT email FROM customer
where first_name = 'Nacy' and last_name = 'Thomas';

--Exercise 17 A customer wants to know what the movie "outlaw Hanky" is about. 
--Could you give them the description form the movie "Outlaw Hanky"?

SELECT description FROM film
WHERE title = 'Outlaw Hanky'

----Exercise 18 A customer is late on their movie return, and we have mailed them a letter to their address at '259 Ipoh Drive'. We should also call them on the phone to let them know.
-- Can you get the phone numer for the customer who lives at '259 Ipoh Drive'?
SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

-- Exercise 19 Customer order by frist name asc
SELECT * FROM customer
ORDER BY first_name ASC

-- Exercise 20 what is the customer  id and frist name in ASC order
SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id ASC, first_name ASC

-- Exercise 21 Selecionar o pagemento, ordenar por data de pagamento,
-- WHAT IS THE five row of payment more recent accordly with payment data where the amount is not 0.00
SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5;

-- Exercise 22 We want to reward our frist 10 payment customers. 
-- What are the customer ids of the frist 10 customers who created a payment?

SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10

-- Exercise 23 A cu wants to quickly rent a video to watch over their short lunch break. 
-- What are the titles of the 5 shorterst in length of runtime movies?

SELECT title, length FROM  film -- take care with length that match with sql key word
ORDER BY length ASC
LIMIT 5;

-- -- Exercise 24 iF THE PREVIOUS CU (EXERCISE 23) can watch any movie that is 50 min or less in run time, how many options does she have?
SELECT COUNT (title) FROM film
WHERE length <= 50

-- -- Exercise 25 Select the payment between values 08 and 09

SELECT * FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT COUNT(*) FROM payment --se how many
WHERE amount BETWEEN 8 AND 9;

SELECT COUNT(*) FROM payment --see how many the ones that is not between 8 and 9
WHERE amount NOT BETWEEN 8 AND 9;

-- -- Exercise 26 All the payment that been made in the first semester '2007-02-01' AND '2007-02-14'
-- ps.: dealing with date there is also hours e isso afeta a logic
-- in this case I need to go until 15th to includ all data from 14th

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15'

-- -- Exercise 27 Payment the ammout 0.99, 1.99,1.98
SELECT * FROM payment
WHERE amount IN (0.99, 1.99,1.98)
order by amount

-- Exercise 27 There is customer with name 'John', 'Julie', 'Jake', 'Maria'?
SELECT * FROM customer
WHERE first_name IN ('John', 'Julie', 'Jake', 'Maria')


-- Exercise 28 People who have name stated with 'J'
-- ps.: In this case is ineed to be capslook (sensitive)
SELECT * FROM customer
WHERE first_name LIKE 'J%'

--How many
SELECT COUNT(*) FROM customer
WHERE first_name LIKE 'J%'

-- Exercise 29 People that the first letter is 'S'
-- In this case is ineed to be capslook (sensitive)
SELECT COUNT(*) FROM customer
WHERE first_name LIKE 'S%'

---- Exercise 30 People who has 'er' in the frist name
SELECT * FROM customer
WHERE first_name LIKE '%er%'

--how many?
SELECT COUNT(*) FROM customer
WHERE first_name LIKE '%er%'

-- Exercise 31 People who have 'er' at the second letter 'e' and third 'r'? 
SELECT COUNT(*) FROM customer
WHERE first_name LIKE '_er%'

--Exercise 32 not have er in the name
SELECT COUNT(*) FROM customer
WHERE first_name NOT LIKE '%er%'

--EXERCISE 33 How many payemnt transactions were greater than $5.00?
SELECT amount FROM payment
WHERE amount > 5.00
--How many
SELECT COUNT(amount) FROM payment
WHERE amount > 5.00

--EXERCISE 34 How many actors have a frist name that starts with the letter P?
SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%'

--EXERCISE 35 How many districts are our customers from?
SELECT COUNT(DISTINCT district) FROM address

--EXERCISE 36 Retrieve the list of names for those distinct district from the previous question
SELECT DISTINCT district  FROM address

--EXERCISE 37 How many films have a rating of R and a replacemnt cost between $5 and $15?
SELECT COUNT(*) FROM FILM
WHERE RATING = 'R' AND replacement_cost BETWEEN 5 AND 15

--EXERCISE 38 How many films have the word Truman somewere in the title?
SELECT COUNT (*) FROM film
WHERE title LIKE '%Truman%'