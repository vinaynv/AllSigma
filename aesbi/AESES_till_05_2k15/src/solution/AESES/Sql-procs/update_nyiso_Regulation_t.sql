DELIMITER $$

USE `aeses`$$

DROP PROCEDURE IF EXISTS `update_nyiso_Regulation_t`$$

CREATE DEFINER=`puneet.b`@`%` PROCEDURE `update_nyiso_Regulation_t`()
BEGIN

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_Regulation AS clearing_price,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Regulation' AND id=1149) c
WHERE DATE(time_stamp) = '2009-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_Regulation AS clearing_price,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Regulation' AND id=1149) c
WHERE DATE(time_stamp) = '2011-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_Regulation AS clearing_price,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Regulation' AND id=1149) c
WHERE DATE(time_stamp) = '2011-03-22'
AND b.timestamp = a.time_stamp;


REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_Regulation AS clearing_price,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Regulation' AND id=1149) c
WHERE DATE(time_stamp) = '2011-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_Regulation AS clearing_price,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Regulation' AND id=1149) c
WHERE DATE(time_stamp) = '2011-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_Regulation AS clearing_price,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Regulation' AND id=1149) c
WHERE DATE(time_stamp) = '2012-04-11'
AND b.timestamp = a.time_stamp;







REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_10_Min_Spinning_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
          /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Spinning Reserve' AND id=1150) c
WHERE DATE(time_stamp) = '2009-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_10_Min_Spinning_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
          /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Spinning Reserve' AND id=1150) c
WHERE DATE(time_stamp) = '2011-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_10_Min_Spinning_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
          /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Spinning Reserve' AND id=1150) c
WHERE DATE(time_stamp) = '2011-03-22'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_10_Min_Spinning_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
          /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Spinning Reserve' AND id=1150) c
WHERE DATE(time_stamp) = '2011-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_10_Min_Spinning_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
          /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Spinning Reserve' AND id=1150) c
WHERE DATE(time_stamp) = '2011-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_10_Min_Spinning_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
          /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Spinning Reserve' AND id=1150) c
WHERE DATE(time_stamp) = '2012-04-11'
AND b.timestamp = a.time_stamp;








REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_10_Min_Non_Synchronous_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Non-Spinning Reserve' AND id=1151) c
WHERE
DATE(time_stamp) = '2009-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_10_Min_Non_Synchronous_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Non-Spinning Reserve' AND id=1151) c
WHERE
DATE(time_stamp) = '2011-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_10_Min_Non_Synchronous_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Non-Spinning Reserve' AND id=1151) c
WHERE
DATE(time_stamp) = '2011-03-22'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_10_Min_Non_Synchronous_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Non-Spinning Reserve' AND id=1151) c
WHERE
DATE(time_stamp) = '2011-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_10_Min_Non_Synchronous_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Non-Spinning Reserve' AND id=1151) c
WHERE
DATE(time_stamp) = '2011-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_10_Min_Non_Synchronous_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Non-Spinning Reserve' AND id=1151) c
WHERE
DATE(time_stamp) = '2012-04-11'
AND b.timestamp = a.time_stamp;









REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_30_Min_Operating_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Operating Reserve' AND id=1152) c
WHERE
DATE(time_stamp) = '2009-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_30_Min_Operating_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Operating Reserve' AND id=1152) c
WHERE
DATE(time_stamp) = '2011-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_30_Min_Operating_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Operating Reserve' AND id=1152) c
WHERE
DATE(time_stamp) = '2011-03-22'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_30_Min_Operating_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Operating Reserve' AND id=1152) c
WHERE
DATE(time_stamp) = '2011-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_30_Min_Operating_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Operating Reserve' AND id=1152) c
WHERE
DATE(time_stamp) = '2011-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_30_Min_Operating_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Operating Reserve' AND id=1152) c
WHERE
DATE(time_stamp) = '2012-04-11'
AND b.timestamp = a.time_stamp;










REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_10_Min_Spinning_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
          /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Spinning Reserve' AND id=1153) c
WHERE
DATE(time_stamp) = '2009-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_10_Min_Spinning_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
          /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Spinning Reserve' AND id=1153) c
WHERE
DATE(time_stamp) = '2011-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_10_Min_Spinning_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
          /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Spinning Reserve' AND id=1153) c
WHERE
DATE(time_stamp) = '2011-03-22'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_10_Min_Spinning_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
          /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Spinning Reserve' AND id=1153) c
WHERE
DATE(time_stamp) = '2011-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_10_Min_Spinning_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
          /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Spinning Reserve' AND id=1153) c
WHERE
DATE(time_stamp) = '2011-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_10_Min_Spinning_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
          /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Spinning Reserve' AND id=1153) c
WHERE
DATE(time_stamp) = '2012-04-11'
AND b.timestamp = a.time_stamp;










REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_10_Min_Non_Synchronous_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /* 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /****************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Non-Spinning Reserve' AND id=1154) c
WHERE
DATE(time_stamp) = '2009-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_10_Min_Non_Synchronous_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /* 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /****************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Non-Spinning Reserve' AND id=1154) c
WHERE
DATE(time_stamp) = '2011-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_10_Min_Non_Synchronous_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /* 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /****************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Non-Spinning Reserve' AND id=1154) c
WHERE
DATE(time_stamp) = '2011-03-22'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_10_Min_Non_Synchronous_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /* 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /****************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Non-Spinning Reserve' AND id=1154) c
WHERE
DATE(time_stamp) = '2011-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_10_Min_Non_Synchronous_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /* 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /****************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Non-Spinning Reserve' AND id=1154) c
WHERE
DATE(time_stamp) = '2011-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_10_Min_Non_Synchronous_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /* 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /****************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Non-Spinning Reserve' AND id=1154) c
WHERE
DATE(time_stamp) = '2012-04-11'
AND b.timestamp = a.time_stamp;









REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_Regulation AS clearing_price,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /*******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West' AND service = 'Regulation' AND id = 1155) c
WHERE
DATE(time_stamp) = '2009-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_Regulation AS clearing_price,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /*******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West' AND service = 'Regulation' AND id = 1155) c
WHERE
DATE(time_stamp) = '2011-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_Regulation AS clearing_price,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /*******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West' AND service = 'Regulation' AND id = 1155) c
WHERE
DATE(time_stamp) = '2011-03-22'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_Regulation AS clearing_price,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /*******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West' AND service = 'Regulation' AND id = 1155) c
WHERE
DATE(time_stamp) = '2011-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_Regulation AS clearing_price,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /*******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West' AND service = 'Regulation' AND id = 1155) c
WHERE
DATE(time_stamp) = '2011-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_Regulation AS clearing_price,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /*******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West' AND service = 'Regulation' AND id = 1155) c
WHERE
DATE(time_stamp) = '2012-04-11'
AND b.timestamp = a.time_stamp;









REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_30_Min_Operating_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
       /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Operating Reserve' AND id = 1156) c
WHERE
DATE(time_stamp) = '2009-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_30_Min_Operating_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
       /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Operating Reserve' AND id = 1156) c
WHERE
DATE(time_stamp) = '2011-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_30_Min_Operating_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
       /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Operating Reserve' AND id = 1156) c
WHERE
DATE(time_stamp) = '2011-03-22'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_30_Min_Operating_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
       /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Operating Reserve' AND id = 1156) c
WHERE
DATE(time_stamp) = '2011-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_30_Min_Operating_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
       /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Operating Reserve' AND id = 1156) c
WHERE
DATE(time_stamp) = '2011-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_30_Min_Operating_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
       /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity"
       /******************************/
FROM nyiso_ancillary_service_prices_ham_raw a , bi_dim_date b
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Operating Reserve' AND id = 1156) c
WHERE
DATE(time_stamp) = '2012-04-11'
AND b.timestamp = a.time_stamp;


END$$

DELIMITER ;