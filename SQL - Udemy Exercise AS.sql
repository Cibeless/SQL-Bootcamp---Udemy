-- AS

-- diference between AS and without AS --> Exemplo 01 and Exemplo 02
-- Exemplo 01:Count the amout from the payment column
SELECT COUNT (amount) FROM payment

-- Exemplo 02:How many transactios occurrer?
SELECT COUNT (amount)  AS num_transactions FROM payment
-- or even 
SELECT COUNT (*)  AS num_transactions FROM payment

-- Exemplo 03: How may is the total spent by customer?
-- In this case is good to put the as to name de colum sum
SELECT customer_id, SUM (amount) AS total_spent
FROM payment
GROUP BY customer_id

-- Exemplo 04: Using Having for sum amout grather than 100 (> 100)
--NOTE: In this case the alias é added in the end so we cant do it
--ERROR:  column "total_spent" does not exist ( a coluna realmente nao existe, apenas apos data out put)
--If Alias is in the end you will not be able to use it
SELECT customer_id, SUM (amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING total_spent > 100

-- In this case is necessary the orginal one the original name ofr the column
-- In this case above, to use 'AS' it is necessary to return to the original name (sum (amout)) of the column and not the named name. See below how it is possible:
SELECT customer_id, SUM (amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM (amount) > 100


