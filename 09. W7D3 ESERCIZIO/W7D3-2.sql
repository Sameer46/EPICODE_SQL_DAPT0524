-- Recuperate tutte le tracce che abbiano come genere “Pop” o “Rock”.
SELECT 
    t.name AS song, g.name AS genre
FROM
    track AS t
        LEFT JOIN
    genre AS g ON t.GenreId = g.GenreId
WHERE
    g.name IN ('pop' , 'rock'); 

-- Elencate tutti gli artisti e/o gli album che inizino con la lettera “A”.
SELECT 
    ar.name AS artist, al.title AS album
FROM
    artist AS ar
        LEFT OUTER JOIN
    album AS al ON ar.ArtistId = al.ArtistId
WHERE
    ar.name LIKE ('A%')
        OR al.title LIKE ('A%');

-- Esercizio 3 Elencate tutte e tracce che hanno come genere
 -- “Jazz” o che durano meno di 3 minuti.
SELECT 
    ROUND(t.milliseconds / 1000 / 60,2) AS durata,
    g.name AS genere
FROM
    track AS t
        LEFT OUTER JOIN
    genre AS g ON t.GenreId = g.GenreId
WHERE
    t.milliseconds >= '180000'
        OR g.name = 'jazz';
 
-- Esercizio 4 Recuperate tutte le tracce più lunghe della durata media.
SELECT 
    ROUND(t.milliseconds / 1000 / 60,2) AS durata, t.name AS song
FROM
    track AS t
WHERE
    t.milliseconds > (SELECT 
            AVG(milliseconds)
        FROM
            track);
 
-- Esercizio 5  Individuate i generi che hanno tracce con una durata media 
-- maggiore di 4 minuti. 
SELECT
    g.name AS genre,
    AVG(ROUND(milliseconds / 1000 / 60,2)) AS durata_media
FROM
    track AS t
        LEFT JOIN
    genre AS g ON t.GenreId = g.GenreId
GROUP BY g.name
HAVING AVG(ROUND(milliseconds / 1000) / 60) >= 4;

-- Esercizio 6 Individuate gli artisti che hanno rilasciato più di un album.
SELECT 
    ar.name AS artist, COUNT(al.title) AS n_album
FROM
    artist AS ar
        LEFT JOIN
    album AS al ON ar.ArtistId = al.ArtistId
GROUP BY ar.name
HAVING COUNT(al.title) > 1;

-- Esercizio 7 Trovate la traccia più lunga in ogni album.
SELECT 
     al.title AS album,
     MAX(t.milliseconds) AS val_max
FROM
    album AS al
        LEFT JOIN
    track AS t ON al.AlbumId = t.AlbumId
GROUP BY al.title;

-- seconda versione con anche il titolo 
SELECT 
    al.Title AS Album,
    t.Name AS TrackName,
    t.Milliseconds AS Duration
FROM 
    album AS al
JOIN 
    track AS t ON al.AlbumId = t.AlbumId
WHERE 
    t.Milliseconds = (
        SELECT MAX(t2.Milliseconds)
        FROM track t2
        WHERE t2.AlbumId = al.AlbumId
    )
ORDER BY 
    al.Title;


-- Esercizio 8 Individuate la durata media delle tracce per ogni album.
SELECT 
    AVG(t.milliseconds) AS avg_song, al.title AS album
FROM
    album AS al
        LEFT JOIN
    track AS t ON al.AlbumId = t.AlbumId
GROUP BY al.title;

-- Esercizio 9 Individuate gli album che hanno più di 20 tracce e mostrate il nome dell’album e il numero di tracce in esso contenute.
SELECT 
    COUNT(t.name) AS song, al.title AS album
FROM
    album AS al
        LEFT JOIN
    track AS t ON al.AlbumId = t.AlbumId
GROUP BY al.title
HAVING COUNT(t.name) >= 20;


 
 
 