USE mavenmovies;

/*
Assignment: 1
Pull list of film title, description, store id along with there inventory id
*/

-- Solution: 1
SELECT
	inventory.inventory_id,
    inventory.store_id,
	film.title,
    film.description
FROM film
INNER JOIN inventory
	ON film.film_id = inventory.inventory_id;
    
/*
Assignment: 2
How many actors for each film -  top 5 films from the list
*/

-- Solution: 2
SELECT
	film.title,
    COUNT(film_actor.actor_id) AS number_of_actors
FROM film
LEFT JOIN film_actor
	ON film.film_id = film_actor.film_id
GROUP BY 1
ORDER BY 2 DESC;

/*
Assignment: 3
List of all actors with each title they appear in 
*/

-- Solution: 3
SELECT
	actor.first_name,
    actor.last_name,
    film.title
FROM actor 
INNER JOIN film_actor
	ON actor.actor_id = film_actor.actor_id
INNER JOIN film
	ON film_actor.film_id = film.film_id
ORDER BY 1,2;

/*
Assignment: 4
Unique titels and description available at store 2 inventory 
*/

-- Solution: 4
SELECT DISTINCT 
	film.title,
    film.description
FROM film
INNER JOIN inventory
	ON film.film_id = inventory.film_id
    AND inventory.store_id = 2;
    
/*
Assignment: 5
first_name and last_name of all staff memebers and advisors with there type
*/

-- Solution: 5
SELECT
	'advisor' AS type,
	first_name,
    last_name
FROM advisor

UNION

SELECT
	'staff' AS type,
	first_name,
    last_name
FROM staff;

-- THE END




