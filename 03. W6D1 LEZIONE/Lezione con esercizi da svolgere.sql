/* 
Ricorda che l'ordine in base al quale vengono eseguite le istruzioni è 
differente dall'ordine con cui vengono scritte.
La seuquenza con cui deve essere scritto uno statemente SELECT è quella indicata in basso,
l'ordine con cui vengono eseguite le clausole è indicato tra parentesi 

(3) SELECT	 : consente di indicare a lista di colonne o calcoli da visualizzare nel result set o output o risultato 
(1) FROM	 : indica la sorgente dati cioè la tabella o le tabelle che bisogna interrogare
(2) WHERE	 : consente di indicare 'searc condition'. Le condizioni di ricerca non sono altro che filtri applicati alle righe restituite dalla FROM
(4) ORDER BY : consente di ordinare il risultati in base ad uno o più campi
*/

-- supponiamo di voler interrogare la tabella dimproduct
SELECT *
FROM dimproduct;

-- supponimao di dover esporre le colonne ProductKey, EnglishProductName, StandardCost, FinishedGoodFlag, ListPrice
SELECT ProductKey, EnglishProductName, StandardCost, FinishedGoodsFlag, ListPrice
FROM dimproduct;

-- supponiamo di dover visualizzare oltre al codice prodotto e al nome prodotto, il markup (ListPrice - StandardCost) per ogni prodotto
SELECT ProductKey, EnglishProductName, StandardCost, FinishedGoodsFlag, ListPrice, ListPrice - StandardCost
FROM dimproduct;

-- il risultato della query deve essere sempre il più parlante possibile
SELECT ProductKey, EnglishProductName, StandardCost, FinishedGoodsFlag, ListPrice, ListPrice - StandardCost AS Markup
FROM dimproduct;

-- ESERCIZIO
	
    -- interroga la tabella factresellersales (espone tutte le colonne della tabella factresellersales)
    
    -- esponi le colonne SalesOrderNumber, SalesOrderLineNumber, OrderDate, ProductKey, OrderQuantity, UnitPrice, TotalProductCost, SalesAmount
    
    -- arricchisci la query precedente del calcolo dei Profitti (SalesAmount - TotalProductCost). Rendi il risultato parlante!
    
-- FINE ESERCIZIO
    
-- supponiamo di dover esporre l'elenco dei soli prodotti finiti, cioè i prodotti per i quali il campo FinishedGoodsFlag è 1
SELECT ProductKey, EnglishProductName, StandardCost, FinishedGoodsFlag, ListPrice, ListPrice - StandardCost AS Markup
FROM dimproduct
WHERE FinishedGoodsFlag = 1;

-- supponiamo di dover esporre l'elenco dei prodotti con un Markup maggiore o uguale a 
SELECT ProductKey, EnglishProductName, StandardCost, FinishedGoodsFlag, ListPrice, ListPrice - StandardCost AS Markup
FROM dimproduct
-- errore... perchè?
WHERE Markup >= 400;

SELECT ProductKey, EnglishProductName, StandardCost, FinishedGoodsFlag, ListPrice, ListPrice - StandardCost AS Markup
FROM dimproduct
WHERE ListPrice - StandardCost >= 400;

-- supponiamo di dover esporre l'elenco dei soli prodotti finiti per i quali il markup è >= 400
SELECT ProductKey, EnglishProductName, StandardCost, FinishedGoodsFlag, ListPrice, ListPrice - StandardCost AS Markup
FROM dimproduct
WHERE FinishedGoodsFlag = 1 AND ListPrice - StandardCost >= 400;

-- supponiamo di dover esporre l'elenco dei prodotti il cui colore è Black oppure Silver
SELECT ProductKey, EnglishProductName, Color
FROM dimproduct
WHERE Color = 'Black' OR Color = 'Silver';

SELECT ProductKey, EnglishProductName, Color
FROM dimproduct
WHERE Color IN ('Black', 'Silver');

-- ESERCIZIO

	-- esponi le transazioni di vendita con un profitto negativo
	    
    -- espoini le transazioni di vendita dei prodotti 349, 275 con profitto superiore a 300
	
-- FINE ESERCIZIO

-- supponiamo di dover esporre le transazioni di vendita dal 1 gennaio 2020 al 31 maggio 2020 e di doverle ordinare in maniera decrescente
SELECT SalesOrderNumber, SalesOrderLineNumber, OrderDate, ProductKey, OrderQuantity, UnitPrice, TotalProductCost, SalesAmount, SalesAmount - TotalProductCost AS Profit
FROM factresellersales
WHERE OrderDate >= '2020-01-01' AND OrderDate <= '2020-05-31'
ORDER BY OrderDate DESC;

SELECT SalesOrderNumber, SalesOrderLineNumber, OrderDate, ProductKey, OrderQuantity, UnitPrice, TotalProductCost, SalesAmount, SalesAmount - TotalProductCost AS Profit
FROM factresellersales
WHERE OrderDate BETWEEN '2020-01-01' AND '2020-05-31'
ORDER BY OrderDate DESC;

-- supponiamo di dover esporre l'elenco delle transazioni per il quali il TotalProductCost è null
SELECT SalesOrderNumber, SalesOrderLineNumber, OrderDate, ProductKey, OrderQuantity, UnitPrice, TotalProductCost, SalesAmount, SalesAmount - TotalProductCost AS Profit
FROM factresellersales
WHERE TotalProductCost is null;

-- supponiamo di dover scrivere una query che restituisca i diversi tipi di colore
SELECT color
FROM dimproduct;

SELECT ALL color
FROM  dimproduct;

SELECT DISTINCT Color
FROM dimproduct;

/* approfondimento.. e se dovessimo scrivere delle condizioni?
supponiamo ad esmempio di dover restituire un campo descrittivo contenente:
- la concatenazione di Color e Size 
- il testo 'dati mancanti' se Color = NA e Size è null
- il testo 'color:' concatenato al valore del campo Color se è presente solo il colore del prodotto
*/

SELECT 
ProductKey,
Color,
Size,
CASE 
	WHEN Color <> 'NA' AND Size is not null THEN CONCAT(Color, " ", Size)
	WHEN Color <> "NA" AND Size is null THEN CONCAT('Color: ', Color)
    WHEN Color = "NA" AND Size is null THEN 'dati mancanti'
    ELSE ''
END AS Descrizione
FROM dimproduct

