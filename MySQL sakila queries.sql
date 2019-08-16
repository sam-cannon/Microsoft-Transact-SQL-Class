select actor_id, first_name, last_name,
rank() over (partition by actor_id order by last_name desc) name_rank
from actor;

#select distinct variables
select distinct last_name
from actor;

select * from payment

# select rows based on their conditional value
select amount
from payment
where amount > 10;

#select staff-id based on value of another column, this can be done with several columns as well
SELECT staff_id, customer_id
FROM payment
WHERE customer_id IN (1)

#selecting based on the beginning of a string in a column
SELECT first_name
FROM customer
WHERE first_name LIKE 'MA%'

#joining tables using an inner join (joining inventory and customer here) and aliasing tables/columns
SELECT i.inventory_id, c.first_name, c.last_name, c.email, i.film_id AS movie_id
FROM customer AS c
JOIN inventory AS i
ON c.store_id = i.store_id

#---------------------------------------------------window functions
##this is an average over the staff id column for amount
SELECT staff_id, avg(amount) OVER(PARTITION BY staff_id) as Average FROM payment

##avg window over amount and customer_id
SELECT customer_id, avg(amount) over(partition by rental_id) as customer_amount from payment order by customer_amount

#BE WARY, you cannot filter using aliases assigned to columns, 
# you must use the original column, so you could not filter with the 
#WHERE clause using 'return_year' becuase that is going to be executed
#last, so the name of the new column isn't created yet
SELECT rental_id, YEAR(return_date) AS return_year 
FROM rental
WHERE YEAR(return_date) < 2006;







