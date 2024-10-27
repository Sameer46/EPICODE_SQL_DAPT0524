/*
DDL - Data Definition Language comprende le istruzioni utili a creare, modificare, eliminare oggetti
- CREATE 
- INSERT 
- UPDATE
- DELETE
- DROP 
*/

-- creazione e connessione allo schema W12D1
CREATE DATABASE W12D1;
USE W12D1;

-- eliminazione tabella Products se esiste e poi, creazione tabella Products
DROP TABLE IF EXISTS Product;

CREATE TABLE Product (
ProductID INT 
, ProductName VARCHAR(25) NOT NULL
, ProductDescription VARCHAR(50) 
, CreationDate DATETIME DEFAULT CURRENT_TIMESTAMP
, LastModifiedDate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

	/* 
    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    aggiorna automaticamente i valori della colonna (su cui è definita l'opzione) con il timestamp
    al momento dell'aggiornamento (timestamp corrente al momento dell'aggiornamento).
    */

-- modifca della tabella Product (alter) per aggiungere un vincolo di chiave primaria 
ALTER TABLE Product
ADD CONSTRAINT PK_Product PRIMARY KEY (ProductID);

-- inserimento record nella tabella Product e operazioni di update, delete e "ripristino"
INSERT INTO Product (ProductID, ProductName, ProductDescription)
VALUES (1, 'p-1', null);

INSERT INTO Product (ProductID, ProductName)
VALUES (2, 'p-2');

SELECT *
FROM Product;

UPDATE Product
SET ProductDescription = 'product p-1 a'
WHERE ProductID = 1;

SELECT *
FROM Product;

-- facciamo prima dei test e mettiamoci in sicurezza
DROP TABLE IF EXISTS bak_Product;
CREATE TABLE bak_Product LIKE Product;

	/*
    CREATE TABLE <nome nuova tabella> LIKE <tabella di cui fare una copia>
    genera una tabella vuota con lo stesso schema di una tabella esistente.
    stesso schema significa stesse colonne e data type, SENZA VINCOLI E SENZA DATI
    */

-- create la tabella vuota, inseriamo i valori per ottenere una sorta di backup
INSERT INTO bak_Product
SELECT * FROM Product;

SELECT * FROM bak_product;

-- simuliamo un errore e il ripristino
UPDATE Product
SET ProductDescription = 'product p-1';

SELECT *
FROM Product;

UPDATE Product
INNER JOIN bak_Product
ON bak_Product.ProductID = Product.ProductID
SET Product.ProductDescription = bak_Product.ProductDescription;

SELECT *
FROM Product;

-- approccio 2 per metterci in sicurezza

-- inizio transazione
START TRANSACTION;
	-- operazione di aggiornamento
	UPDATE Product
	SET ProductDescription = 'product p-2'
	WHERE ProductID = 2;
    -- select sui dati per appurare il risultato
	SELECT * FROM Product;
-- annullo la transazione
-- ROLLBACK;
-- rendo definitiva la transazione
 COMMIT;

select *
from Product;



