/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */


SELECT DISTINCT actor.first_name, actor.last_name
FROM actor
JOIN
	-- actor ids of actors who have never appeared in a horror film
	(
	-- All actors
	SELECT actor.actor_id 
	FROM ACTOR

	LEFT JOIN
		-- All actors who have appeared in a horror film 
		(
		SELECT actor.actor_id
		FROM actor
		JOIN film_actor USING (actor_id)
		JOIN film USING (film_id)
		JOIN film_category USING (film_id)
		JOIN category USING (category_id)
		WHERE category.name = 'Horror'
		) as has
	ON actor.actor_id = has.actor_id
	WHERE has.actor_id IS NULL
	) as idh

USING (actor_id)
-- All actors who appeared in a childrens movie
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
WHERE category.name = 'Children'
ORDER BY actor.last_name ASC, actor.first_name ASC
