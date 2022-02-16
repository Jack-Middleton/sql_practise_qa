USE movielens;

/* Question 1 */
SELECT release_date, title
FROM movies
WHERE release_date BETWEEN '1983-01-01' AND '1993-01-01'
ORDER BY release_date desc;

/* Question 2 */
SELECT mo.title, AVG(ra.rating)
FROM movies mo
JOIN ratings ra
ON ra.id=mo.id
ORDER BY ra.rating asc;


/* Question 3 */
SELECT DISTINCT *
FROM ratings ra
JOIN users us
ON us.id=ra.user_id
JOIN genres ge
ON ge.id=ra.movie_id
WHERE us.gender = "M" AND us.age=24 and ge.name="Sci-Fi";

/* Question 4 */
SELECT DISTINCT release_date, title
FROM movies 
WHERE release_date = '1995-01-01';

/* Question 5 */
SELECT COUNT(mo.id) AS no_of_movies, ge.name
FROM movies mo 
JOIN genres_movies gm
ON gm.movie_id=mo.id
JOIN genres ge
ON ge.id=gm.genre_id
GROUP BY ge.name
ORDER BY no_of_movies asc;
