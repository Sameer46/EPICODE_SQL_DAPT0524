/* 
Ricorda che l'ordine in base al quale vengono eseguite le istruzioni è 
differente dall'ordine con cui vengono scritte.
La seuquenza con cui deve essere scritto uno statemente SELECT è quella indicata in basso,
l'ordine con cui vengono eseguite le clausole è indicato tra parentesi 

(3) SELECT	 : consente di indicare a lista di colonne o calcoli da visualizzare nel result set o output o risultato 
(1) FROM	 : indica la sorgente dati cioè la tabella o le tabelle che bisogna interrogare
				JOIN	: operatore che consente di combinare i record di due tabelle in base alla corrispondeza dei valori di uno (o più) campo in comune
(2) WHERE	 : consente di indicare 'searc condition'. Le condizioni di ricerca non sono altro che filtri applicati alle righe restituite dalla FROM
(4) ORDER BY : consente di ordinare il risultati in base ad uno o più campi
*/

-- supponiamo di dover esporre un result contenente i dati di venita arricchiti del nome del prodotto
SELECT 
	SalesOrderNumber, 
    SalesOrderLineNumber, 
    OrderDate, SalesAmount, 
    TotalProductCost, 
    OrderQuantity, 
    EnglishProductName
FROM factresellersales
INNER JOIN dimproduct
ON factresellersales.ProductKey = dimproduct.ProductKey;

SELECT 
	SalesOrderNumber, 
	SalesOrderLineNumber, 
	OrderDate, 
	SalesAmount, 
	TotalProductCost, 
	OrderQuantity, 
	EnglishProductName,
    -- errore di ambiguità
    ProductKey
FROM factresellersales
INNER JOIN dimproduct
ON factresellersales.ProductKey = dimproduct.ProductKey;

-- utilizziamo gli alias
SELECT 
	SalesOrderNumber, 
	SalesOrderLineNumber, 
	OrderDate, 
	SalesAmount, 
	TotalProductCost, 
	OrderQuantity, 
	EnglishProductName,
    p.ProductKey,
    s.ProductKey
FROM factresellersales s
INNER JOIN dimproduct p
ON s.ProductKey = p.ProductKey;

-- supponiamo di dover esporre l'elendo dei prodotti venduti
SELECT 
	p.ProductKey
	, EnglishProductName
    , s.ProductKey
FROM dimproduct p
INNER JOIN factresellersales s
ON p.ProductKey = s.ProductKey;

-- supponiamo di dover esporre l'elendo dei prodotti a prescindere dal fatto che siano venduti o meno
SELECT 
	p.ProductKey
	, EnglishProductName
    , s.ProductKey
FROM dimproduct p
LEFT OUTER JOIN factresellersales s
ON p.ProductKey = s.ProductKey;

-- supponiamo di dover esporre l'elendo dei prodotti NON venduti
SELECT 
	p.ProductKey
	, EnglishProductName
    , s.ProductKey
FROM dimproduct p
LEFT OUTER JOIN factresellersales s
ON p.ProductKey = s.ProductKey
WHERE s.ProductKey is null;

-- supponiamo di dover calcolare i profitti per ogni transazione utilizzando il costo standard del prodotto quando il costo del venduto è null
SELECT 
	s.SalesOrderNumber, 
	s.SalesOrderLineNumber, 
	s.OrderDate, 
	s.SalesAmount, 
	s.TotalProductCost,
    p.StandardCost,
	s.OrderQuantity, 
	p.EnglishProductName,
    p.ProductKey,
    s.ProductKey,
    CASE
		WHEN TotalProductCost is null then s.SalesAmount - (s.OrderQuantity * p.StandardCost) 
        ELSE s.SalesAmount - TotalProductCost
	END as Profit
    FROM factresellersales s
INNER JOIN dimproduct p
ON s.ProductKey = p.ProductKey;

-- ESERCIZIO
	
    -- esponi i dati di vendita arricchiti delle informazioni dei reseller (ad esempio, esponi il ResellerName per ogni transazione)
    SELECT s.SalesOrderNumber, s.SalesOrderLineNumber, s.OrderDate, p.ResellerName
    FROM factresellersales s
    INNER JOIN dimreseller p
    ON s.ResellerKey = p.ResellerKey;

    -- ci sono Reseller per i quali non esistono transazioni?
    SELECT r.ResellerKey, s.ResellerKey , r.ResellerName
    FROM dimreseller as r
    LEFT OUTER JOIN factresellersales as s
    ON r.ResellerKey = s.ResellerKey
    WHERE s.ResellerKey is null;
    
    
    -- esponi l'elenco dei reseller e per ciascuno di questi la sua area geografica (utilizza la tabella dimgeography)
	SELECT r.ResellerName, g.EnglishCountryRegionName, g.StateProvinceName,g.City
    FROM dimreseller as r
    LEFT OUTER JOIN dimgeography as g
    ON r.GeographyKey= g.GeographyKey

-- FINE ESERCIZIO

-- LAVORIAMO ASSIEME!
-- supponiamo di dover esporre nel result set i dati di vendita e tutte le informazioni del prodotto


-- supponiamo di dover esporre l'elenco dei prodotti venduti con un approccio alternativo
SELECT *
FROM dimproduct
WHERE ProductKey NOT IN ( 	SELECT ProductKey
							FROM factresellersales );
                            
-- quale preferiamo? dipende: 1) familiarità 2) tipologia di risultato

-- supponiamo di dove esporre l'elenco dei prodotti non venduti nel 2020
SELECT *
FROM dimproduct
WHERE ProductKey NOT IN ( 	SELECT ProductKey
							FROM factresellersales
							WHERE YEAR(OrderDate) = 2020 );

-- supponiamo di dover esporre l'elenco dei prodotti il cui prezzo di listino è superiore al valore medio
SELECT ProductKey, ListPrice
FROM dimproduct
WHERE ListPrice > (SELECT AVG(listprice) FROM dimproduct);

-- la query autonoma scalare puo' essere innestata in qualsiasi punto della select
SELECT 
	ProductKey
    , ListPrice
    , (SELECT AVG(listprice) FROM dimproduct) AvgListPrice
FROM dimproduct
WHERE ListPrice > (SELECT AVG(listprice) FROM dimproduct)

-- APPROFONDIMENTO: LA UNION



