
SELECT 
    COUNT(*), COUNT(DISTINCT ProductKey)
FROM
    dimproduct;
/*
Esploro la tabella
*/
SELECT *
FROM dimproduct;
/*
Interroga la tabella dei prodotti (DimProduct) ed esponi in output i campi ProductKey, 
ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag.
 Il result set deve essere parlante per cui assegna un alias se lo ritieni opportuno.
*/
SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    Color,
    StandardCost AS STIMACOSTO,
    FinishedGoodsFlag AS STATOPRODOTTO
FROM
    dimproduct;
/*
Partendo dalla query scritta nel passaggio precedente, esponi in output i soli prodotti finiti cioè quelli per cui il campo 
FinishedGoodsFlag è uguale a 1.
*/
SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    Color,
    StandardCost AS STIMACOSTO,
    FinishedGoodsFlag AS STATOPRODOTTO
FROM
    dimproduct
WHERE
    FinishedGoodsFlag = 1;
/*
Scrivi una nuova query al fine di esporre in output i prodotti il cui codice modello (ProductAlternateKey)
 comincia con FR oppure BK. Il result set deve contenere il codice prodotto (ProductKey), 
il modello, il nome del prodotto, il costo standard (StandardCost) e il prezzo di listino (ListPrice).
*/
SELECT 
    ProductKey,
    EnglishProductName AS Modello,
    StandardCost AS CostoStandard,
    ListPrice AS PrezzoListino
FROM
    dimproduct
WHERE
    ProductAlternateKey LIKE 'FR%'
        OR ProductAlternateKey LIKE 'BK%';
/*
Arricchisci il risultato della query scritta nel passaggio precedente
 del Markup applicato dall’azienda (ListPrice - StandardCost)
*/
SELECT 
    ProductKey,
    EnglishProductName AS Modello,
    StandardCost AS CostoStandard,
    ListPrice AS PrezzoListino,
    ListPrice - StandardCost AS MARKUP
FROM
    dimproduct
WHERE
    ProductAlternateKey LIKE 'FR%'
        OR ProductAlternateKey LIKE 'BK%';
/*
Scrivi un’altra query al fine di esporre l’elenco dei prodotti finiti il cui prezzo di listino è compreso tra 1000 e 2000.
*/
-- However, if you want the OR condition to apply to both product key patterns and still apply the price condition to both, you need to group the conditions properly with parentheses.
SELECT 
    ProductKey,
    EnglishProductName AS Modello,
    StandardCost AS CostoStandard,
    ListPrice AS PrezzoListino,
    ListPrice - StandardCost AS MARKUP
FROM
    dimproduct
WHERE
    (ProductAlternateKey LIKE 'FR%'
        OR ProductAlternateKey LIKE 'BK%')
        AND ListPrice - StandardCost BETWEEN 1000 AND 2000;
/*
Esplora la tabella degli impiegati aziendali (DimEmployee)
*/
SELECT *
FROM dimemployee;

/*
Esponi, interrogando la tabella degli impiegati aziendali,
 l’elenco dei soli agenti. Gli agenti sono i dipendenti per i quali il campo SalespersonFlag è uguale a 1.

*/
SELECT 
    EmployeeKey,
    FirstName,
    LastName,
    Title,
    HireDate,
    DepartmentName,
    SalesPersonFlag
FROM
    dimemployee
WHERE
    SalesPersonFlag = 1;
/*
Interroga la tabella delle vendite (FactResellerSales). 
Esponi in output l’elenco delle transazioni registrate a partire
 dal 1 gennaio 2020 dei soli codici prodotto: 597, 598, 477, 214. 
 Calcola per ciascuna transazione il profitto (SalesAmount - TotalProductCost).
*/
SELECT *
FROM factresellersales;

SELECT 
    SalesOrderNumber,
    SalesOrderLineNumber,
    OrderDate,
    ShipDate,
    ProductKey,
    ResellerKey,
    OrderQuantity,
    UnitPrice,
    TotalProductCost,
    SalesAmount - TotalProductCost AS PROFIT
FROM
    factresellersales
WHERE
    OrderDate >= '2020-01-01'
        AND ProductKey IN (597 , 598, 477, 214);



        