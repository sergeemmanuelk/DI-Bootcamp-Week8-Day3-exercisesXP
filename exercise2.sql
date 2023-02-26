--Use UPDATE to change the language of some films. Make sure that you use valid languages.
UPDATE film
SET language_id = 5
WHERE film_id IN (10, 20, 30);

--Which foreign keys (references) are defined for the customer table? How does this affect the way in which we INSERT into the customer table?


--We created a new table called customer_review. Drop this table. Is this an easy step, or does it need extra checking?
DROP TABLE customer_review;

--Find out how many rentals are still outstanding (ie. have not been returned to the store yet).
SELECT COUNT(*)
FROM rental
WHERE return_date IS NULL;

--Find the 30 most expensive movies which are outstanding (ie. have not been returned to the store yet)
SELECT f.title, r.return_date
FROM film f
INNER JOIN inventory i ON i.film_id = f.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
WHERE r.return_date IS NULL
ORDER BY f.rental_rate DESC
LIMIT 30;

--Your friend is at the store, and decides to rent a movie. He knows he wants to see 4 movies, but he can’t remember their names. Can you help him find which movies he wants to rent?
--The 1st film : The film is about a sumo wrestler, and one of the actors is Penelope Monroe.
SELECT *
FROM film f
INNER JOIN film_actor fa ON fa.film_id = f.film_id
INNER JOIN actor ac ON ac.actor_id = fa.actor_id
WHERE ac.first_name = 'Penelope' AND ac.last_name = 'Monroe'
AND f.description ILIKE '%sumo wrestler%';

--The 2nd film : A short documentary (less than 1 hour long), rated “R”.
SELECT *
FROM film f
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON c.category_id = fc.category_id
WHERE f.rating = 'R'
AND f.length < 60
AND c.name = 'Documentary';

--The 3rd film : A film that his friend Matthew Mahan rented. He paid over $4.00 for the rental, and he returned it between the 28th of July and the 1st of August, 2005.

--The 4th film : His friend Matthew Mahan watched this film, as well. It had the word “boat” in the title or description, and it looked like it was a very expensive DVD to replace.