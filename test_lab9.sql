USE sakila;

-- 1. How many distinct (different) actors' last names are there? -121
SELECT COUNT(DISTINCT a.last_name)
FROM sakila.actor a;

-- 2. Add an additional column day_type with values 'weekend' and
--  'workday' depending on the rental day of the week.
SELECT *, CASE
WHEN WEEKDAY(rental_date) BETWEEN 5 AND 6 THEN 'weekend'
ELSE 'workday'
END AS day_type
FROM sakila.rental r;

-- 3. Get all films with ARMAGEDDON in the title.
SELECT *
FROM sakila.film f
WHERE title like "%ARMAGEDDON%";

-- 4. Get 10 the longest films.
SELECT *
FROM sakila.film f
ORDER BY f.length DESC
LIMIT 10;

-- 5. How many films include Behind the Scenes content?
SELECT COUNT(film_id)
FROM sakila.film f
WHERE f.special_features like "%Behind the Scenes%";

-- 6. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT f.rating,avg(length) as avg_length
FROM sakila.film f
GROUP BY f.rating
HAVING avg_length >120;

-- 7. Rank films by length (filter out the rows that have nulls or 0s in length 
-- column). In your output, only select the columns title, length, and the rank.
SELECT f.title,f.length
FROM sakila.film f
WHERE f.length IS NOT NULL AND f.length > 0
ORDER BY f.length DESC;
