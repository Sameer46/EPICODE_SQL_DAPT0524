/*
Esercizio 1 Identificate tutti i clienti che non hanno effettuato nessun noleggio a gennaio 2006.
*/
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.create_date
FROM 
    customer c
WHERE 
    c.customer_id NOT IN (
        SELECT 
            r.customer_id
        FROM 
            rental r
        WHERE 
            r.rental_date >= '2006-01-01' AND r.rental_date < '2006-02-01'
    );

/*
Esercizio 2 
Elencate tutti i film che sono stati noleggiati più di 10 volte nell’ultimo quarto del 2005
*/
SELECT 
    f.title, 
    COUNT(*) AS noleggio
FROM 
    rental r
    INNER JOIN inventory i ON r.inventory_id = i.inventory_id
    INNER JOIN film f ON i.film_id = f.film_id
WHERE 
    r.rental_date >= '2005-10-01' AND r.rental_date <= '2005-12-31'
GROUP BY 
    f.title
HAVING 
    COUNT(*) > 10
ORDER BY 
    noleggio DESC;

-- usanto la funzione
SELECT 
    f.title, 
    COUNT(*) AS noleggio
FROM 
    rental r
INNER JOIN 
    inventory i ON r.inventory_id = i.inventory_id
INNER JOIN 
    film f ON i.film_id = f.film_id
WHERE 
    QUARTER(r.rental_date) = 4 AND YEAR(r.rental_date) = 2005
GROUP BY 
    f.title
HAVING 
    COUNT(*) > 10
ORDER BY 
    noleggio DESC;


/*
Esercizio 3 
Trovate il numero totale di noleggi effettuati il giorno 1/1/2006.
*/
SELECT 
    COUNT(*) AS NOLEGGI
FROM
    rental r
WHERE
    r.rental_date = '2006-01-01';


/*
Esercizio 4 
Calcolate la somma degli incassi generati nei weekend (sabato e domenica).
*/
SELECT 
    SUM(p.amount) AS totale_incassi_weekend
FROM 
    payment p
    INNER JOIN rental r ON p.rental_id = r.rental_id
WHERE 
    DAYOFWEEK(r.rental_date) IN (1, 7);

/*
Esercizio 5 
Individuate il cliente che ha speso di più in noleggi
*/
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS totale_speso
FROM 
    payment p
    INNER JOIN rental r ON p.rental_id = r.rental_id
    INNER JOIN customer c ON r.customer_id = c.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    totale_speso DESC
LIMIT 1;
  


/*
Esercizio 6
Elencare 5 film con la durata media piu lunga
*/
SELECT 
    f.title, 
    f.length AS durata_media
FROM 
    film f
ORDER BY 
    f.length DESC
LIMIT 5;


/*
Esercizio 7 
Calcolate il tempo medio tra due noleggi consecutivi da parte di un cliente.
*/
WITH RentalDifferences AS (
    SELECT 
        r.customer_id,
        r.rental_id,
        DATEDIFF(r2.rental_date, r.rental_date) AS differenza_giorni
    FROM 
        rental r
    INNER JOIN 
        rental r2 ON r.customer_id = r2.customer_id AND r.rental_date < r2.rental_date
)

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    AVG(differenza_giorni) AS avg
FROM 
    RentalDifferences rd
INNER JOIN 
    customer c ON rd.customer_id = c.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    avg;





WITH RankedRentals AS (
    SELECT 
        rental_id,
        customer_id,
        rental_date,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY rental_date) AS rn
    FROM 
        rental
)

SELECT 
	c.customer_id,
    c.first_name,
    c.last_name,
    AVG(DATEDIFF(r2.rental_date, r1.rental_date)) AS avg_days_between_rentals
FROM 
    RankedRentals r1
JOIN 
    RankedRentals r2 ON r1.customer_id = r2.customer_id 
    AND r1.rn = r2.rn - 1
    JOIN 
    customer c ON r1.customer_id = c.customer_id-- This ensures we are getting consecutive rentals
WHERE 
    r1.rental_date IS NOT NULL 
    AND r2.rental_date IS NOT NULL
    GROUP BY 
    c.customer_id, c.first_name, c.last_name;


















/*
Esercizio 8 
Individuate il numero di noleggi per ogni mese del 2005.
*/

SELECT 
    MONTH(r.rental_date) AS mese,
    COUNT(*) AS numero_noleggi
FROM 
    rental r
WHERE 
    YEAR(r.rental_date) = 2005
GROUP BY 
    MONTH(r.rental_date)
ORDER BY 
    mese;

/*
Esercizio 9 
Trovate i film che sono stati noleggiati almeno due volte lo stesso giorno.
*/

SELECT 
    f.title,
    date(r.rental_date),
    COUNT(*) AS numero_noleggi
FROM 
    rental r
INNER JOIN 
    inventory i ON r.inventory_id = i.inventory_id
INNER JOIN 
    film f ON i.film_id = f.film_id
GROUP BY 
    f.title, date(r.rental_date)
HAVING 
    COUNT(*) >= 2
ORDER BY 
     date(r.rental_date), f.title;




/*
Esercizio 10 
Calcolate il tempo medio di noleggio.
*/

SELECT 
    AVG(DATEDIFF(r.return_date, r.rental_date)) AS tempo_medio_noleggio
FROM 
    rental r
WHERE 
    r.return_date IS NOT NULL;
