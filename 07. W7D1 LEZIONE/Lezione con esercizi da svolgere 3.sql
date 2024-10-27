/* 
Ricorda che l'ordine in base al quale vengono eseguite le istruzioni è 
differente dall'ordine con cui vengono scritte.
La seuquenza con cui deve essere scritto uno statemente SELECT è quella indicata in basso,
l'ordine con cui vengono eseguite le clausole è indicato tra parentesi 

(5) SELECT	 : consente di indicare a lista di colonne o calcoli da visualizzare nel result set o output o risultato 
(1) FROM	 : indica la sorgente dati cioè la tabella o le tabelle che bisogna interrogare
				JOIN	: operatore che consente di combinare i record di due tabelle in base alla corrispondeza dei valori di uno (o più) campo in comune
(2) WHERE	 : consente di indicare 'search condition'. Le condizioni di ricerca non sono altro che filtri applicati alle righe restituite dalla FROM
(3) GROUP BY : raggruppa i record restituiti dagli step precedenti per ogni combinazione univoca dei campi indicati nella group by stessa (group by list)
(4) HAVING   : consente di indicare 'search condition' applicati ai gruppi. In altre parole, filtra i gruppi restituiti dalla Group By
(6) ORDER BY : consente di ordinare il risultati in base ad uno o più campi
*/

-- Esercizio 1 (utilizza la tabella dimproduct)
	-- conta il numero di prodotti per colore 
    SELECT 
		Color
        , COUNT(ProductKey) AS count
    FROM dimproduct
    GROUP BY Color;
    -- conta il numero di prodotti per colore ed escludi le categorie di colore con meno di 50 prodotti
 	SELECT Color, COUNT(*) AS ProductCount
	FROM dimproduct
	GROUP BY Color
	HAVING COUNT(*) < 50;
		
-- Esercizio 2 (utilizza la tabella dimgeography)
	-- conta il numero di city per paese (EnglishCountryRegionName)
	SELECT EnglishCountryRegionName, COUNT(*) AS CityNumbers
	FROM dimgeography
	GROUP BY EnglishCountryRegionName;
-- Esercizio 3 (utilizza la tabelal FactResellerSales)
	-- conta il numero di transazioni (SalesOrderNumber), la quantità totale e i ricavi (SalesAmount) per ordine (SalesOrder)
   SELECT SalesOrderNumber, 
       COUNT(*) AS TransactionCount, 
       SUM(OrderQuantity) AS TotalQuantity, 
       SUM(SalesAmount) AS TotalSalesAmoun
    FROM factresellersales
    GROUP BY SalesOrderNumber;
    -- conta il numero di vendite dello stesso prodotto nello stesso giorno
    SELECT ProductKey, OrderDate, count(*) AS CNTVENDITE
    FROM factresellersales
    GROUP BY ProductKey, OrderDate;
	
    
    SELECT ProductKey, OrderDate, count(*) AS CNTVENDITE
    FROM factresellersales
    GROUP BY ProductKey, OrderDate
    HAVING COUNT(*)>1
    ORDER BY CNTVENDITE DESC;
    
    
    -- quanti prodotti ci sono per categoria prodotto=
    SELECT EnglishProductSubcategoryName, COUNT(ProductKey) AS cntcategoria
    FROM dimproduct as p
    LEFT OUTER JOIN dimproductsubcategory as s
    ON p.ProductSubcategoryKey = p.ProductSubcategoryKey
    GROUP BY EnglishProductSubcategoryName
    
    