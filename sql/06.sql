/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

-- Get films with russell bacall

SELECT DISTINCT concat(first_name, ' ',  last_name) 
as "Actor Name" 
FROM actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
WHERE film.title IN 
	(
	SELECT title
	FROM FILM
	JOIN film_actor USING (film_id)
	JOIN actor USING (actor_id)
	WHERE actor.first_name = 'RUSSELL'
	AND actor.last_name = 'BACALL'
	) 
AND actor.last_name != 'BACALL'
ORDER BY "Actor Name" ASC
