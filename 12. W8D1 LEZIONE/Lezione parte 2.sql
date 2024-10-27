USE W12D1;

/*
DATE AND DATETIME DATA TYPE
*/

-- ---------------- DATE ----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- format: 	YYYY-MM-DD
-- storage:	3 bytes
-- range:	from 1000-01-01 to 9999-12-31

SELECT CURRENT_TIMESTAMP();

DROP TABLE IF EXISTS Date;
CREATE TABLE Date (date_col DATE);
INSERT INTO Date VALUES (CURRENT_TIMESTAMP());
SELECT CURRENT_TIMESTAMP(), date_col FROM Date;

-- ---------------- DATETIME ----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- format:		YYYY-MM-DD HH:MM:SS[.fraction]
-- storage:		5 bytes + storage required for fractional seconds precision (fsp)
-- range: 		from 1000-01-01 00:00:00 to 9999-12-31 23:59:59
-- fraction:	up to microsecond (1/1000000 seconds)
	/*
	storage size increases with the precision of fractional seconds:
	fractional seconds precisions | storage required
    0 	| 0 bytes
    1,2 | 1 bytes
    3,4 | 2 bytes
    5,6 | 3 bytes
	*/
DROP TABLE IF EXISTS DateTime;    
CREATE TABLE DateTime (datetime_col DATETIME, datetime_col_fractional DATETIME(6));
INSERT INTO DateTime VALUES (CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
SELECT CURRENT_TIMESTAMP(), datetime_col, datetime_col_fractional FROM DateTime;    

-- ---------------- TIME ----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- format: 		HH:MM:SS.[fraction]
-- storage:		3 bytes + storage required for fractional seconds precision (fsp)
-- range: 		from -839:59:59 to 839:59:59
-- fraction:	up to microsecond (1/1000000 seconds)
	/*
	storage size increases with the precision of fractional seconds:
	fractional seconds precisions | storage required
    0 	| 0 bytes
    1,2 | 1 bytes
    3,4 | 2 bytes
    5,6 | 3 bytes
	*/
DROP TABLE IF EXISTS Time;
CREATE TABLE Time (time_col TIME, time_col_fractional TIME(6));
INSERT INTO Time VALUES (CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
SELECT CURRENT_TIMESTAMP(), time_col, time_col_fractional FROM Time;  

-- ---------------- TIMESTAMP ----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- format: 		YYYY-MM-DD HH:MM:SS[.fraction]
-- storage:		4 bytes + storage required for fractional seconds precision (fsp)
-- range: 		from 1970-01-01 00:00:00 UTC to 2038-12-31 23:59:59 UTC
-- fraction:	up to microsecond (1/1000000 seconds)
	/*
	storage size increases with the precision of fractional seconds:
	fractional seconds precisions | storage required
    0 	| 0 bytes
    1,2 | 1 bytes
    3,4 | 2 bytes
    5,6 | 3 bytes
	*/

/*
When you insert a TIMESTAMP value into a table, MySQL converts it from your connection’s time zone to UTC for storing.
When you query a TIMESTAMP value, MySQL converts the UTC value back to your connection’s time zone. 
This conversion does not occur for other temporal data types, such as DATETIME.
By default, the connection time zone is the MySQL Server’s time zone. 
You also have the option to use a different time zone when connecting to the MySQL Server.
When you retrieve a TIMESTAMP value that was inserted by a client in a different time zone, 
you will receive a value different from the one stored in the database.

https://www.mysqltutorial.org/mysql-basics/understanding-mysql-timestamp/
Current UTC, Time Zone (Coordinated Universal Time): https://www.timeanddate.com/worldclock/timezone/utc
*/

SELECT UTC_TIMESTAMP(), CURRENT_TIMESTAMP();

DROP TABLE IF EXISTS Timestamp;
CREATE TABLE Timestamp (timestamp_col TIMESTAMP, timestamp_col_fractional TIMESTAMP(6));
INSERT INTO Timestamp VALUES (CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
SELECT 
	UTC_TIMESTAMP()
    , CURRENT_TIMESTAMP()
    , timestamp_col
    , timestamp_col_fractional
FROM Timestamp;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Come convertire tra zone diverse?
	/*
    CONVERT_TZ(datetime, from_tz, to_tz)
	
    supponiamo di creare un tabella per la gestione dei voli dall'Italia...
    */

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    departure_datetime DATETIME,
    arrival_datetime DATETIME,
    departure_time_zone VARCHAR(50) NOT NULL,
    arrival_time_zone VARCHAR(50) NOT NULL
);

INSERT INTO flights (departure_datetime, arrival_datetime, departure_time_zone, arrival_time_zone)
VALUES
    ('2024-10-21 20:20:00', '2024-10-22 11:20:00', 'Europe/Rome', 'Asia/Tokyo');
    
SELECT *
FROM flights;

SELECT 
  flight_id
  , departure_datetime 	
  , arrival_datetime 
  , departure_time_zone
  , arrival_time_zone
  , CONVERT_TZ(arrival_datetime, departure_time_zone,  arrival_time_zone) AS local_arrival_datetime 
FROM flights;

/*
https://www.skyscanner.it/trasporti/voli/rome/tyoa/241021/config/11493-2410212020--
32558-1-14788-2410221815?adultsv2=1&cabinclass=economy&childrenv2=&ref=home&rtn=0&pre
ferdirects=false&outboundaltsenabled=false&inboundaltsenabled=false
*/












CREATE TABLE datetime_illustration(
year_col YEAR
, date_col DATE
, time_col TIME
, time_col_fractional TIME(2)
, datetime_col DATETIME
, datetime_col_fractional DATETIME(6)
, timestamp_col TIMESTAMP
, timestamp_col_fractional TIMESTAMP(6));

SELECT NOW();

INSERT INTO datetime_illustration 
VALUES (NOW(), NOW(), NOW(), NOW(), NOW(), NOW(), NOW(), NOW());


SELECT *
FROM datetime_illustration

