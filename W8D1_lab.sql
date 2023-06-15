#Here are all pairs of actors that worked together.
SELECT
	concat(a1.first_name, " ", a1.last_name) as "Actor 1",
	concat(a2.first_name, " ", a2.last_name) as "Actor 2", 
	film.title
FROM 
	film_actor fa1
JOIN 
	film_actor fa2 ON fa1.film_id = fa2.film_id
AND 
	fa1.actor_id != fa2.actor_id
JOIN 
	actor a1 ON a1.actor_id = fa1.actor_id
JOIN 
	actor a2 ON a2.actor_id = fa2.actor_id
JOIN 
	film ON film.film_id = fa1.film_id;

#Here are all pairs of customers that have rented the same film more than 3 times.

SELECT
    r1.customer_id,
    r2.customer_id
FROM
    rental r1
JOIN
    rental r2 ON r1.inventory_id = r2.inventory_id AND r1.customer_id < r2.customer_id
GROUP BY
    r1.customer_id, r2.customer_id
HAVING
    COUNT(*) > 3;


#Here are all possible pairs of actors and films.

CREATE TEMPORARY TABLE ACTOR_ID
SELECT DISTINCT actor_id from actor;

CREATE TEMPORARY TABLE FILM_ID
SELECT DISTINCT film_id from film;

SELECT * FROM ACTOR_ID
CROSS JOIN FILM_ID;