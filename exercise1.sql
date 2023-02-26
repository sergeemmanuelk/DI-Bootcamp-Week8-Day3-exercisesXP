--Get a list of all film languages.
SELECT name FROM language;

--Get a list of all films joined with their languages – select the following details : film title, description, and language name. Try your query with different joins:
--Get all films, even if they don’t have languages.
SELECT f.title, f.description, l.name 
FROM film f 
LEFT JOIN language l ON f.language_id = l.language_id;

--Get all languages, even if there are no films in those languages.
SELECT f.title, f.description, l.name 
FROM language l 
LEFT JOIN film f ON l.language_id = f.language_id;

--Create a new table called new_film with the following columns : id, name. Add some new films to the table.
CREATE TABLE new_film (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO new_film (name) VALUES
('Avengers Endgame'),
('Doctor Strange in the Multiverse of Madness'),
('Thor : Ragnarok');

--Create a new table called customer_review, which will contain film reviews that customers will make.
--Think about the DELETE constraint: if a film is deleted, its review should be automatically deleted.
--It should have the following columns:
--review_id – a primary key, non null, auto-increment.
--film_id – references the new_film table. The film that is being reviewed.
--language_id – references the language table. What language the review is in.
--title – the title of the review.
--score – the rating of the review (1-10).
--review_text – the text of the review. No limit on the length.
--last_update – when the review was last updated.
CREATE TABLE customer_review (
    review_id SERIAL PRIMARY KEY,
    film_id INTEGER NOT NULL,
    language_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    score INTEGER NOT NULL,
    review_text TEXT NOT NULL,
    last_update TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (film_id) REFERENCES new_film(id) ON DELETE CASCADE,
    FOREIGN KEY (language_id) REFERENCES language(language_id) ON DELETE CASCADE
);


--Add 2 movie reviews. Make sure you link them to valid objects in the other tables.
INSERT INTO customer_review (film_id, language_id, title, score, review_text) VALUES
(1, 1, 'Academy Dinosaur', 9, 'Great movie'),
(2, 2, 'Ace Goldfinger', 7, 'Amazing movie');

--Delete a film that has a review from the new_film table, what happens to the customer_review table?