/*
Implementa una vista denominata Product al fine di creare un’anagrafica (dimensione)
prodotto completa. La vista, se interrogata o utilizzata come sorgente dati, deve esporre il
nome prodotto, il nome della sottocategoria associata e il nome della categoria associata.

*/
CREATE VIEW SA_VW_Product AS
SELECT 
    d.EnglishProductName AS NomeProdotto,
    psc.EnglishProductSubcategoryName AS NomeSottocategoria,
    pc.EnglishProductCategoryName AS NomeCategoria
FROM 
    dimproduct d
LEFT JOIN 
    dimproductsubcategory psc
ON  
    d.ProductSubcategoryKey = psc.ProductSubcategoryKey
LEFT JOIN 
    dimproductcategory pc
ON 
    psc.ProductCategoryKey = pc.ProductCategoryKey;
    
/*
. Implementa una vista denominata Reseller al fine di creare un’anagrafica (dimensione)
reseller completa. La vista, se interrogata o utilizzata come sorgente dati, deve esporre il
nome del reseller, il nome della città e il nome della regione.

*/

CREATE VIEW SA_VW_Reseller AS
SELECT 
    r.ResellerName AS NomeReseller,
    g.City AS NomeCittà,
    g.CountryRegionCode AS CodiceRegione
FROM 
    dimreseller r
LEFT JOIN 
    dimgeography g
ON 
    r.GeographyKey = g.GeographyKey;
/*
Crea una vista denominata Sales che deve restituire la data dell’ordine, il codice
documento, la riga di corpo del documento, la quantità venduta, l’importo totale e il
profitto.

*/
CREATE VIEW SA_VW_Sales AS
SELECT 
    fs.OrderDate AS OrderDate,
    fs.SalesOrderNumber AS DocumentCodeP1,
    fs.SalesOrderLineNumber AS DocumentCodeP2,
    fs.OrderQuantity AS SoldQuantity,
    fs.SalesAmount AS TotalAmount,
    (fs.SalesAmount - (p.StandardCost * fs.OrderQuantity)) AS Profit
FROM 
    FactResellerSales fs
JOIN 
    DimProduct p ON fs.ProductKey = p.ProductKey;


/*


*/
