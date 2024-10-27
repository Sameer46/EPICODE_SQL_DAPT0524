-- Visualizzate le prime 10 righe della tabella Album.
SELECT 
    *
FROM
    album
LIMIT 10;

-- Trovate il numero totale di canzoni della tabella Tracks
SELECT 
   count(Name) AS song
FROM
    track;

SELECT 
    count(distinct name) AS song
FROM
    track;

-- Trovate i diversi generi presenti nella tabella Genre.
SELECT 
    genreid, Name AS genre
FROM
    genre;

-- Recuperate il nome di tutte le tracce e del genere associato.
SELECT 
    t.name AS song, g.name AS genre
FROM
    track AS t
        LEFT OUTER JOIN
    genre AS g ON t.genreid = g.genreid;

-- Recuperate il nome di tutti gli artisti che hanno almeno un album nel database. 
-- Esistono artisti senza album nel database?
SELECT DISTINCT
    ar.name AS artist -- al.Title AS album
FROM
    artist AS ar
        LEFT OUTER JOIN
    album AS al ON ar.ArtistId = al.ArtistId
WHERE
    al.title IS NOT NULL;
    
    SELECT DISTINCT
    ar.name AS artist -- al.Title AS album
FROM
    artist AS ar
        INNER JOIN
    album AS al ON ar.ArtistId = al.ArtistId;


SELECT DISTINCT
    ar.name AS artist -- al.Title AS album
FROM
    artist AS ar
        LEFT OUTER JOIN
    album AS al ON ar.ArtistId = al.ArtistId
WHERE
    al.title IS NULL;
    
    select count(distinct artistid)
    from artist;

-- Recuperate il nome di tutte le tracce, del genere associato e della tipologia di media.
-- Esiste un modo per recuperare il nome della tipologia di media?
SELECT 
    t.Name AS song, g.Name AS genre, m.name AS media
FROM
    track AS t
        LEFT OUTER JOIN
    genre AS g ON t.genreid = g.genreid
        LEFT OUTER JOIN
    mediatype AS m ON t.MediaTypeId = m.MediaTypeId;

-- Elencate i nomi di tutti gli artisti e dei loro album.
SELECT 
    ar.name AS artist, al.title AS album
FROM
    artist AS ar
        LEFT JOIN
    album AS al ON ar.artistid = al.artistid;



