CREATE DATABASE assignment_2;

CREATE TABLE results (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    respondent VARCHAR(255),
    Oppenheimer INT,
    Barbie INT,
    Uncut_Gems INT,
    Borat_2 INT,
    Dune INT,
    Elvis INT
);

INSERT INTO results (respondent, Oppenheimer, Barbie, Uncut_Gems, Borat_2, Dune, Elvis)
VALUES
    ("Abaye", 4, NULL, NULL, 2, 4, NULL),
    ("Buki", 4, NULL, 4, 3, NULL, NULL),
    ("Ami", 3, 4, 4, 4, NULL, NULL),
    ("Max", NULL, NULL, 4, 2, NULL, NULL),
    ("Samantha", NULL, 1, NULL, 5, NULL, 4),
    ("Alex", 3, NULL, 4, 5, 5, NULL),
    ("Emma", NULL, 4, NULL, NULL, NULL, NULL),
    ("Anjali", 4, 5, NULL, NULL, NULL, 3),
    ("Kendall", NULL, 4, NULL, 3, NULL, 4);
    
CREATE TABLE people(
person_id INT AUTO_INCREMENT PRIMARY KEY,
person_name VARCHAR(255)
);

CREATE TABLE films(
film_id INT AUTO_INCREMENT PRIMARY KEY,
film_name VARCHAR(255) 
);

CREATE TABLE reviews_all(
review_id INT AUTO_INCREMENT PRIMARY KEY,
person_id INT,
film_ID INT,
review int,
FOREIGN KEY (person_id) REFERENCES people (person_id),
FOREIGN KEY (film_id) REFERENCES films (film_id)
); 

INSERT INTO people (person_name) 
SELECT DISTINCT respondent FROM results;

INSERT INTO films (film_name) 
VALUES
("Oppenheimer"),
("Barbie"),
("Uncut_Gems"),
("Borat_2"),
("Dune"),
("Elvis");

INSERT INTO reviews_all (person_id, film_id, review)
SELECT
    people.person_id,
    films.film_id,
    CASE
        WHEN films.film_name = 'Oppenheimer' THEN results.Oppenheimer
        WHEN films.film_name = 'Barbie' THEN results.Barbie
        WHEN films.film_name = 'Uncut_Gems' THEN results.Uncut_Gems
        WHEN films.film_name = 'Borat_2' THEN results.Borat_2
        WHEN films.film_name = 'Dune' THEN results.Dune
        WHEN films.film_name = 'Elvis' THEN results.Elvis
    END AS review
FROM results 
JOIN people ON results.respondent = people.person_name
JOIN films ON
    films.film_name IN ('Oppenheimer', 'Barbie', 'Uncut_Gems', 'Borat_2', 'Dune', 'Elvis');
    
SELECT USER();'root@localhost'
