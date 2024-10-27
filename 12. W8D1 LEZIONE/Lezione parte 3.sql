/*
MySQL mette a disposizione diverse funzioni per manipolare i tipi di dato data e ora
*/

USE W12D1;

-- sono sinonimi e restituiscono la stesso risultato cioè la data nel formato YYYY-MM-DD
SELECT CURRENT_DATE, CURRENT_DATE(), CURDATE();

-- sono sinonimi e restituiscono il'ora corrente con o senza la fsp (fino al microsecondo) nel formato HH:MM:SS[.fsp]
SELECT CURTIME(), CURRENT_TIME(), CURRENT_TIME, CURTIME(6), CURRENT_TIME(4);

-- sono sinonimi e restituiscono la data e l'ora corrente nel formato YYYY-MM-DD HH:MM:SS
SELECT NOW(), CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP, NOW(6), CURRENT_TIMESTAMP(6);

-- ADDDATE consente di aggiungere o sottrarre giorni ad una data ADDDATE(data, numero di gg da aggiumgere o sottrarre)
SELECT CURRENT_DATE() AS OGGI, ADDDATE(CURRENT_DATE, 1) AS DOMANI, ADDDATE(CURRENT_DATE, -1) AS IERI;

	/* 
    DI DEFAULT SOMMA O SOTTRAE GIORNI..
    .. MA SPECIFICANDO INTERVALLI...
    */

SELECT 
	CURRENT_DATE() AS OGGI
    , ADDDATE(CURRENT_DATE, INTERVAL 10 DAY) 
    , ADDDATE(CURRENT_DATE, INTERVAL 1 MONTH) 
    , ADDDATE(CURRENT_DATE, INTERVAL 1 QUARTER)
    , ADDDATE(CURRENT_DATE, INTERVAL 1 WEEK)
    , ADDDATE(CURRENT_DATE, INTERVAL 1 YEAR);

-- allo stesso modo ADDTIME consente di aggiungere ore, minuti e secondi
SELECT NOW(), ADDTIME(NOW(), '1:30:0');

-- ... Mma anche giorni, ore, minuti, secondi
SELECT NOW(), ADDTIME(NOW(), '1 1:30:0');

-- .. possiamo quindi anche sottrarre
SELECT NOW(), ADDTIME(NOW(), '-0:45:0');

-- alle volte è utile estrarre una parte specifica di una data
SELECT 
NOW()					AS Adesso
, DATE(NOW())			AS Data
, HOUR(NOW())			AS Ora
, MINUTE(NOW())			AS Minuti
, SECOND(NOW())			AS Secondi
, MICROSECOND(NOW())	AS Microsecondi
, YEAR(NOW())			AS Anno
, QUARTER(NOW())		AS Trimestre
, MONTH(NOW())			AS Mese
, WEEK(NOW())			AS SettimanaNellAnno
, DAYOFMONTH(NOW())		AS GiornoDelMese
, DAYOFWEEK(NOW())		AS GiornoDellaSettimana
, DAYOFYEAR(NOW())		AS GiornoDellAnno
, DAYNAME(NOW())		AS NomeGiorno
, MONTHNAME(NOW())		AS NomeMese;

-- alle volte è utile formattare la data in un formato utile DATE_FORMAT(date,format)
SELECT 
NOW()							AS Adesso
, DATE_FORMAT(NOW(), '%a')		AS GiornoSettimanaAbbreviato
, DATE_FORMAT(NOW(), '%b')		AS MeseAbbreviato
, DATE_FORMAT(NOW(), '%M') 		AS MeseIntero
-- , .....
;
/*
https://www.mysqltutorial.org/mysql-date-functions/mysql-date_format/
*/

-- infine, se volessimo fare una sottrazione tra due date?

SELECT 
NOW() 												AS Adesso
, "2024-10-21 19:00:00"								AS InizioLezione
, TIMEDIFF(NOW(), "2024-10-21 19:00:00")			AS TempoTrascorsoOreMinSec
, DATEDIFF(NOW(), "2024-10-01")						AS TempoTrascorsoGiorni








