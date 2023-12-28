--SQL - Udemy Exercise JFULL OUTER JOIN WITH WHERE

-- INNER JOIN 

--INNER JOIN = conjunto de registros correspondentes nas duas tabelas MATCH TABLES
-- the registration needs to be in both table
-- > intersection
-- ON is ineed to specify what table we are refering to 
--The table order wont matter in an INNER JOIN
-- is possible to find just JOIN in some softwares

-- Exercise 01: I want a table with payment table, emailpayment  id to show my boss:
-- In this case we got the resulto for all
SELECT * FROM payment -- all the tables
INNER JOIN customer 
ON payment.customer_id = customer.customer_id -- in this case: tenho que juntar uma coluna associada a tavela pagamento da tabela cliente (payment.customer_id)e um cliente destaca como id igual a tabela de cliente (customer.custmer_id)

-- to select just the table that you want
-- Ps1 - If I'm talking about a column that is present in only one of the tables, it is not necessary to specify (payment_id column) that it is in payment
-- Ps2 - If I am referring to something that can be found in both tables, IT IS NECESSARY TO SPECIFY (payment.customer_id)
-- In this case --> payemnt ID customer, ID and first name in the resulte
-- INNER JOIN payment and customer table only
-- ON = in this case: they must refer to the same thing

SELECT payment_id, payment.customer_id, first_name -- especify the table and colum payment_id (from payment table), the second is ineed to clarfy the table payment.custmoer (from payment table), the for an exclusively table frist name (from custmoer table)
FROM payment 
INNER JOIN customer 
ON payment.customer_id = customer.customer_id -- in this case: devem se referir a mesma coisa - tenho que juntar uma coluna associada a tavela pagamento da tabela cliente (payment.customer_id)e um cliente destaca como id igual a tabela de cliente (customer.custmer_id)


-- OUTER JOINS
-- OUTER JOINS = allow us to specify how to deal with values only present in one of the tables being joined
-- OUTER JOINS = FULL / LEFT / RIGHT

-- FULL OUTER JOIN = clarifyin WHERE null --> junção completa
-- all tables and column
-- null --> no values 

-- LEFT OUTER JOIN = WHERE null
-- RIGHT OUTER JOIN = WHERE null

-- FULL OUTER JOIN WITH WHERE --> GET ROWS UNI QUE TO EITHER TABLE
-- lines that is not find the the tables
-- seleciona tudo menos a intersseção entre os conjunots



--Exercise 01 -
--New privacy rules have been implemented and we must ensure that payment information is not attached to the customer or that we do not have any customer information that is not attached to any payment
--We want to ensure that every payment we have is associated with a current customer
--And that all the customers we have are associated with some payment history
--All customers we have must be associated with a payment
-- Não quero ter cliente que nao tenha feito pagamento historico
SELECT * FROM payment

-- FULL OUTER JOIN PEGA TUDO E JUNTA --> TODAS AS LINHAS EM TODAS AS TABELAS TUDO DE CUSTOMER E TUDO DE PAYMENT
SELECT * FROM customer
FULL OUTER JOIN payment -- todos os pagagmentos devem estar associados ao cliente e que os clientes estejam associados ao pagamento
ON customer.customer_id = payment.customer_id -- pega tudo e junta


-- Ps.: If I run this --> I have empty results: Não temos nenhuma informação de pagamento não associada a algum cliente
-- and we dont have email of a customer that never made a payment
-- Não há linhas que são completamente unicas 
-- Nâo há clientes ID que sao completamente exclusivos da tabela de clientes
-- *Se temos informações sobre o cliente é poque ele fez pagamento

SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id -- vamos filtrar para encontrar linhas que sao exclusivas apenas da tabela clientes
WHERE customer.customer_id IS null -- informações sobre clientes que nunca efetuou um pagamento ou que sao excluisvas da tabela
OR payment_id IS null-- informações excluisvaas sobre o pagamento da tabela de pagamento

-- to confirm the information below: just look the client id on the cliente table

SELECT COUNT(DISTINCT customer_id) FROM payment
--wich is the same amount of the customer 
SELECT COUNT(DISTINCT customer_id) FROM customer






































