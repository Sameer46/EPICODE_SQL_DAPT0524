/*
Esercizio 1
Effettuate un’esplorazione preliminare del database. Di cosa si tratta? 
Quante e quali tabelle contiene? Fate in modo di avere un’idea abbastanza chiara riguardo a con cosa state lavorando.
*/
SELECT * 
FROM actor;

SELECT *
FROM film;

SELECT *
FROM CUSTOMER;

/*
Esercizio 2 Scoprite quanti clienti si sono registrati nel 2006
*/
SELECT COUNT(*) AS CLIENTI_REGISTRATI_NEL_2006
FROM customer
WHERE create_date >= '2006-01-01' AND create_date <= '2006-12-31';


/*
Esercizio 3 
Trovate il numero totale di noleggi effettuati il giorno 1/1/2006.
*/

SELECT COUNT(*) AS NOLEGGI
FROM rental
WHERE rental_date = '2006-01-01';

/*
Esercizio 4 
Elencate tutti i film noleggiati nell’ultima settimana e tutte le informazioni legate al cliente che li ha noleggiati.
*/

SELECT 
    r.rental_date,
    f.title AS film_titolo,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.create_date AS registrazione,
    a.address
FROM 
    rental r
    INNER JOIN inventory i ON r.inventory_id = i.inventory_id
    INNER JOIN film f ON i.film_id = f.film_id
    INNER JOIN customer c ON r.customer_id = c.customer_id
    INNER JOIN address a ON c.address_id = a.address_id
WHERE 
    r.rental_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY);


/*
Esercizio 5 
Calcolate la durata media del noleggio per ogni categoria di film.
*/

SELECT 
    c.name AS category_name,
    AVG(DATEDIFF(r.return_date, r.rental_date)) AS Media
FROM 
    rental r
    INNER JOIN inventory i ON r.inventory_id = i.inventory_id
    INNER JOIN film f ON i.film_id = f.film_id
    INNER JOIN film_category fc ON f.film_id = fc.film_id
    INNER JOIN category c ON fc.category_id = c.category_id
WHERE 
    r.return_date IS NOT NULL
GROUP BY 
    c.name
ORDER BY 
    Media DESC;
    
    
/*
Esercizo 6
Trovate del noleggio piu lungo 
*/

SELECT 
    r.rental_id,
    f.title AS film_title,
    c.customer_id,
    c.first_name,
    c.last_name,
    DATEDIFF(r.return_date, r.rental_date) AS noleggio
FROM 
    rental r
    INNER JOIN inventory i ON r.inventory_id = i.inventory_id
    INNER JOIN film f ON i.film_id = f.film_id
    INNER JOIN customer c ON r.customer_id = c.customer_id
WHERE 
    r.return_date IS NOT NULL
ORDER BY 
    rental_duration DESC
LIMIT 1;

/*

*/
