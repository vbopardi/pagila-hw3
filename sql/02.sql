/*
 * Compute the country with the most customers in it. 
 */

SELECT country
FROM
	(
	SELECT country.country, count(customer_id) as ct
	FROM customer
	INNER JOIN address
	ON address.address_id = customer.address_id
	INNER JOIN city
	ON city.city_id = address.address_id
	INNER JOIN country
	ON country.country_id = city.country_id
	GROUP BY country.country
	ORDER BY ct DESC
	) as ranked
LIMIT 1
