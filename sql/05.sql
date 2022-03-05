/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */


-- Get all pairs of actors who were in AMERICAN circus 
select title from (
    select title, count(actor_id) as "actor_count" from film 
    join film_actor using (film_id)
    where actor_id in (
        select actor_id from film_actor
        join film using (film_id)
        where film.title = 'AMERICAN CIRCUS'
    )
    group by title
)t
where "actor_count" > 1
order by title;
