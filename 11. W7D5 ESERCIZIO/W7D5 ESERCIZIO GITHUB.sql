/*
Esercizio 1 
Elencate il numero di tracce per ogni genere in ordine discendente, escludendo quei generi che hanno meno di 10 tracce.
*/
SELECT 
    g.Name, COUNT(*) AS canzoni_per_genere
FROM
    track t
        INNER JOIN
    genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
HAVING COUNT(*) > 10
ORDER BY canzoni_per_genere DESC;


/*
Esercizio 2
Trovate le tre canzoni più costose.
*/
SELECT 
    T.Name CANZONE,
    T.UnitPrice PREZZO
FROM
    track t
ORDER BY t.UnitPrice DESC
LIMIT 10;

/*
Esercizio 3
Elencate gli artisti che hanno canzoni più lunghe di 6 minuti.
*/
SELECT ar.Name as nome, t.Name as canzone, t.Milliseconds as durata_canzone
FROM track t
INNER JOIN album a
ON t.AlbumId = a.AlbumId
INNER JOIN artist ar 
on a.ArtistId = ar.ArtistId
WHERE t.Milliseconds >  360000;


/*
Esercizio 4 
Individuate la durata media delle tracce per ogni genere.
*/
SELECT 
    g.Name, round(AVG(t.Milliseconds)/60000,2) AS MEDIA_DURATA
FROM
    track t
        INNER JOIN
    genre g ON t.GenreId = g.GenreId
GROUP BY g.Name;

/*
Esercizio 5 
Elencate tutte le canzoni con la parola “Love” nel titolo, ordinandole alfabeticamente prima per genere e poi per nome.
*/

SELECT 
    t.Name as canzone,
    g.Name as genere
FROM
    track t
        INNER JOIN
    genre g ON t.GenreId = g.GenreId
WHERE
    t.Name LIKE '%Love %'
ORDER BY t.Name , g.Name;

/*
WHERE T.NAME LIKE 'LOVE %'
or T.NAME LIKE '%LOVE' 
or T.NAME LIKE '% LOVE %'
*/
/*
Esercizio 6
Trovate il costo medio per ogni tipologia di media
*/

SELECT 
    m.Name AS TIPO_MEDIA,
    AVG(t.UnitPrice) AS COSTO_MEDIO
FROM
    track t
        INNER JOIN
    mediatype m ON t.MediaTypeId = m.MediaTypeId
GROUP BY m.Name;


/*
Esercizio 7 
Individuate il genere con più tracce.
*/

SELECT 
    c.Genere, 
    c.canzoni_per_genere
FROM (
    SELECT 
        g.Name AS Genere, 
        COUNT(*) AS canzoni_per_genere
    FROM 
        track t
    INNER JOIN 
        genre g ON t.GenreId = g.GenreId
    GROUP BY 
        g.Name
) AS c
ORDER BY 
    c.canzoni_per_genere DESC
LIMIT 1; 
-- seconda versione 

WITH GenereCanzoni AS (
    SELECT 
        g.Name AS Genere, 
        COUNT(t.TrackId) AS canzoni_per_genere
    FROM 
        track t
    INNER JOIN 
        genre g ON t.GenreId = g.GenreId
    GROUP BY 
        g.Name
)

SELECT 
    Genere, 
    canzoni_per_genere
FROM 
    GenereCanzoni
ORDER BY 
    canzoni_per_genere DESC
LIMIT 1;

-- terza versione con l-uso di max
SELECT 
    g.Name AS Genere,
    COUNT(t.TrackId) AS canzoni_per_genere
FROM 
    track t
INNER JOIN 
    genre g ON t.GenreId = g.GenreId
GROUP BY 
    g.Name
HAVING 
    COUNT(t.TrackId) = (
        SELECT MAX(canzoni_per_genere) 
        FROM (
            SELECT COUNT(t2.TrackId) AS canzoni_per_genere
            FROM track t2
            INNER JOIN genre g2 ON t2.GenreId = g2.GenreId
            GROUP BY g2.Name
        ) AS sottotabella
    );

/*
Esercizio 8 
Esercizio Query Avanzate Trovate gli artisti che hanno lo stesso numero di album dei Rolling Stones.
*/
WITH RollingStonesAlbumCount AS (
    SELECT 
        COUNT(a.AlbumId) AS numero_album
    FROM 
        artist ar
    INNER JOIN 
        album a ON ar.ArtistId = a.ArtistId
    WHERE 
        ar.Name = 'The Rolling Stones'
    GROUP BY 
        ar.Name
)
SELECT 
    ar.Name AS artista
FROM 
    artist ar
INNER JOIN 
    album a ON ar.ArtistId = a.ArtistId
GROUP BY 
    ar.Name
HAVING 
    COUNT(a.AlbumId) = (SELECT numero_album FROM RollingStonesAlbumCount);

-- piu semplice 

SELECT 
    ar.Name AS artista
FROM 
    artist ar
INNER JOIN 
    album a ON ar.ArtistId = a.ArtistId
GROUP BY 
    ar.Name
HAVING 
    COUNT(a.AlbumId) = (
        SELECT 
            COUNT(a2.AlbumId)
        FROM 
            artist ar2
        INNER JOIN 
            album a2 ON ar2.ArtistId = a2.ArtistId
        WHERE 
            ar2.Name = 'The Rolling Stones'
    );

/*
Esercizio 9 
Trovate l’artista con l’album più costoso.
*/
SELECT 
    ar.Name AS ArtistName,
    a.Title AS AlbumTitle,
    SUM(t.UnitPrice) AS TotalAlbumCost
FROM 
    album a
INNER JOIN 
    artist ar ON a.ArtistId = ar.ArtistId
INNER JOIN 
    track t ON a.AlbumId = t.AlbumId
GROUP BY 
    ar.Name, a.Title
ORDER BY 
    TotalAlbumCost DESC
LIMIT 1;

-- secondo modo 
WITH AlbumCost AS (
    SELECT 
        a.AlbumId,
        a.Title AS AlbumTitle,
        ar.Name AS ArtistName,
        MIN(t.UnitPrice) AS AlbumCost
    FROM 
        album a
    INNER JOIN 
        artist ar ON a.ArtistId = ar.ArtistId
    INNER JOIN 
        track t ON a.AlbumId = t.AlbumId
    GROUP BY 
        a.AlbumId, a.Title, ar.Name
)

-- Passo 2: Selezionare l'artista con l'album più costoso
SELECT 
    ArtistName,
    AlbumTitle,
    AlbumCost
FROM 
    AlbumCost
WHERE 
    AlbumCost = (SELECT MAX(AlbumCost) FROM AlbumCost);
