/*
1.Esponi l’anagrafica dei prodotti indicando per ciascun prodotto anche la sua sottocategoria (DimProduct, DimProductSubcategory).

*/

SELECT p.EnglishProductName, p.ModelName , p.Color , s.EnglishProductSubcategoryName, p.DealerPrice
FROM dimproduct as p
LEFT OUTER JOIN dimproductsubcategory as s
ON p.ProductSubcategoryKey = s.ProductSubcategoryKey;


/*
2.Esponi l’anagrafica dei prodotti indicando per ciascun prodotto la sua sottocategoria e la sua categoria
 (DimProduct, DimProductSubcategory, DimProductCategory).
*/

SELECT p.ProductKey, p.EnglishProductName, s.EnglishProductSubcategoryName, c.EnglishProductCategoryName
FROM dimproduct AS p
LEFT OUTER JOIN dimproductsubcategory AS s
    ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
INNER JOIN dimproductcategory AS c
    ON s.ProductCategoryKey = c.ProductCategoryKey;
/*
3.Esponi l’elenco dei soli prodotti venduti (DimProduct, FactResellerSales).
*/

SELECT *
FROM dimproduct as p
INNER JOIN factresellersales as f
on  p.ProductKey = f.ProductKey;

/*
4.Esponi l’elenco dei prodotti non venduti (considera i soli prodotti finiti cioè quelli per i quali il campo FinishedGoodsFlag è uguale a 1).
*/

SELECT *
FROM dimproduct as p
LEFT OUTER JOIN factresellersales as f
ON p.ProductKey = f.ProductKey
WHERE FinishedGoodsFlag = 1 AND f.ProductKey is null;

/*
5.Esponi l’elenco delle transazioni di vendita (FactResellerSales) indicando anche il nome del prodotto venduto (DimProduct)
*/

SELECT f.OrderDate, f.ProductKey, p.EnglishProductName,f.SalesAmount
FROM dimproduct p
INNER JOIN  factresellersales as f
ON p.ProductKey = f.ProductKey;

/*
6.Esponi l’elenco delle transazioni di vendita indicando la categoria di appartenenza di ciascun prodotto venduto.
*/

SELECT f.OrderDate, c.EnglishProductCategoryName, f.SalesAmount,f.ShipDate,p.ProductKey
FROM dimproduct p
INNER JOIN factresellersales f
ON p.ProductKey = f.ProductKey
INNER JOIN dimproductsubcategory AS s
    ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
INNER JOIN dimproductcategory AS c
    ON s.ProductCategoryKey = c.ProductCategoryKey;


/*
7.Esplora la tabella DimReseller.
*/
SELECT *
FROM dimreseller;

/*
8.Esponi in output l’elenco dei reseller indicando, per ciascun reseller, anche la sua area geografica.
*/

/*
9-Esponi l’elenco delle transazioni di vendita. Il result set deve esporre i campi: 
SalesOrderNumber, SalesOrderLineNumber, OrderDate, UnitPrice, Quantity, TotalProductCost. 
Il result set deve anche indicare il nome del prodotto, il nome della categoria del prodotto, il nome del reseller e l’area geografica.
*/

/*

*/