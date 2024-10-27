/*
Cominciate facendo un’analisi esplorativa del database, ad esempio:
 Fate un elenco di tutte le tabelle. Visualizzate le prime 10 righe della tabella Album.
 Trovate il numero totale di canzoni della tabella Tracks. Trovate i diversi generi presenti nella tabella Genre.
*/
SELECT *
FROM ALBUM;

SELECT distinct Name
FROM genre;

SELECT Count(Trackid)
from track;

/*
Esercizio 2 Recuperate il nome di tutte le tracce e del genere associato.
*/
SELECT t.Name, g.Name
FROM track AS t
LEFT JOIN genre as g
ON t.GenreId = g.GenreId;

/*
Esercizio 3 Recuperate il nome di tutti gli artisti che hanno
almeno un album nel database. Esistono artisti senza album nel database?
*/
SELECT al.Name, COUNT(a.AlbumId) AS Numero_Album
FROM artist AS al
LEFT JOIN album AS a 
ON al.ArtistId = a.ArtistId
GROUP BY al.Name
HAVING COUNT(a.AlbumId) > 0;


/*
Esercizio 4 Esercizio Join Recuperate il nome di tutte le tracce, 
del genere associato e della tipologia di media. Esiste un modo per recuperare il nome della tipologia di media?
*/



/*
Elencate i nomi di tutti gli artisti e dei loro album.
*/
SELECT a.Name, al.Title
FROM artist as a
LEFT JOIN album as al
ON a.ArtistId = AlbumId;


