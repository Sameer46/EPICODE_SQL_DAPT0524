/*
l'utente richiede un'estrazione al fine di analizzare diverse aggregazioni con dettaglio mese.
le misure richieste sono:
ricavi (SalesAmount) --> SUM
profitti (da calcolare) --> SUM
quantità (OrderQuantity) --> SUM
numero di ordini (da calcolare) --> COUNT
l'utente vorrebbe avere evidenza nel risultato dell'anno, del nome prodotto e del nome del reseller!
per estrarre l'anno da una data e per estrarre il mese da una data utilizzate le funzioni YEAR e MONTH
sia YEAR che MONTH restituiscono un valore numerico che rappresenta rispettivamente l'anno e il mese
potreste utilizzare anche la funzione MONTHNAME che restituisce il nome del mese
YEAR, MONTH e MONTHNAME rientrano nelle funzione di tipo DATE and TIME
*/

SELECT 
    YEAR(f.OrderDate) AS ANNO,
    MONTHNAME(f.OrderDate) AS MESE,
    P.EnglishProductName AS NOMEPRODOTTO,
   -- R.ResellerName AS RESELLER,
    SUM(F.SalesAmount) AS RICAVI,
    SUM(f.SalesAmount-f.TotalProductCost ) AS PROFITTO,
    SUM(f.OrderQuantity) AS Quantità,
    COUNT(f.SalesOrderLineNumber) AS NumeroOrdini
FROM
    factresellersales AS f
        INNER JOIN
    dimproduct AS p ON f.ProductKey = p.ProductKey
        INNER JOIN
    dimreseller AS r ON f.ResellerKey = r.ResellerKey
GROUP BY YEAR(f.OrderDate) , MONTHNAME(f.OrderDate),p.EnglishProductName;-- , r.ResellerName
-- ORDER BY ANNO , MESE , NOMEPRODOTTO , RESELLER;

SELECT 
	YEAR(s.OrderDate) 							AS year
  , MONTH(s.OrderDate)						AS Month
  , p.EnglishProductName						AS Product				
  -- , r.ResellerName							  Reseller
  , SUM(s.SalesAmount) 						AS Sales
  , SUM(s.OrderQuantity)						AS Quantity
  , COUNT(s.SalesOrderLineNumber)				AS Transactions
  , SUM(s.SalesAmount - s.TotalProductCost) 	AS Profit
  , SUM(
			CASE 
				WHEN s.TotalProductCost IS NULL THEN s.SalesAmount - p.StandardCost * s.OrderQuantity 
				ELSE s.SalesAmount - s.TotalProductCost 
			END) AS Profit_basedOnStandardCost
FROM factresellersales AS s
INNER JOIN dimproduct AS p
	ON s.ProductKey = p.ProductKey
INNER JOIN dimreseller as r
	ON s.ResellerKey = r.ResellerKey
GROUP BY YEAR(s.OrderDate), MONTH(s.OrderDate), p.EnglishProductName -- , r.ResellerName
ORDER BY Year DESC, Month ASC, Sales DESC






 