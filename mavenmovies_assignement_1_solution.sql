USE mavenmovies; -- Making the database as Default Schema

/*
Assignment: 1
Pull the list of first_name, last_name and email of each of our customers
*/ 

-- Solution: 1
SELECT
	first_name,
    last_name,
    email
FROM customer;

/*
Assignment: 2
Pull the record of the films and see if there are rental duations other then: 3,5 or 7 days
*/ 

-- Solution: 2
SELECT DISTINCT 
	rental_duration
FROM film;

/*
Assignment: 3
Pull the list of all payments from our first 100 customers
*/ 

-- Solution: 3
SELECT
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE customer_id BETWEEN 1 AND 100;

/*
Assignment: 4
Pull the list of payments over $5 for those same customers, since Jan-1-2006
*/ 

-- Solution: 4
SELECT
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE customer_id < 101
	AND amount > 5
	AND payment_date > '2006-01-01';
    
/*
Assignment: 5
Pull payments from those specific customers along with payments above $5 from any customer
*/ 

-- Solution: 5
SELECT
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE amount > 5
	OR customer_id IN (42,53,60,75);
    
/*
Assignment: 6
To understand the special feature in the film record, pull the list of all the films
which include 'Behind the Scenes' as special features
*/ 

-- Solution: 6
SELECT
	title,
    special_features
FROM film
WHERE special_features LIKE '%Behind the Scenes%';

/*
Assignment: 7
Count of all film titles sliced by rental duration
*/ 

-- Solution: 7
SELECT
	rental_duration,
    COUNT( DISTINCT title) AS title_count
FROM film
GROUP BY rental_duration
ORDER BY 2 DESC;

SELECT
	rental_duration,
    COUNT(film_id) AS total_films_with_rental_duration
FROM film
GROUP BY rental_duration
ORDER BY 2 DESC;

/*
Assignment: 8
Pull count of films, along with avg, min and max of rental rate grouped by replacement cost
*/ 

-- Solution: 8
SELECT
	replacement_cost,
	COUNT(film_id) as number_of_films,
    MIN(rental_rate) as chepaest_rental,
    MAX(rental_rate) as expensive_rental,
    AVG(rental_rate) as average_rental
FROM film
GROUP BY replacement_cost
ORDER BY 1 DESC;

/*
Assignment: 9
Pull the list of customer_id with less then 15 rentals all time
*/ 

-- Solution: 9
SELECT
	customer_id,
    COUNT(rental_id) as total_rental_all_time
FROM rental
GROUP BY customer_id
HAVING total_rental_all_time  < 15
ORDER BY total_rental_all_time DESC;

/*
Assignment: 10
Pull list of all film titles along with there length and rental rate and sort from longest to shortes
*/ 

-- Solution: 10
SELECT
	title,
    length,
    rental_rate
FROM film
ORDER BY length DESC;

/*
Assignment: 11
Find out the names of all customers along with there store they prefer and are they active on them or not
*/ 

-- Solution: 11
SELECT
	first_name,
    last_name,
    CASE
		WHEN store_id = 1 AND active = 1 Then 'store 1 active'
        WHEN store_id = 1 AND active = 0 Then 'store 1 inactive'
        WHEN store_id = 2 AND active = 1 Then 'store 2 active'
        WHEN store_id = 2 AND active = 0 Then 'store 2 inactive'
		ELSE 'check again!!'
	END AS 'store_&_status'
FROM customer;

/*
Assignment: 12
How many inactive customers we have at each store
*/ 

-- Solution: 12
SELECT 
    COUNT(CASE WHEN store_id = 1 AND active = 0 THEN customer_id ELSE NULL END) AS store_1_inactive_customers,
    COUNT(CASE WHEN store_id = 2 AND active = 0 THEN customer_id ELSE NULL END) AS store_2_inactive_customers
FROM customer;

/*
Assignment: 13
How many active and inactive customers we have at each store
*/ 

-- Solution: 13
SELECT
	store_id,
    COUNT(CASE WHEN active = 1 THEN customer_id ELSE NULL END) AS active_customers,
    COUNT(CASE WHEN active = 0 THEN customer_id ELSE NULL END) AS inactive_customers
FROM customer
GROUP BY store_id;

-- THE END

	

    


