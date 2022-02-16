USE sakila;

/* Question 1 */
SELECT * FROM actor;

/* Question 2 */
SELECT last_name
FROM actor 
WHERE first_name="John";

/* Question 3 */
SELECT * FROM actor
WHERE last_name="Neeson";

/* Question 4 */
SELECT * FROM actor
WHERE actor_id % 10 = 0;

/* Question 5 */
SELECT description FROM film 
WHERE film_id=100;

/* Question 6 */
SELECT rating FROM film
WHERE rating="R";

/* Question 7 */
SELECT rating FROM film 
WHERE rating!="R";

/* Question 8 */
SELECT title, length FROM film
ORDER BY length asc
LIMIT 10;

/* Question 9 */
SELECT title, length FROM film
WHERE length=(
SELECT MAX(length) FROM film
);

/* Question 10 */
SELECT title, special_features FROM film
WHERE special_features LIKE "%Deleted Scenes%";

/* Question 11 */
SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) < 2;

/* Question 12 */
SELECT last_name, COUNT(last_name)
FROM actor 
GROUP BY last_name
HAVING COUNT(last_name) > 1
ORDER BY COUNT(last_name) desc;

/* Question 13 */
SELECT first_name, last_name, COUNT(film_id) AS total_films
FROM actor ac
JOIN film_actor fa
ON ac.actor_id=fa.actor_id
GROUP BY first_name
ORDER BY total_films desc
LIMIT 1;

/* Question 14 */
SELECT film.title, rental_date, DATE_ADD(rental_date,INTERVAL rental_duration day) AS due_date, return_date
FROM rental 
JOIN inventory
ON rental.inventory_id=inventory.inventory_id
JOIN film 
ON inventory.film_id=film.film_id
WHERE film.title="Academy Dinosaur" AND return_date IS NULL;

/* Question 15 */
SELECT AVG(length) AS average_runtime FROM film;

/* Question 16 */
SELECT ca.name, AVG(f.length) 
FROM film f
JOIN film_category fc
ON f.film_id=fc.film_id
JOIN category ca
ON ca.category_id=fc.category_id
GROUP BY ca.name;

/* Question 17 */
SELECT title, description FROM film
WHERE description LIKE "%Robot%";

/* Question 18 */
SELECT COUNT(title), release_year AS released_2010
FROM film
WHERE release_year=2010;

/* Question 19 */
SELECT  f.title, c.name
FROM film f
JOIN film_category fc
ON f.film_id=fc.film_id
JOIN category c
ON fc.category_id=c.category_id
WHERE c.name="Horror";

/* Question 20 */
SELECT staff_id, first_name, last_name
FROM staff
WHERE staff_id=2;

/* Question 21 */
SELECT a.first_name, a.last_name, f.title
FROM film f
JOIN film_actor fa
ON f.film_id=fa.film_id
JOIN actor a
ON a.actor_id=fa.actor_id
WHERE a.first_name="Fred" AND a.last_name="Costner";

/* Question 22 */
SELECT DISTINCT COUNT(country)AS unique_countries FROM country;

/* Question 23 */
SELECT name FROM language
ORDER BY name desc;

/* Question 24 */
SELECT first_name, last_name 
FROM actor 
WHERE last_name LIKE "%son"
ORDER BY first_name;

/* Question 25 */
SELECT c.name, COUNT(fc.film_id) AS total_films
FROM film f
JOIN film_category fc
ON f.film_id=fc.film_id
JOIN category c
ON c.category_id=fc.category_id
GROUP BY c.name
ORDER BY total_films desc
LIMIT 1;