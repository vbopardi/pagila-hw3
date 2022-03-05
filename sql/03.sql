/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

 SELECT country.country, sum(payment.amount) as total_payments
 FROM payment
 INNER JOIN customer
 ON customer.customer_id = payment.customer_id
 INNER JOIN address
 ON address.address_id = customer.address_id
 INNER JOIN city
 ON city.city_id = address.city_id
 INNER JOIN country
 ON country.country_id = city.country_id
 GROUP BY country.country
 ORDER BY total_payments DESC, country.country
