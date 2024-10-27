/* 1 Scrivi una query per verificare che il campo ProductKey nella tabella DimProduct 
 sia una chiave primaria. Quali considerazioni/ragionamenti è necessario che tu faccia?
*/
SELECT ProductKey, COUNT(*) AS CNTPK
FROM dimproduct
GROUP BY ProductKey
HAVING COUNT(*) > 1;

/*
2 Scrivi una query per verificare che la combinazione dei campi SalesOrderNumber e SalesOrderLineNumber sia una PK.
*/
SELECT SalesOrderNumber,SalesOrderLineNumber, COUNT(*) AS CNTPK
FROM factresellersales
GROUP BY SalesOrderNumber, SalesOrderLineNumber
HAVING COUNT(*) > 1;



/*
3 Conta il numero transazioni (SalesOrderLineNumber) realizzate ogni giorno a partire dal 1 Gennaio 2020.
*/

SELECT OrderDate, count( distinct SalesOrderNumber) AS Transazioni
FROM factresellersales
WHERE OrderDate >='2020-01-01'
GROUP BY OrderDate;

/*
4 Calcola il fatturato totale (FactResellerSales.SalesAmount), la quantità totale venduta 
(FactResellerSales.OrderQuantity) e il prezzo medio di vendita (FactResellerSales.UnitPrice)
per prodotto (DimProduct) a partire dal 1 Gennaio 2020. Il result set deve esporre pertanto il nome del prodotto,
 il fatturato totale, la quantità totale venduta e il prezzo medio di vendita. I campi in output devono essere parlanti!
*/

SELECT 
	p.ProductKey,
    p.EnglishProductName,
    SUM(s.SalesAmount) AS TOTALE_FATTURATO,
    SUM(S.OrderQuantity) AS TOTALE_QTA,
    CAST(SUM(s.SalesAmount)/SUM(S.OrderQuantity) AS DECIMAL(10,2))  AS AVG_SELL
FROM
    dimproduct AS P
        LEFT JOIN
    factresellersales AS s ON P.ProductKey = s.ProductKey
WHERE
    s.OrderDate >= '2020-01-01'
GROUP BY p.ProductKey,p.EnglishProductName
ORDER BY P.ProductKey;

SELECT 
	p.ProductKey,
    p.EnglishProductName,
    SUM(s.SalesAmount) AS TOTALE_FATTURATO,
    SUM(S.OrderQuantity) AS TOTALE_QTA,
    CAST(SUM(s.SalesAmount)/SUM(S.OrderQuantity) AS DECIMAL(10,2))  AS AVG_SELL
FROM
    dimproduct AS P
       INNER JOIN
    factresellersales AS s ON P.ProductKey = s.ProductKey
WHERE
 s.OrderDate >= '2020-01-01'
GROUP BY p.ProductKey,p.EnglishProductName
ORDER BY P.ProductKey;


/*
 Approfondimento
*/
SELECT 
	p.ProductKey,
    p.EnglishProductName,
    SUM(s.SalesAmount) AS TOTALE_FATTURATO,
    SUM(S.OrderQuantity) AS TOTALE_QTA,
    CAST(SUM(s.SalesAmount)/SUM(S.OrderQuantity) AS DECIMAL(10,2))  AS AVG_SELL
FROM
    dimproduct AS P
        LEFT JOIN
    factresellersales AS s ON P.ProductKey = s.ProductKey
-- WHERE
   -- s.OrderDate >= '2020-01-01'
GROUP BY p.ProductKey,p.EnglishProductName
ORDER BY P.ProductKey;

SELECT 
	p.ProductKey,
    p.EnglishProductName,
    SUM(s.SalesAmount) AS TOTALE_FATTURATO,
    SUM(S.OrderQuantity) AS TOTALE_QTA,
    CAST(SUM(s.SalesAmount)/SUM(S.OrderQuantity) AS DECIMAL(10,2))  AS AVG_SELL
FROM
    dimproduct AS P
       INNER JOIN
    factresellersales AS s ON P.ProductKey = s.ProductKey
-- WHERE
  --  s.OrderDate >= '2020-01-01'
GROUP BY p.ProductKey,p.EnglishProductName
ORDER BY P.ProductKey;



/*
5 Calcola il fatturato totale (FactResellerSales.SalesAmount) e la quantità totale venduta
 (FactResellerSales.OrderQuantity) per Categoria prodotto (DimProductCategory). 
 Il result set deve esporre pertanto il nome della categoria prodotto, il fatturato totale e la quantità totale venduta.
 I campi in output devono essere parlanti!
*/

SELECT 
    p.EnglishProductCategoryName,
    SUM(f.SalesAmount) AS TOTALE_VENDITA,
    SUM(f.OrderQuantity) AS TOTALE_QTA,
FROM
    dimproductcategory AS p
        LEFT JOIN
    dimproductsubcategory AS sub ON p.ProductCategoryKey = sub.ProductCategoryKey
        LEFT JOIN
    dimproduct AS prod ON sub.ProductSubcategoryKey = prod.ProductSubcategoryKey
        LEFT JOIN
    factresellersales AS f ON f.ProductKey = prod.ProductKey
GROUP BY p.EnglishProductCategoryName;
-- APPROFONDIMENTO MEDIA CATEGORIA
SELECT 
    p.EnglishProductCategoryName,
    SUM(f.SalesAmount) AS TOTALE_VENDITA,
    SUM(f.OrderQuantity) AS TOTALE_QTA,
    CAST(SUM(f.SalesAmount)/SUM(f.OrderQuantity)AS DECIMAL(10,2) )AS MEDIA_CATEGORIA 
FROM
    dimproductcategory AS p
        LEFT JOIN
    dimproductsubcategory AS sub ON p.ProductCategoryKey = sub.ProductCategoryKey
        LEFT JOIN
    dimproduct AS prod ON sub.ProductSubcategoryKey = prod.ProductSubcategoryKey
        LEFT JOIN
    factresellersales AS f ON f.ProductKey = prod.ProductKey
GROUP BY p.EnglishProductCategoryName;



/*
6 Calcola il fatturato totale per area città (DimGeography.City) 
realizzato a partire dal 1 Gennaio 2020. Il result set deve esporre l’elenco delle città con fatturato realizzato superiore a 60K.
*/

SELECT SUM(SalesAmount) -- '12.650.022.79'
FROM factresellersales
WHERE OrderDate >= '2020-01-01';


SELECT geo.City, SUM(f.SalesAmount) AS TOTALE_FATTURATO
FROM factresellersales as f
LEFT JOIN dimreseller as rel
on f.ResellerKey = rel.ResellerKey
LEFT JOIN dimgeography as geo
ON rel.GeographyKey = geo.GeographyKey
WHERE f.OrderDate >= '2020-01-01'
GROUP BY geo.City
HAVING SUM(f.SalesAmount)>60000
ORDER BY TOTALE_FATTURATO DESC;









