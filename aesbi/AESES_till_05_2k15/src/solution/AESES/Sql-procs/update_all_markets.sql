DELIMITER $$

USE `aeses`$$

DROP PROCEDURE IF EXISTS `update_all_markets`$$

CREATE DEFINER=`sigma.siva`@`%` PROCEDURE `update_all_markets`()
BEGIN
/********NYISO DAY-Ahesd Regulation zone(EAST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.East_Regulation AS clearing_price,
        (SELECT ROUND(AVG(East_Regulation),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(East_Regulation),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(East_Regulation),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ***/
        (SELECT ROUND(AVG(East_Regulation),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity",
        b.id AS bi_dim_date_id_local
        /*****************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp > 
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =500)))a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =500)) ) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Regulation' AND id=500) c;
/********NYISO DAY-Ahesd Non-Spinning Reserve zone(EAST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.East_10_Min_Non_Synchronous_Reserve AS clearing_price,
        (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
        (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
         NULL AS "capacity",
         b.id AS bi_dim_date_id_local
        /******************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =501)) ) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP > 
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =501))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Non-Spinning Reserve' AND id=501) c;
/********NYISO DAY-Ahesd Spinning Reserve zone(EAST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.East_10_Min_Spinning_Reserve AS clearing_price,
        (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) 
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
        (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
         NULL AS "capacity",    
         b.id AS bi_dim_date_id_local
        /******************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp >(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =502))) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =502))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Spinning Reserve' AND id=502) c;
/********NYISO DAY-Ahesd Operating Reserve zone(EAST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.East_30_Min_Operating_Reserve AS clearing_price,
        (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) 
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
        (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
         NULL AS "capacity",
         b.id AS bi_dim_date_id_local
        /******************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp >(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =503))) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =503))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Operating Reserve' AND id=503) c;
/********NYISO DAY-Ahesd Non-Spinning Reserve zone(WEST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.West_10_Min_Non_Synchronous_Reserve AS clearing_price,
        (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) 
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
        (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
         NULL AS "capacity",
         b.id AS bi_dim_date_id_local
        /******************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =505))) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =505))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Non-Spinning Reserve' AND id=505) c;
/********NYISO DAY-Ahesd Spinning Reserve zone(WEST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.West_10_Min_Spinning_Reserve AS clearing_price,
        (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) 
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
        (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
         NULL AS "capacity",
         b.id AS bi_dim_date_id_local
        /******************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =506))) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =506))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Spinning Reserve' AND id=506) c;
/********NYISO DAY-Ahesd Operating Reserve zone(WEST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.West_30_Min_Operating_Reserve AS clearing_price,
        (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
        (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
         NULL AS "capacity",
         b.id AS bi_dim_date_id_local
        /******************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp >(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =507))) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =507))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Operating Reserve' AND id=507) c;
/********NYISO DAY-Ahesd Regulation zone(WEST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.West_Regulation AS clearing_price,
        (SELECT ROUND(AVG(West_Regulation),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(West_Regulation),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(West_Regulation),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) 
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
        (SELECT ROUND(AVG(West_Regulation),2)
        FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
         NULL AS "capacity",
         b.id AS bi_dim_date_id_local
        /******************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_dayahead_raw WHERE time_stamp >(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =508))) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =508))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Regulation' AND id=508) c;
/********NYISO Hour-Ahesd Regulation zone(EAST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_Regulation AS clearing_price,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity",
        b.id AS bi_dim_date_id_local
       /******************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1149))) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1149))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Regulation' AND id=1149) c;
/********NYISO Hour-Ahesd Spinning Reserve zone(EAST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_10_Min_Spinning_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
          /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity",
        b.id AS bi_dim_date_id_local
       /******************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1150)) ) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1150))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Spinning Reserve' AND id=1150) c;
/********NYISO Hour-Ahesd Non-Spinning Reserve zone(EAST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_10_Min_Non_Synchronous_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity",
        b.id AS bi_dim_date_id_local
       /******************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1151)) ) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1151))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Non-Spinning Reserve' AND id=1151) c;
/********NYISO Hour-Ahesd Operating Reserve zone(EAST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.East_30_Min_Operating_Reserve AS clearing_price,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
         /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(East_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity",
        b.id AS bi_dim_date_id_local
       /******************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1152))) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1152))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'East'AND service = 'Operating Reserve' AND id=1152) c;
/********NYISO Hour-Ahesd Spinning Reserve zone(WEST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_10_Min_Spinning_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
          /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_10_Min_Spinning_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity",
        b.id AS bi_dim_date_id_local
       /******************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1153))) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1153))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Spinning Reserve' AND id=1153) c;
/********NYISO Hour-Ahesd Non-Spinning Reserve zone(WEST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_10_Min_Non_Synchronous_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /* 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_10_Min_Non_Synchronous_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity",
        b.id AS bi_dim_date_id_local
       /****************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1154))) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1154))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Non-Spinning Reserve' AND id=1154) c;
/********NYISO Hour-Ahesd Regulation zone(WEST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_Regulation AS clearing_price,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
        /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_Regulation),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity",
        b.id AS bi_dim_date_id_local
       /*******************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1155))) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1155))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Regulation' AND id = 1155) c;
/********NYISO Hour-Ahesd Operating Reserve zone(WEST)****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
       c.id AS bi_dim_market_id,
       a.West_30_Min_Operating_Reserve AS clearing_price,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
        AND HOUR(time_stamp)=HOUR(a.time_stamp)) AS previous_year_clearing_price,
        NULL AS volume,
       /**** 12 month rolling avg ****/
       (SELECT ROUND(AVG(West_30_Min_Operating_Reserve),2)
       FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(time_stamp)=HOUR(a.time_stamp))  AS one_year_avg,
        NULL AS "capacity",
        b.id AS bi_dim_date_id_local
       /******************************/
FROM (SELECT *  FROM nyiso_ancillary_service_prices_ham_raw WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1156)) ) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1156))) b
ON b.timestamp=a.time_stamp
JOIN
(SELECT * FROM bi_dim_market WHERE zone = 'West'AND service = 'Operating Reserve' AND id = 1156) c;
/********NYISO Real-Time Spinning Reserve zone(EAST)****/
REPLACE INTO bi_fact_markets_part
SELECT b.id AS bi_dim_date_id,c.id AS bi_dim_market_id, a.East_10_Min_Spinning_Reserve AS clearing_price,
    (SELECT AVG(East_10_Min_Spinning_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
      (SELECT AVG(East_10_Min_Spinning_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS ninety_day_avg,
      (SELECT AVG(East_10_Min_Spinning_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS previous_year_clearing_price,
    NULL AS volume,
     /**** 12 month rolling avg ****/
      (SELECT AVG(East_10_Min_Spinning_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS one_year_avg,
       NULL AS "capacity",
       b.id AS bi_dim_date_id_local
      /******************************/
FROM (SELECT * FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1142)) ) a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1142)) ) b
ON a.time_stamp=b.timestamp
JOIN
(SELECT id FROM bi_dim_market WHERE iso='NYISO' AND market='Real-Time Regulation' AND service='Spinning Reserve' AND zone='East') c;
REPLACE INTO bi_fact_markets_part
SELECT b.id AS bi_dim_date_id,c.id AS bi_dim_market_id, a.East_10_Min_Non_Synchronous_Reserve AS clearing_price,
    (SELECT AVG(East_10_Min_Non_Synchronous_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
      (SELECT AVG(East_10_Min_Non_Synchronous_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS ninety_day_avg,
      (SELECT AVG(East_10_Min_Non_Synchronous_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS previous_year_clearing_price,
    NULL AS volume,
    /**** 12 month rolling avg ****/
      (SELECT AVG(East_10_Min_Non_Synchronous_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS one_year_avg,
       NULL AS "capacity",
       b.id AS bi_dim_date_id_local
      /******************************/
FROM (SELECT * FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
WHERE time_stamp >(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1143)) ) a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1143))) b
ON a.time_stamp=b.timestamp
JOIN
(SELECT id FROM bi_dim_market WHERE iso='NYISO' AND market='Real-Time Regulation' AND service='Non-Spinning Reserve' AND zone='East') c;
REPLACE INTO bi_fact_markets_part
SELECT b.id AS bi_dim_date_id,c.id AS bi_dim_market_id, a.East_30_Min_Operating_Reserve AS clearing_price,
    (SELECT AVG(East_30_Min_Operating_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
      (SELECT AVG(East_30_Min_Operating_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS ninety_day_avg,
      (SELECT AVG(East_30_Min_Operating_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS previous_year_clearing_price,
    NULL AS volume,
      /**** 12 month rolling avg ****/
      (SELECT AVG(East_30_Min_Operating_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS one_year_avg,
       NULL AS "capacity",
       b.id AS bi_dim_date_id_local
      /*******************************/
FROM (SELECT * FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1144))) a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1144))) b
ON a.time_stamp=b.timestamp
JOIN
(SELECT id FROM bi_dim_market WHERE iso='NYISO' AND market='Real-Time Regulation' AND service='Operating Reserve' AND zone='East') c;
REPLACE INTO bi_fact_markets_part
SELECT b.id AS bi_dim_date_id,c.id AS bi_dim_market_id, a.east_regulation AS clearing_price,
    (SELECT AVG(east_regulation) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
      (SELECT AVG(east_regulation) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS ninety_day_avg,
      (SELECT AVG(east_regulation) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS previous_year_clearing_price,
    NULL AS volume,
     /**** 12 month rolling avg ****/
      (SELECT AVG(east_regulation) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS one_year_avg,
       NULL AS "capacity",
       b.id AS bi_dim_date_id_local
      /*******************************/
FROM (SELECT * FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1141))) a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1141))) b
ON a.time_stamp=b.timestamp
JOIN
(SELECT id FROM bi_dim_market WHERE iso='NYISO' AND market='Real-Time Regulation' AND service='Regulation' AND zone='east') c;
REPLACE INTO bi_fact_markets_part
SELECT b.id AS bi_dim_date_id,c.id AS bi_dim_market_id, a.West_10_Min_Spinning_Reserve AS clearing_price,
    (SELECT AVG(West_10_Min_Spinning_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
      (SELECT AVG(West_10_Min_Spinning_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS ninety_day_avg,
      (SELECT AVG(West_10_Min_Spinning_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS previous_year_clearing_price,
    NULL AS volume,
     /**** 12 month rolling avg ****/
      (SELECT AVG(West_10_Min_Spinning_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
     DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS one_year_avg,
       NULL AS "capacity",
       b.id AS bi_dim_date_id_local
      /******************************/
FROM (SELECT * FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1145))) a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1145))) b
ON a.time_stamp=b.timestamp
JOIN
(SELECT id FROM bi_dim_market WHERE iso='NYISO' AND market='Real-Time Regulation' AND service='Spinning Reserve' AND zone='West') c;
REPLACE INTO bi_fact_markets_part
SELECT b.id AS bi_dim_date_id,c.id AS bi_dim_market_id, a.West_10_Min_Non_Synchronous_Reserve AS clearing_price,
    (SELECT AVG(West_10_Min_Non_Synchronous_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
      (SELECT AVG(West_10_Min_Non_Synchronous_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS ninety_day_avg,
      (SELECT AVG(West_10_Min_Non_Synchronous_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)) AS previous_year_clearing_price,
    NULL AS volume,
     /**** 12 month rolling avg ****/
      (SELECT AVG(West_10_Min_Non_Synchronous_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS one_year_avg,
       NULL AS "capacity",
       b.id AS bi_dim_date_id_local
      /*******************************/
FROM (SELECT * FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1146))) a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1146))) b
ON a.time_stamp=b.timestamp
JOIN
(SELECT id FROM bi_dim_market WHERE iso='NYISO' AND market='Real-Time Regulation' AND service='Non-Spinning Reserve' AND zone='West') c;
REPLACE INTO bi_fact_markets_part
SELECT b.id AS bi_dim_date_id,c.id AS bi_dim_market_id, a.west_regulation AS clearing_price,
    (SELECT AVG(west_regulation) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
      (SELECT AVG(west_regulation) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS ninety_day_avg,
      (SELECT AVG(west_regulation) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS previous_year_clearing_price,
    NULL AS volume,
    /**** 12 month rolling avg ****/
      (SELECT AVG(west_regulation) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS one_year_avg,
       NULL AS "capacity",
       b.id AS bi_dim_date_id_local
      /*******************************/
FROM (SELECT * FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1147))) a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1147))) b
ON a.time_stamp=b.timestamp
JOIN
(SELECT id FROM bi_dim_market WHERE iso='NYISO' AND market='Real-Time Regulation' AND service='Regulation' AND zone='West') c;
REPLACE INTO bi_fact_markets_part
SELECT b.id AS bi_dim_date_id,c.id AS bi_dim_market_id, a.West_30_Min_Operating_Reserve AS clearing_price,
    (SELECT AVG(West_30_Min_Operating_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
      (SELECT AVG(West_30_Min_Operating_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS ninety_day_avg,
      (SELECT AVG(West_30_Min_Operating_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS previous_year_clearing_price,
    NULL AS volume,
    /**** 12 month rolling avg ****/
      (SELECT AVG(West_30_Min_Operating_Reserve) FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
    WHERE time_stamp  BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS one_year_avg,
       NULL AS "capacity",
       b.id AS bi_dim_date_id_local
      /******************************/
FROM (SELECT * FROM nyiso_ancillary_service_prices_realtime_raw_15_min_interval
WHERE time_stamp > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1148))) a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id)FROM bi_fact_markets_part WHERE bi_dim_market_id =1148))) b
ON a.time_stamp=b.timestamp
JOIN
(SELECT id FROM bi_dim_market WHERE iso='NYISO' AND market='Real-Time Regulation' AND service='Operating Reserve' AND zone='West') c;
/********PJM Ancillary Regulation A****/
REPLACE INTO bi_fact_markets_part
SELECT a.id AS bi_dim_date_id,
market_id AS bi_dim_market_id,
cp AS clearing_price,
30_day_avg AS thirty_day_avg,
90_day_avg AS ninety_day_avg,
1_year_avg AS previous_year_clearing_price,
NULL AS volume,
12_month_avg AS one_year_avg,
 NULL AS "capacity",
  d.id AS bi_dim_date_id_local
 -- id-16 AS bi_dim_date_id_local
 FROM
      (SELECT id,TIMESTAMP_gmt FROM bi_dim_date WHERE TIMESTAMP_gmt > (SELECT timestamp_gmt FROM bi_dim_date WHERE id = 
          (SELECT MAX(bi_dim_date_id_local)FROM bi_fact_markets_part WHERE bi_dim_market_id =1)
	  ))a
     JOIN
       (SELECT CONVERT_TZ(b.time_stamp,'US/Eastern','GMT') AS time_stamp,1 AS market_id,b.time_stamp AS local_timestamp,
         (`RTO Regulation Performance`+`RTO Regulation Capability`) AS cp,
       -- rmcp AS cp,
(SELECT 
ROUND(AVG((`RTO Regulation Performance`+`RTO Regulation Capability`)),2)
FROM pjm_ancillary_dam_raw
WHERE CONVERT_TZ(time_stamp,'US/Eastern','GMT') 
BETWEEN DATE_SUB(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'),INTERVAL 29 DAY) AND
CONVERT_TZ(b.time_stamp,'US/Eastern','GMT') 
AND HOUR(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'))=HOUR(CONVERT_TZ(time_stamp,'US/Eastern','GMT'))) AS 30_day_avg,
(SELECT 
ROUND(AVG((`RTO Regulation Performance`+`RTO Regulation Capability`)),2)
FROM pjm_ancillary_dam_raw
WHERE CONVERT_TZ(time_stamp,'US/Eastern','GMT') BETWEEN DATE_SUB(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'),INTERVAL 89 DAY) AND
CONVERT_TZ(b.time_stamp,'US/Eastern','GMT') AND HOUR(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'))=HOUR(CONVERT_TZ(time_stamp,'US/Eastern','GMT'))) AS 90_day_avg,
/**** 12 month rolling avg ****/
(SELECT 
ROUND(AVG((`RTO Regulation Performance`+`RTO Regulation Capability`)),2)
FROM pjm_ancillary_dam_raw
WHERE CONVERT_TZ(time_stamp,'US/Eastern','GMT') BETWEEN DATE_SUB(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'),INTERVAL 1 YEAR) AND
CONVERT_TZ(b.time_stamp,'US/Eastern','GMT') AND HOUR(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'))=HOUR(CONVERT_TZ(time_stamp,'US/Eastern','GMT'))) AS 12_month_avg,
/*******************************/
(SELECT 
ROUND(AVG((`RTO Regulation Performance`+`RTO Regulation Capability`)),2)
FROM pjm_ancillary_dam_raw
WHERE CONVERT_TZ(time_stamp,'US/Eastern','GMT') = DATE_SUB(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'),INTERVAL 1 YEAR) 
AND HOUR(CONVERT_TZ(time_stamp,'US/Eastern','GMT'))=HOUR(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'))) AS 1_year_avg
FROM pjm_ancillary_dam_raw b
WHERE CONVERT_TZ(time_stamp,'US/Eastern','GMT') > (SELECT timestamp_gmt FROM bi_dim_date WHERE id = 
(SELECT MAX(bi_dim_date_id_local)FROM bi_fact_markets_part WHERE bi_dim_market_id =1)
) ) c
ON a.TIMESTAMP_gmt=CONVERT_TZ(c.time_stamp,'US/Eastern','GMT')
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = 
(SELECT MAX(bi_dim_date_id_local)FROM bi_fact_markets_part WHERE bi_dim_market_id =1)
)) d
ON d.timestamp = c.local_timestamp
;
/********PJM Ancillary Regulation D****/
REPLACE INTO bi_fact_markets_part
SELECT a.id AS bi_dim_date_id,
market_id AS bi_dim_market_id,
cp AS clearing_price,
30_day_avg AS thirty_day_avg,
90_day_avg AS ninety_day_avg,
1_year_avg AS previous_year_clearing_price,
NULL AS volume,
12_month_avg AS one_year_avg,
 NULL AS "capacity",
  d.id AS bi_dim_date_id_local
 -- id-16 AS bi_dim_date_id_local
 FROM
      (SELECT id,TIMESTAMP_gmt FROM bi_dim_date WHERE TIMESTAMP_gmt > (SELECT timestamp_gmt FROM bi_dim_date WHERE id = 
           1536957
	  ))a
     JOIN
       (SELECT CONVERT_TZ(b.time_stamp,'US/Eastern','GMT') AS time_stamp,3 AS market_id,b.time_stamp AS local_timestamp,
         ((`RTO Regulation Performance`*`RTO Marginal Benefits Factor`)+`RTO Regulation Capability`) AS cp,
       -- rmcp AS cp,
(SELECT 
ROUND(AVG( ((`RTO Regulation Performance`*`RTO Marginal Benefits Factor`)+`RTO Regulation Capability`)),2)
FROM pjm_ancillary_dam_raw
WHERE CONVERT_TZ(time_stamp,'US/Eastern','GMT') 
BETWEEN DATE_SUB(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'),INTERVAL 29 DAY) AND
CONVERT_TZ(b.time_stamp,'US/Eastern','GMT') 
AND HOUR(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'))=HOUR(CONVERT_TZ(time_stamp,'US/Eastern','GMT'))) AS 30_day_avg,
(SELECT 
ROUND(AVG( ((`RTO Regulation Performance`*`RTO Marginal Benefits Factor`)+`RTO Regulation Capability`)),2)
FROM pjm_ancillary_dam_raw
WHERE CONVERT_TZ(time_stamp,'US/Eastern','GMT') BETWEEN DATE_SUB(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'),INTERVAL 89 DAY) AND
CONVERT_TZ(b.time_stamp,'US/Eastern','GMT') AND HOUR(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'))=HOUR(CONVERT_TZ(time_stamp,'US/Eastern','GMT'))) AS 90_day_avg,
/**** 12 month rolling avg ****/
(SELECT 
ROUND(AVG( ((`RTO Regulation Performance`*`RTO Marginal Benefits Factor`)+`RTO Regulation Capability`)),2)
FROM pjm_ancillary_dam_raw
WHERE CONVERT_TZ(time_stamp,'US/Eastern','GMT') BETWEEN DATE_SUB(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'),INTERVAL 1 YEAR) AND
CONVERT_TZ(b.time_stamp,'US/Eastern','GMT') AND HOUR(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'))=HOUR(CONVERT_TZ(time_stamp,'US/Eastern','GMT'))) AS 12_month_avg,
/*******************************/
(SELECT 
ROUND(AVG( ((`RTO Regulation Performance`*`RTO Marginal Benefits Factor`)+`RTO Regulation Capability`)),2)
FROM pjm_ancillary_dam_raw
WHERE CONVERT_TZ(time_stamp,'US/Eastern','GMT') = DATE_SUB(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'),INTERVAL 1 YEAR) 
AND HOUR(CONVERT_TZ(time_stamp,'US/Eastern','GMT'))=HOUR(CONVERT_TZ(b.time_stamp,'US/Eastern','GMT'))) AS 1_year_avg
FROM pjm_ancillary_dam_raw b
WHERE CONVERT_TZ(time_stamp,'US/Eastern','GMT') > (SELECT timestamp_gmt FROM bi_dim_date WHERE id = 
1536957
) ) c
ON a.TIMESTAMP_gmt=CONVERT_TZ(c.time_stamp,'US/Eastern','GMT')
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = 
1536957
)) d
ON d.timestamp = c.local_timestamp
;
/********PJM Ancillary RTO Regulation Performance ****/
REPLACE INTO bi_fact_markets_part
SELECT a.id AS bi_dim_date_id,
market_id AS bi_dim_market_id,
RMP AS clearing_price,
30_day_avg AS thirty_day_avg,
90_day_avg AS ninety_day_avg,
1_year_avg AS previous_year_clearing_price,
NULL AS volume,
12_month_avg AS one_year_avg,
 NULL AS "capacity",
 d.id AS bi_dim_date_id_local
 FROM
      (SELECT id,TIMESTAMP_gmt FROM bi_dim_date WHERE TIMESTAMP_gmt > (SELECT timestamp_gmt FROM bi_dim_date WHERE id = 
           (SELECT MAX(bi_dim_date_id_local)FROM bi_fact_markets_part WHERE bi_dim_market_id =11)
	  ))a
     JOIN
       (SELECT CONVERT_TZ(b.time_stamp,'US/Eastern','GMT') AS time_stamp,11 AS market_id,b.time_stamp AS local_timestamp,
         `RTO Regulation Performance` AS RMP,
       -- rmcp AS cp,
NULL AS 30_day_avg,
NULL AS 90_day_avg,
NULL AS 12_month_avg,
NULL AS 1_year_avg
FROM pjm_ancillary_dam_raw b
WHERE CONVERT_TZ(time_stamp,'US/Eastern','GMT') > (SELECT timestamp_gmt FROM bi_dim_date WHERE id = 
 (SELECT MAX(bi_dim_date_id_local)FROM bi_fact_markets_part WHERE bi_dim_market_id =11)
) ) c
ON a.TIMESTAMP_gmt=CONVERT_TZ(c.time_stamp,'US/Eastern','GMT')
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = 
 (SELECT MAX(bi_dim_date_id_local)FROM bi_fact_markets_part WHERE bi_dim_market_id =11)
)) d
ON d.timestamp = c.local_timestamp
;
/*********PJM Ancillary RTO Regulation Performance END *********/
/*********PJM Ancillary RTO Regulation Capability *********/
REPLACE INTO bi_fact_markets_part
SELECT a.id AS bi_dim_date_id,
market_id AS bi_dim_market_id,
RMC AS clearing_price,
30_day_avg AS thirty_day_avg,
90_day_avg AS ninety_day_avg,
1_year_avg AS previous_year_clearing_price,
NULL AS volume,
12_month_avg AS one_year_avg,
 NULL AS "capacity",
 d.id AS bi_dim_date_id_local
 
 FROM
      (SELECT id,TIMESTAMP_gmt FROM bi_dim_date WHERE TIMESTAMP_gmt > (SELECT timestamp_gmt FROM bi_dim_date WHERE id = 
           (SELECT MAX(bi_dim_date_id_local)FROM bi_fact_markets_part WHERE bi_dim_market_id =12)
	  ))a
     JOIN
       (SELECT CONVERT_TZ(b.time_stamp,'US/Eastern','GMT') AS time_stamp,12 AS market_id,b.time_stamp AS local_timestamp,
         `RTO Regulation Capability` AS RMC,
       -- rmcp AS cp,
NULL AS 30_day_avg,
NULL AS 90_day_avg,
NULL AS 12_month_avg,
NULL AS 1_year_avg
FROM pjm_ancillary_dam_raw b
WHERE CONVERT_TZ(time_stamp,'US/Eastern','GMT') > (SELECT timestamp_gmt FROM bi_dim_date WHERE id = 
 (SELECT MAX(bi_dim_date_id_local)FROM bi_fact_markets_part WHERE bi_dim_market_id =12)
) ) c
ON a.TIMESTAMP_gmt=CONVERT_TZ(c.time_stamp,'US/Eastern','GMT')
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = 
 (SELECT MAX(bi_dim_date_id_local)FROM bi_fact_markets_part WHERE bi_dim_market_id =12)
)) d
ON d.timestamp = c.local_timestamp
;
/*********PJM Ancillary RTO Regulation Capability END *********/
/*********PJM Ancillary RTO Marginal Benefits Factor *********/
REPLACE INTO bi_fact_markets_part
SELECT a.id AS bi_dim_date_id,
market_id AS bi_dim_market_id,
BenefitsFactor AS clearing_price,
30_day_avg AS thirty_day_avg,
90_day_avg AS ninety_day_avg,
1_year_avg AS previous_year_clearing_price,
NULL AS volume,
12_month_avg AS one_year_avg,
 NULL AS "capacity",
d.id AS bi_dim_date_id_local
 FROM
      (SELECT id,TIMESTAMP_gmt FROM bi_dim_date WHERE TIMESTAMP_gmt > (SELECT timestamp_gmt FROM bi_dim_date WHERE id = 
           (SELECT MAX(bi_dim_date_id_local)FROM bi_fact_markets_part WHERE bi_dim_market_id =13)
	  ))a
     JOIN
       (SELECT CONVERT_TZ(b.time_stamp,'US/Eastern','GMT') AS time_stamp,13 AS market_id,b.time_stamp AS local_timestamp,
         `RTO Marginal Benefits Factor` AS BenefitsFactor,
       -- rmcp AS cp,
NULL AS 30_day_avg,
NULL AS 90_day_avg,
NULL AS 12_month_avg,
NULL AS 1_year_avg
FROM pjm_ancillary_dam_raw b
WHERE CONVERT_TZ(time_stamp,'US/Eastern','GMT') > (SELECT timestamp_gmt FROM bi_dim_date WHERE id = 
 (SELECT MAX(bi_dim_date_id_local)FROM bi_fact_markets_part WHERE bi_dim_market_id =13)
) ) c
ON a.TIMESTAMP_gmt=CONVERT_TZ(c.time_stamp,'US/Eastern','GMT')
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id = 
 (SELECT MAX(bi_dim_date_id_local)FROM bi_fact_markets_part WHERE bi_dim_market_id =13)
)) d
ON d.timestamp = c.local_timestamp
;
/*********PJM Ancillary RTO Marginal Benefits Factor END *********/
/********MISO Non-Spinning Reserve****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.clearing_price AS clearing_price,
        (SELECT ROUND(AVG(clearing_price),2) FROM miso_ancillary_dam_raw WHERE TIMESTAMP BETWEEN DATE_SUB(a.TIMESTAMP,INTERVAL 29 DAY) AND
	a.TIMESTAMP AND HOUR(a.TIMESTAMP)=HOUR(TIMESTAMP) AND service='Non-Spinning Reserve') AS thirty_day_avg,
	(SELECT ROUND(AVG(clearing_price),2) FROM miso_ancillary_dam_raw WHERE TIMESTAMP BETWEEN DATE_SUB(a.TIMESTAMP,INTERVAL 89 DAY) AND
	a.TIMESTAMP AND HOUR(a.TIMESTAMP)=HOUR(TIMESTAMP) AND service='Non-Spinning Reserve') AS ninety_day_avg,
        (SELECT ROUND(AVG(clearing_price),2) FROM miso_ancillary_dam_raw WHERE TIMESTAMP = DATE_SUB(a.TIMESTAMP,INTERVAL 1 YEAR)
	AND HOUR(a.TIMESTAMP)=HOUR(TIMESTAMP) AND service='Non-Spinning Reserve') AS previous_year_clearing_price,
        NULL AS volume,
      /**** 12 month rolling avg ****/
     (SELECT ROUND(AVG(clearing_price),2) FROM miso_ancillary_dam_raw WHERE TIMESTAMP BETWEEN DATE_SUB(a.TIMESTAMP,INTERVAL 1 YEAR) AND
	a.TIMESTAMP AND HOUR(a.TIMESTAMP)=HOUR(TIMESTAMP) AND service='Non-Spinning Reserve') AS one_year_avg,
	 NULL AS "capacity",
	 b.id AS bi_dim_date_id_local
     /******************************/
FROM (SELECT * FROM miso_ancillary_dam_raw WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=4002)) AND service='Non-Spinning Reserve') a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=4002))) b ON b.timestamp =a.TIMESTAMP
JOIN
(SELECT * FROM bi_dim_market WHERE iso='MISO' AND market='Day-Ahead Regulation' AND service='Non-Spinning Reserve') c;
/********MISO Regulation****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.clearing_price AS clearing_price,
        (SELECT ROUND(AVG(clearing_price),2) FROM miso_ancillary_dam_raw WHERE TIMESTAMP BETWEEN DATE_SUB(a.TIMESTAMP,INTERVAL 29 DAY) AND
	a.TIMESTAMP AND HOUR(a.TIMESTAMP)=HOUR(TIMESTAMP) AND service='Regulation') AS thirty_day_avg,
	(SELECT ROUND(AVG(clearing_price),2) FROM miso_ancillary_dam_raw WHERE TIMESTAMP BETWEEN DATE_SUB(a.TIMESTAMP,INTERVAL 89 DAY) AND
	a.TIMESTAMP AND HOUR(a.TIMESTAMP)=HOUR(TIMESTAMP) AND service='Regulation') AS ninety_day_avg,
        (SELECT ROUND(AVG(clearing_price),2) FROM miso_ancillary_dam_raw WHERE TIMESTAMP = DATE_SUB(a.TIMESTAMP,INTERVAL 1 YEAR)
	AND HOUR(a.TIMESTAMP)=HOUR(TIMESTAMP) AND service='Regulation') AS previous_year_clearing_price,
        NULL AS volume,
     /**** 12 month rolling avg ****/
    (SELECT ROUND(AVG(clearing_price),2) FROM miso_ancillary_dam_raw WHERE TIMESTAMP BETWEEN DATE_SUB(a.TIMESTAMP,INTERVAL 1 YEAR) AND
	a.TIMESTAMP AND HOUR(a.TIMESTAMP)=HOUR(TIMESTAMP) AND service='Regulation') AS one_year_avg,
	 NULL AS "capacity",
	 b.id AS bi_dim_date_id_local
    /*******************************/
FROM (SELECT * FROM miso_ancillary_dam_raw WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=4000)) AND service='Regulation') a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=4000))) b ON b.timestamp =a.TIMESTAMP
JOIN
(SELECT * FROM bi_dim_market WHERE iso='MISO' AND market='Day-Ahead Regulation' AND service='Regulation') c;
/********MISO Spinning Reserve****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.clearing_price AS clearing_price,
        (SELECT ROUND(AVG(clearing_price),2) FROM miso_ancillary_dam_raw WHERE TIMESTAMP BETWEEN DATE_SUB(a.TIMESTAMP,INTERVAL 29 DAY) AND
	a.TIMESTAMP AND HOUR(a.TIMESTAMP)=HOUR(TIMESTAMP) AND service='Spinning Reserve') AS thirty_day_avg,
	(SELECT ROUND(AVG(clearing_price),2) FROM miso_ancillary_dam_raw WHERE TIMESTAMP BETWEEN DATE_SUB(a.TIMESTAMP,INTERVAL 89 DAY) AND
	a.TIMESTAMP AND HOUR(a.TIMESTAMP)=HOUR(TIMESTAMP) AND service='Spinning Reserve') AS ninety_day_avg,
        (SELECT ROUND(AVG(clearing_price),2) FROM miso_ancillary_dam_raw WHERE TIMESTAMP = DATE_SUB(a.TIMESTAMP,INTERVAL 1 YEAR)
	AND HOUR(a.TIMESTAMP)=HOUR(TIMESTAMP) AND service='Spinning Reserve') AS previous_year_clearing_price,
        NULL AS volume,
     /**** 12 month rolling avg ****/
    (SELECT ROUND(AVG(clearing_price),2) FROM miso_ancillary_dam_raw WHERE TIMESTAMP BETWEEN DATE_SUB(a.TIMESTAMP,INTERVAL 1 YEAR) AND
	a.TIMESTAMP AND HOUR(a.TIMESTAMP)=HOUR(TIMESTAMP) AND service='Spinning Reserve') AS one_year_avg,
	 NULL AS "capacity",
	 b.id AS bi_dim_date_id_local
    /*******************************/
FROM (SELECT * FROM miso_ancillary_dam_raw WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=4001)) AND service='Spinning Reserve') a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=4001))) b ON b.timestamp =a.TIMESTAMP
JOIN
(SELECT * FROM bi_dim_market WHERE iso='MISO' AND market='Day-Ahead Regulation' AND service='Spinning Reserve') c ;
/*iso ne scripts*/
REPLACE INTO bi_fact_markets_part
SELECT b.id AS bi_dim_date_id,
       7000 AS bi_dim_market_id,
       a.clearing_price AS clearing_price,
       (SELECT ROUND(AVG(clearing_price),2) FROM neiso_ancillary_prices_raw WHERE datefinal BETWEEN DATE_SUB(a.datefinal,INTERVAL 29 DAY) AND
	a.datefinal AND HOUR(a.datefinal)=HOUR(datefinal) ) AS thirty_day_avg,          
       (SELECT ROUND(AVG(clearing_price),2) FROM neiso_ancillary_prices_raw WHERE datefinal BETWEEN DATE_SUB(a.datefinal,INTERVAL 89 DAY) AND
	a.datefinal AND HOUR(a.datefinal)=HOUR(datefinal) ) AS ninety_day_avg,
	(SELECT ROUND(AVG(clearing_price),2) FROM neiso_ancillary_prices_raw WHERE datefinal = DATE_SUB(a.datefinal,INTERVAL 1 YEAR)
	AND HOUR(a.datefinal)=HOUR(datefinal) ) AS previous_year_clearing_price,
	NULL AS volume,
      /**** 12 month rolling avg ****/
    (SELECT ROUND(AVG(clearing_price),2) FROM neiso_ancillary_prices_raw WHERE datefinal BETWEEN DATE_SUB(a.datefinal,INTERVAL 1 YEAR) AND
	a.datefinal AND HOUR(a.datefinal)=HOUR(datefinal) ) AS one_year_avg,
	 NULL AS "capacity",
	 b.id AS bi_dim_date_id_local
    /*******************************/
FROM (SELECT * FROM neiso_ancillary_prices_raw WHERE datefinal > (SELECT TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=7000)) ) a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP > (SELECT TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=7000))) b ON b.timestamp =a.datefinal ;
/********ERCOT NON Spinning Reserve****/	
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        2001 AS bi_dim_market_id,
        -- a.cp AS clearing_price,
        a.MCPC AS clearing_price,
        (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
	a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('MCPCNS','NSPIN') )
	AS thirty_day_avg,
	(SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
	a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('MCPCNS','NSPIN'))
	AS ninety_day_avg,
        (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') = DATE_SUB(a.time_stamp,INTERVAL 1 YEAR)
	AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('MCPCNS','NSPIN')) AS previous_year_clearing_price,
	c.quantity AS volume,
     /**** 12 month rolling avg ****/
    (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
	a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('MCPCNS','NSPIN'))
	AS one_year_avg,
	 NULL AS "capacity",
	 d.id AS bi_dim_date_id_local
    /*******************************/
FROM (SELECT time_stamp AS local_timestamp,CONVERT_TZ(time_stamp,'US/Central','GMT') AS time_stamp,AncillaryType,MCPC 
FROM ercot_dam_ancillary_raw
WHERE time_stamp >= (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2001)) AND AncillaryType IN ('MCPCNS','NSPIN')) a
JOIN
(SELECT id,TIMESTAMP,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=2001))) b 
ON b.timestamp_gmt =a.time_stamp
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=2001))) AS d 
ON d.TIMESTAMP =a.local_timestamp
LEFT JOIN
(SELECT CONVERT_TZ(date_time,'US/Central','GMT') AS date_time,quantity,ancillarytype FROM ercot_dam_ancillary_plan_raw WHERE date_time >= (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2001)) AND 
ancillarytype = "NSPIN")c ON c.date_time = b.timestamp_gmt 
/**JOIN
(SELECT CONVERT_TZ(date_time,'US/Central','GMT') AS time_stamp, mcpc FROM ercot_dam_capacity
WHERE date_time >= '2012-01-02 01:00:00' AND ancillarytype IN ('MCPCNS','NSPIN'))d ON d.time_stamp = c.date_time**/
;
/********ERCOT Spinning Reserve****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        2002 AS bi_dim_market_id,
        a.MCPC AS clearing_price,
        (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
     a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('MCPCRS','RRS'))
    AS thirty_day_avg,
    (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
     a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('MCPCRS','RRS'))
    AS ninety_day_avg,
        (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') = DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) 
AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('MCPCRS','RRS')) AS previous_year_clearing_price,
c.quantity AS volume,
 /**** 12 month rolling avg ****/
    (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
     a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('MCPCRS','RRS'))
    AS one_year_avg,
     NULL AS "capacity",
     d.id AS bi_dim_date_id_local
    /*******************************/
FROM (SELECT time_stamp AS local_timestamp,CONVERT_TZ(time_stamp,'US/Central','GMT') AS time_stamp,AncillaryType,MCPC 
FROM ercot_dam_ancillary_raw 
WHERE time_stamp >=(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2002)) AND AncillaryType IN ('MCPCRS','RRS')) a
JOIN
(SELECT id,TIMESTAMP,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt >= 
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=2002))) b 
ON b.timestamp_gmt =a.time_stamp
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=2002))) AS d 
ON d.TIMESTAMP =a.local_timestamp
LEFT JOIN
(SELECT CONVERT_TZ(date_time,'US/Central','GMT') AS date_time,quantity,ancillarytype FROM ercot_dam_ancillary_plan_raw WHERE date_time >= (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2002)) AND 
ancillarytype = "RRS")c ON c.date_time = b.timestamp_gmt
/**JOIN
(SELECT CONVERT_TZ(date_time,'US/Central','GMT') AS time_stamp, mcpc FROM ercot_dam_capacity
WHERE date_time >= '2012-01-02 01:00:00' AND ancillarytype IN ('MCPCRS','RRS'))d ON d.time_stamp = c.date_time**/
 ;
/********ERCOT Regulation down****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        2005 AS bi_dim_market_id,
        a.MCPC AS clearing_price,
        (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
	a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGDN','MCPCRD') )
	AS thirty_day_avg,
	(SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
	a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGDN','MCPCRD') )
	AS ninety_day_avg,
        (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') = DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) 
	AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGDN','MCPCRD') ) AS previous_year_clearing_price,
        c.quantity AS volume,
     /**** 12 month rolling avg ****/
    (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
	a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGDN','MCPCRD') )
	AS one_year_avg,
	NULL AS "capacity",
	d.id AS bi_dim_date_id_local
    /*****************************/
	
FROM (SELECT time_stamp AS local_timestamp,CONVERT_TZ(time_stamp,'US/Central','GMT') AS time_stamp,AncillaryType,MCPC FROM ercot_dam_ancillary_raw 
WHERE time_stamp >= (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2005)) AND AncillaryType IN ('REGDN','MCPCRD') ) a
JOIN
(SELECT id,TIMESTAMP,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=2005))) b 
ON b.timestamp_gmt =a.time_stamp 
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=2005))) AS d 
ON d.TIMESTAMP =a.local_timestamp
LEFT JOIN
(SELECT CONVERT_TZ(date_time,'US/Central','GMT') AS date_time,quantity,ancillarytype FROM ercot_dam_ancillary_plan_raw WHERE date_time >= (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2005)) AND 
ancillarytype = "REGDN")c ON c.date_time = b.timestamp_gmt
/**JOIN
(SELECT CONVERT_TZ(date_time,'US/Central','GMT') AS time_stamp, mcpc FROM ercot_dam_capacity
WHERE date_time >= '2012-01-02 01:00:00' AND ancillarytype = "REGDN")d ON d.time_stamp = c.date_time**/
 ;
/********ERCOT Regulation up****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        2006 AS bi_dim_market_id,
        a.MCPC AS clearing_price,
        (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
     a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGUP','MCPCRU') )
    AS thirty_day_avg,
    (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
     a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGUP','MCPCRU'))
    AS ninety_day_avg,
        (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') = DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) 
AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGUP','MCPCRU')) AS previous_year_clearing_price,
 c.quantity AS volume,
 /**** 12 month rolling avg ****/
    (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
     a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGUP','MCPCRU'))
    AS one_year_avg,
     NULL AS "capacity",
     d.id AS bi_dim_date_id_local
    /******************************/
 
FROM (SELECT time_stamp AS local_timestamp,CONVERT_TZ(time_stamp,'US/Central','GMT') AS time_stamp,AncillaryType,MCPC FROM ercot_dam_ancillary_raw 
WHERE time_stamp >= (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2006)) AND AncillaryType IN ('REGUP','MCPCRU')) a
JOIN
(SELECT id,TIMESTAMP,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=2006))) b 
ON b.timestamp_gmt =a.time_stamp 
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=2006))) AS d 
ON d.TIMESTAMP =a.local_timestamp
LEFT JOIN
(SELECT CONVERT_TZ(date_time,'US/Central','GMT') AS date_time,quantity,ancillarytype FROM ercot_dam_ancillary_plan_raw WHERE date_time >= (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2006)) AND 
ancillarytype = "REGUP")c ON c.date_time = b.timestamp_gmt 
/**JOIN
(SELECT CONVERT_TZ(date_time,'US/Central','GMT') AS time_stamp, mcpc FROM ercot_dam_capacity
WHERE date_time >= '2012-01-02 01:00:00' AND ancillarytype = "REGUP")d ON d.time_stamp = c.date_time**/
;
/********ERCOT Regulation****/
REPLACE INTO bi_fact_markets_part
SELECT  dn.bi_dim_date_id AS bi_dim_date_id,
	2004 AS bi_dim_market_id,
	dn.clearing_price+up.clearing_price AS clearing_price,
	dn.thirty_day_avg+up.thirty_day_avg AS thirty_day_avg,
	dn.ninety_day_avg+up.ninety_day_avg AS ninety_day_avg,
	dn.previous_year_clearing_price+up.previous_year_clearing_price AS previous_year_clearing_price ,
	NULL AS volume,
        dn.one_year_avg+up.one_year_avg AS one_year_avg,
        NULL AS "capacity",
        dn.bi_dim_date_id_local AS bi_dim_date_id_local
FROM
(SELECT  b.id AS bi_dim_date_id,b.timestamp,
        2005 AS bi_dim_market_id,
        a.MCPC AS clearing_price,
        (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
	a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGDN','MCPCRD') )
	AS thirty_day_avg,
	(SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
	a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGDN','MCPCRD') )
	AS ninety_day_avg,
     /**** 12 month rolling avg ****/
     (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
	a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGDN','MCPCRD') )
	AS one_year_avg,
     /******************************/
        (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') = DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) 
	AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGDN','MCPCRD') ) AS previous_year_clearing_price,
	0 AS volume,
	f.id AS bi_dim_date_id_local
FROM (SELECT time_stamp AS local_timestamp,CONVERT_TZ(time_stamp,'US/Central','GMT') AS time_stamp,AncillaryType,MCPC FROM ercot_dam_ancillary_raw 
WHERE time_stamp>=(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2004)) AND AncillaryType IN ('REGDN','MCPCRD') ) a
JOIN
(SELECT id,TIMESTAMP,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=2004))) b 
ON b.timestamp_gmt =a.time_stamp
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=2004))) AS f 
ON f.TIMESTAMP =a.local_timestamp
) dn
JOIN
(SELECT  b.id AS bi_dim_date_id,
        2006 AS bi_dim_market_id,
        a.MCPC AS clearing_price,
        (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
     a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGUP','MCPCRU') )
    AS thirty_day_avg,
    (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
     a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGUP','MCPCRU'))
    AS ninety_day_avg,
    /**** 12 month rolling avg ****/
    (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
     a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGUP','MCPCRU'))
    AS one_year_avg,
    /******************************/
        (SELECT ROUND(AVG(MCPC),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') = DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) 
AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND AncillaryType IN ('REGUP','MCPCRU')) AS previous_year_clearing_price,
f.id AS bi_dim_date_id_local
FROM (SELECT time_stamp AS local_timestamp,CONVERT_TZ(time_stamp,'US/Central','GMT') AS time_stamp,AncillaryType,MCPC FROM ercot_dam_ancillary_raw 
WHERE time_stamp>=(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2004)) AND AncillaryType IN ('REGUP','MCPCRU')) a
JOIN
(SELECT id,TIMESTAMP,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt>=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=2004))) b 
ON b.timestamp_gmt =a.time_stamp
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=2004))) AS f 
ON f.TIMESTAMP =a.local_timestamp
) up
ON dn.bi_dim_date_id=up.bi_dim_date_id;
/********ERCOT Regulation****/
/****
REPLACE INTO bi_fact_markets_part
SELECT dn.bi_dim_date_id AS bi_dim_date_id,
	2004 AS bi_dim_market_id,
	dn.clearing_price+up.clearing_price AS clearing_price,
	dn.thirty_day_avg+up.thirty_day_avg AS thirty_day_avg,
	dn.ninety_day_avg+up.ninety_day_avg AS ninety_day_avg,
	dn.previous_year_clearing_price+up.previous_year_clearing_price AS previous_year_clearing_price ,
	NULL AS volume,
    dn.one_year_avg+up.one_year_avg AS one_year_avg,
     NULL AS "capacity"
FROM
(SELECT  b.id AS bi_dim_date_id,
        2005 AS bi_dim_market_id,
        a.cp AS clearing_price,
        (SELECT ROUND(AVG(cp),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
	a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND zone IN ('REGDN','MCPCRD') )
	AS thirty_day_avg,
	(SELECT ROUND(AVG(cp),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
	a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND zone IN ('REGDN','MCPCRD') )
	AS ninety_day_avg,
     -- 12 month rolling avg begin
     (SELECT ROUND(AVG(cp),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
	a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND zone IN ('REGDN','MCPCRD') )
	AS one_year_avg,
     -- 12 month rolling avg  end 
        (SELECT ROUND(AVG(cp),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') = DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) 
	AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND zone IN ('REGDN','MCPCRD') ) AS previous_year_clearing_price,
	0 AS volume
FROM (SELECT CONVERT_TZ(time_stamp,'US/Central','GMT') AS time_stamp,zone,cp FROM ercot_dam_ancillary_raw 
WHERE time_stamp>=(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2004)) AND zone IN ('REGDN','MCPCRD') ) a
JOIN
(SELECT id,TIMESTAMP,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt>=(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2004))) b ON b.timestamp_gmt =a.time_stamp) dn
JOIN
(SELECT  b.id AS bi_dim_date_id,
        2006 AS bi_dim_market_id,
        a.cp AS clearing_price,
        (SELECT ROUND(AVG(cp),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
     a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND zone IN ('REGUP','MCPCRU') )
    AS thirty_day_avg,
    (SELECT ROUND(AVG(cp),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
     a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND zone IN ('REGUP','MCPCRU'))
    AS ninety_day_avg,
    -- 12 month rolling avg begin 
    (SELECT ROUND(AVG(cp),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
     a.time_stamp AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND zone IN ('REGUP','MCPCRU'))
    AS one_year_avg,
    -- 12 month rolling avg end
        (SELECT ROUND(AVG(cp),2) FROM ercot_dam_ancillary_raw WHERE CONVERT_TZ(time_stamp,'US/Central','GMT') = DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) 
AND HOUR(a.time_stamp)=HOUR(CONVERT_TZ(time_stamp,'US/Central','GMT')) AND zone IN ('REGUP','MCPCRU')) AS previous_year_clearing_price
FROM (SELECT CONVERT_TZ(time_stamp,'US/Central','GMT') AS time_stamp,zone,cp FROM ercot_dam_ancillary_raw 
WHERE time_stamp>=(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2004)) AND zone IN ('REGUP','MCPCRU')) a
JOIN
(SELECT id,TIMESTAMP,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt>=(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2004))) b ON b.timestamp_gmt =a.time_stamp) up
ON dn.bi_dim_date_id=up.bi_dim_date_id;
****/
/********CAISO Non-Spinning Reserve****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.clearing_price AS clearing_price,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 29 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='NR') AS thirty_day_avg,
	(SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 89 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='NR') AS ninety_day_avg,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') = DATE_SUB(a.DATETIME,INTERVAL 1 YEAR)
	AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='NR') AS previous_year_clearing_price,
        d.clearing_price AS volume,
    /**** 12 month rolling avg ****/
     (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 1 YEAR) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='NR') AS one_year_avg,
	 NULL AS "capacity",
	 e.id AS bi_dim_date_id_local
     /******************************/
FROM (SELECT DATETIME AS local_timestamp,CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_raw WHERE DATETIME >= (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3000)) AND anc_type='NR') a
JOIN
(SELECT id,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt >= (SELECT timestamp_gmt FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3000))) b ON b.timestamp_gmt =a.datetime
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >= (SELECT TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3000))) AS e ON e.TIMESTAMP =a.local_timestamp	
JOIN
(SELECT CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_volume WHERE DATETIME >= (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3000)) AND anc_type='NR')d
ON a.datetime=d.datetime
JOIN
(SELECT * FROM bi_dim_market WHERE iso='caiso' AND market='Day-Ahead Regulation' AND service='Non-Spinning Reserve') c;
/********CAISO Regulation Down****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.clearing_price AS clearing_price,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 29 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RD') AS thirty_day_avg,
	(SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 89 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RD') AS ninety_day_avg,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') = DATE_SUB(a.DATETIME,INTERVAL 1 YEAR)
	AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RD') AS previous_year_clearing_price,
        d.clearing_price AS volume,
     /*** 12 month rolling avg ****/
    (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 1 YEAR) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RD') AS one_year_avg,
	 NULL AS "capacity",
	 e.id AS bi_dim_date_id_local
    /*****************************/
FROM (SELECT DATETIME AS local_timestamp,CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_raw WHERE DATETIME >= (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3001)) AND anc_type='RD') a
JOIN
(SELECT id,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt >= (SELECT timestamp_gmt FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3001))) b ON b.timestamp_gmt =a.datetime
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >= (SELECT TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3001))) AS e ON e.TIMESTAMP =a.local_timestamp		
JOIN
(SELECT CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_volume WHERE DATETIME >= (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3001)) AND anc_type='RD')d
ON a.datetime=d.datetime
JOIN
(SELECT * FROM bi_dim_market WHERE iso='caiso' AND market='Day-Ahead Regulation' AND service='Regulation Down') c;
/********CAISO Regulation Up****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.clearing_price AS clearing_price,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 29 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RU') AS thirty_day_avg,
	(SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 89 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RU') AS ninety_day_avg,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') = DATE_SUB(a.DATETIME,INTERVAL 1 YEAR)
	AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RU') AS previous_year_clearing_price,
        d.clearing_price AS volume,
     /**** 12 month rolling avg ****/
     (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 1 YEAR) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RU') AS one_year_avg,
	 NULL AS "capacity",
	 e.id AS bi_dim_date_id_local
     /******************************/
FROM (SELECT DATETIME AS local_timestamp,CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_raw WHERE DATETIME >= (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3002)) AND anc_type='RU') a
JOIN
(SELECT id,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt >= (SELECT timestamp_gmt FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3002))) b ON b.timestamp_gmt =a.datetime
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >=(SELECT TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3002))) AS e ON e.TIMESTAMP =a.local_timestamp		
JOIN
(SELECT CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_volume WHERE DATETIME >= (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3002)) AND anc_type='RU')d
ON a.datetime=d.datetime
JOIN
(SELECT * FROM bi_dim_market WHERE iso='caiso' AND market='Day-Ahead Regulation' AND service='Regulation Up') c;
/********CAISO Spinning Reserve****/
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.clearing_price AS clearing_price,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 29 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='SR') AS thirty_day_avg,
	(SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 89 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='SR') AS ninety_day_avg,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') = DATE_SUB(a.DATETIME,INTERVAL 1 YEAR)
	AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='SR') AS previous_year_clearing_price,
        d.clearing_price AS volume,
    /**** 12 month rolling avg ***/
     (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 1 YEAR) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='SR') AS one_year_avg,
	 NULL AS "capacity",
	 e.id AS bi_dim_date_id_local
     /****************************/
FROM (SELECT DATETIME AS local_timestamp,CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_raw WHERE DATETIME >= (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3003)) AND anc_type='SR') a
JOIN
(SELECT id,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt >= (SELECT timestamp_gmt FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3003))) b ON b.timestamp_gmt =a.datetime
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >= (SELECT TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3003))) AS e ON e.TIMESTAMP =a.local_timestamp		
JOIN
(SELECT CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_volume WHERE DATETIME >= (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3003)) AND anc_type='SR')d
ON a.datetime=d.datetime
JOIN
(SELECT * FROM bi_dim_market WHERE iso='caiso' AND market='Day-Ahead Regulation' AND service='Spinning Reserve') c;
/********CAISO Regulation****/
REPLACE INTO bi_fact_markets_part
SELECT dn.bi_dim_date_id AS bi_dim_date_id,
	3030 AS bi_dim_market_id,
	dn.clearing_price+up.clearing_price AS clearing_price,
	dn.thirty_day_avg+up.thirty_day_avg AS thirty_day_avg,
	dn.ninety_day_avg+up.ninety_day_avg AS ninety_day_avg,
	dn.previous_year_clearing_price+up.previous_year_clearing_price AS previous_year_clearing_price,
	dn.volume + up.volume AS volume,
     dn.one_year_avg+up.one_year_avg AS one_year_avg,
      NULL AS "capacity",
      dn.bi_dim_date_id_local AS bi_dim_date_id_local
FROM
(SELECT  b.id AS bi_dim_date_id,b.timestamp,b.timestamp_gmt,
        c.id AS bi_dim_market_id,
        a.clearing_price AS clearing_price,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 29 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RD') AS thirty_day_avg,
	(SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 89 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RD') AS ninety_day_avg,
     /**** 12 month rolling avg ****/
     (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 1 YEAR) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RD') AS one_year_avg,
     /*******************************/
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') = DATE_SUB(a.DATETIME,INTERVAL 1 YEAR)
	AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RD') AS previous_year_clearing_price,
        d.clearing_price AS volume,
        e.id AS bi_dim_date_id_local
FROM (SELECT DATETIME AS local_timestamp,CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_raw WHERE
 DATETIME >= (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3030)) AND anc_type='RD') a
JOIN
(SELECT id,timestamp_gmt,TIMESTAMP FROM bi_dim_date WHERE timestamp_gmt >= (SELECT timestamp_gmt FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3030))) b ON b.timestamp_gmt =a.datetime
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >= (SELECT TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3030))) AS e ON e.TIMESTAMP =a.local_timestamp		
JOIN
(SELECT CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_volume WHERE DATETIME >= (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3030)) AND anc_type='RD')d
ON a.datetime=d.datetime
JOIN
(SELECT * FROM bi_dim_market WHERE iso='caiso' AND market='Day-Ahead Regulation' AND service='Regulation Down') c) dn
JOIN
(SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.clearing_price AS clearing_price,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 29 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RU') AS thirty_day_avg,
	(SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 89 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RU') AS ninety_day_avg,
     /**** 12 month rolling avg ****/
     (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') BETWEEN DATE_SUB(a.DATETIME,INTERVAL 1 YEAR) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RU') AS one_year_avg,
     /*******************************/
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE CONVERT_TZ(DATETIME,'US/Central','GMT') = DATE_SUB(a.DATETIME,INTERVAL 1 YEAR)
	AND HOUR(a.DATETIME)=HOUR(CONVERT_TZ(DATETIME,'US/Central','GMT')) AND anc_type='RU') AS previous_year_clearing_price,
        d.clearing_price AS volume,
        e.id AS bi_dim_date_id_local
FROM (SELECT DATETIME AS local_timestamp,CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_raw WHERE DATETIME >= (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3030)) AND anc_type='RU') a
JOIN
(SELECT id,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt >= (SELECT timestamp_gmt FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3030))) b ON b.timestamp_gmt =a.datetime
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >= (SELECT TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3030))) AS e ON e.TIMESTAMP =a.local_timestamp		
JOIN
(SELECT CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_volume WHERE DATETIME >= (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3030)) AND anc_type='RU')d
ON a.datetime=d.datetime
JOIN
(SELECT * FROM bi_dim_market WHERE iso='caiso' AND market='Day-Ahead Regulation' AND service='Regulation Up') c) up
ON dn.bi_dim_date_id=up.bi_dim_date_id;
/********CAISO Regulation
REPLACE INTO bi_fact_markets_part
SELECT dn.bi_dim_date_id AS bi_dim_date_id,
	3030 AS bi_dim_market_id,
	dn.clearing_price+up.clearing_price AS clearing_price,
	dn.thirty_day_avg+up.thirty_day_avg AS thirty_day_avg,
	dn.ninety_day_avg+up.ninety_day_avg AS ninety_day_avg,
	dn.previous_year_clearing_price+up.previous_year_clearing_price AS previous_year_clearing_price,
	dn.volume + up.volume AS volume,
     dn.one_year_avg+up.one_year_avg AS one_year_avg,
      NULL AS "capacity"
FROM
(SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.clearing_price AS clearing_price,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE DATETIME BETWEEN DATE_SUB(a.DATETIME,INTERVAL 29 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(DATETIME) AND anc_type='RD') AS thirty_day_avg,
	(SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE DATETIME BETWEEN DATE_SUB(a.DATETIME,INTERVAL 89 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(DATETIME) AND anc_type='RD') AS ninety_day_avg,
     -- 12 month rolling avg begins
     (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE DATETIME BETWEEN DATE_SUB(a.DATETIME,INTERVAL 1 YEAR) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(DATETIME) AND anc_type='RD') AS one_year_avg,
     -- 12 month rolling avg ends
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE DATETIME = DATE_SUB(a.DATETIME,INTERVAL 1 YEAR)
	AND HOUR(a.DATETIME)=HOUR(DATETIME) AND anc_type='RD') AS previous_year_clearing_price,
        d.clearing_price AS volume
FROM (SELECT CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_raw WHERE DATETIME > (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3030)) AND anc_type='RD') a
JOIN
(SELECT id,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt > (SELECT timestamp_gmt FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3030))) b ON b.timestamp_gmt =a.datetime
JOIN
(SELECT CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_volume WHERE DATETIME > (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3030)) AND anc_type='RD')d
ON a.datetime=d.datetime
JOIN
(SELECT * FROM bi_dim_market WHERE iso='caiso' AND market='Day-Ahead Regulation' AND service='Regulation Down') c) dn
JOIN
(SELECT  b.id AS bi_dim_date_id,
        c.id AS bi_dim_market_id,
        a.clearing_price AS clearing_price,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE DATETIME BETWEEN DATE_SUB(a.DATETIME,INTERVAL 29 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(DATETIME) AND anc_type='RU') AS thirty_day_avg,
	(SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE DATETIME BETWEEN DATE_SUB(a.DATETIME,INTERVAL 89 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(DATETIME) AND anc_type='RU') AS ninety_day_avg,
     -- 12 month rolling avg begin
     (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE DATETIME BETWEEN DATE_SUB(a.DATETIME,INTERVAL 1 YEAR) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(DATETIME) AND anc_type='RU') AS one_year_avg,
     -- 12 month rolling avg ends
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dam_ancillary_raw WHERE DATETIME = DATE_SUB(a.DATETIME,INTERVAL 1 YEAR)
	AND HOUR(a.DATETIME)=HOUR(DATETIME) AND anc_type='RU') AS previous_year_clearing_price,
        d.clearing_price AS volume
FROM (SELECT CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_raw WHERE DATETIME > (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3030)) AND anc_type='RU') a
JOIN
(SELECT id,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt > (SELECT timestamp_gmt FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3030))) b ON b.timestamp_gmt =a.datetime
JOIN
(SELECT CONVERT_TZ(DATETIME,'US/Central','GMT') AS DATETIME,clearing_price FROM caiso_dam_ancillary_volume WHERE DATETIME > (SELECT DATE_FORMAT(DATE(TIMESTAMP),'%Y-%m-%d 00:00:00') AS TIMESTAMP FROM bi_dim_date WHERE id=
	(SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id=3030)) AND anc_type='RU')d
ON a.datetime=d.datetime
JOIN
(SELECT * FROM bi_dim_market WHERE iso='caiso' AND market='Day-Ahead Regulation' AND service='Regulation Up') c) up
ON dn.bi_dim_date_id=up.bi_dim_date_id;
/*TAB1: EA_Market_Schedule_Quantities_raw (1st)*/
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        662 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.schedule_mw AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EA_Market_Schedule_Quantities_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period  AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 662))
AND r.participant_resource_name IN ('PT_400021 GU_400020') ORDER BY r.participant_resource_name, r.trading_period; 
/*TAB1: EA_Market_Schedule_Quantities_raw (2nd)*/
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        663 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.schedule_mw AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EA_Market_Schedule_Quantities_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period  AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 663))
AND r.participant_resource_name IN ('PT_400021 GU_400021') ORDER BY r.participant_resource_name, r.trading_period; 
/*TAB1: EA_Market_Schedule_Quantities_raw (3rd)*/
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        664 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.schedule_mw AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EA_Market_Schedule_Quantities_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period  AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 664))
AND r.participant_resource_name IN ('PT_400021 GU_400030') ORDER BY r.participant_resource_name, r.trading_period; 
/*TAB2: EA_System_Marginal_Price_raw */
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        661 AS bi_dim_market_id,
        r.SMP AS clearing_price,
        (SELECT ROUND(AVG(SMP),2)
        FROM EA_System_Marginal_Price_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(SMP),2)
        FROM EA_System_Marginal_Price_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
        (SELECT ROUND(AVG(SMP),2)
        FROM EA_System_Marginal_Price_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(SMP),2)
        FROM EA_System_Marginal_Price_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EA_System_Marginal_Price_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 661))
  ORDER BY  r.trading_period ; 
  
  
  /*TAB3: EP2_Actual_Availabilities_raw (1st)*/
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        775 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.MAX_AVAIL_MW AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EP2_Actual_Availabilities_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period  AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 775))
AND r.participant_resource_name IN ('PT_400021 GU_400020') ORDER BY r.participant_resource_name, r.trading_period;
/*TAB3: EP2_Actual_Availabilities_raw (2nd)*/
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        776 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.MAX_AVAIL_MW AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EP2_Actual_Availabilities_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period  AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 776))
AND r.participant_resource_name IN ('PT_400021 GU_400021') ORDER BY r.participant_resource_name, r.trading_period; 
/*TAB3: EP2_Actual_Availabilities_raw (3rd)*/
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        777 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.MAX_AVAIL_MW AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EP2_Actual_Availabilities_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period  AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 777))
AND r.participant_resource_name IN ('PT_400021 GU_400030') ORDER BY r.participant_resource_name, r.trading_period ; 
/*TAB4: EP2_Daily_Actual_Load_raw (1st)*/
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        7780 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.ACT_LOAD_MW AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EP2_Daily_Actual_Load_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period  AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 7780))
AND r.JURISDICTION IN ('NI') ORDER BY r.JURISDICTION, r.trading_period; 
/*TAB4: EP2_Daily_Actual_Load_raw (2nd)*/ 
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        7781 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.ACT_LOAD_MW AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EP2_Daily_Actual_Load_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period  AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 7781))
AND r.JURISDICTION IN ('ROI') ORDER BY r.JURISDICTION, r.trading_period; 
/*TAB5: EP2_Dispatch_Quantities_raw (1st)*/
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        7700 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.DISPATCH_MW AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EP2_Dispatch_Quantities_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period  AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 7700))
AND r.participant_resource_name IN ('PT_400021 GU_400020') ORDER BY r.participant_resource_name, r.trading_period; 
/*TAB5: EP2_Dispatch_Quantities_raw (2nd)*/
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        7701 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.DISPATCH_MW AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EP2_Dispatch_Quantities_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period  AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 7701))
AND r.participant_resource_name IN ('PT_400021 GU_400021') ORDER BY r.participant_resource_name, r.trading_period; 
/*TAB5: EP2_Dispatch_Quantities_raw (3rd)*/
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        7702 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.DISPATCH_MW AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EP2_Dispatch_Quantities_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period  AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 7702))
AND r.participant_resource_name IN ('PT_400021 GU_400030') ORDER BY r.participant_resource_name, r.trading_period; 
/*TAB6: EP2_Market_Schedule_Quantities_raw (1st)*/
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        7703 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.quantity AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EP2_Market_Schedule_Quantities_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period  AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 7703))
AND r.participant_resource_name IN ('PT_400021 GU_400020') ORDER BY r.participant_resource_name, r.trading_period; 
/*TAB6: EP2_Market_Schedule_Quantities_raw (2nd)*/
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        7704 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.quantity AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EP2_Market_Schedule_Quantities_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period  AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 7704))
AND r.participant_resource_name IN ('PT_400021 GU_400021') ORDER BY r.participant_resource_name, r.trading_period; 
/*TAB6: EP2_Market_Schedule_Quantities_raw (3rd)*/
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        7705 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.quantity AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EP2_Market_Schedule_Quantities_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period  AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 7705))
AND r.participant_resource_name IN ('PT_400021 GU_400030') ORDER BY r.participant_resource_name, r.trading_period; 
/*TAB7: EP2_System_Marginal_Price_raw */
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        779 AS bi_dim_market_id,
        r.SMP AS clearing_price,
         (SELECT ROUND(AVG(SMP),2)
        FROM EP2_System_Marginal_Price_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(SMP),2)
        FROM EP2_System_Marginal_Price_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
        (SELECT ROUND(AVG(SMP),2)
        FROM EP2_System_Marginal_Price_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(SMP),2)
        FROM EP2_System_Marginal_Price_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
         FROM EP2_System_Marginal_Price_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 779))
  ORDER BY  r.trading_period ; 
  
  /*TAB8: EA_raw: SYSTEM_LOAD */
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        885 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.system_load AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EA_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 885))
        ORDER BY  r.trading_period ; 
  
/*TAB8: EA_raw: NON_WIND_GEN */
/* REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        886 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.non_wind_gen AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EA_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 886))
        ORDER BY  r.trading_period ; */
  
    /*TAB8: EA_raw: WIND_GEN */
/* REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        887 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.wind_gen AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EA_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 887))
        ORDER BY  r.trading_period ; */
  
  /*TAB8: EA_raw: TOTAL_GEN_COST */
/* REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        888 AS bi_dim_market_id,
        r.TOTAL_GEN_COST AS clearing_price,
         (SELECT ROUND(AVG(TOTAL_GEN_COST),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(TOTAL_GEN_COST),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))   AS ninety_day_avg,
        (SELECT ROUND(AVG(TOTAL_GEN_COST),2)
        FROM EA_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(TOTAL_GEN_COST),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EA_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 888))
  ORDER BY  r.trading_period ; */
  
  /*TAB8: EA_raw: energy(smp) */
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        881 AS bi_dim_market_id,
        r.smp AS clearing_price,
        (SELECT ROUND(AVG(SMP),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(SMP),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
        (SELECT ROUND(AVG(SMP),2)
        FROM EA_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(SMP),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EA_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 881))
  ORDER BY  r.trading_period ; 
        
        
        /*TAB8: EA_raw: LAMBDA */
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        889 AS bi_dim_market_id,
        r.lambda AS clearing_price,
        (SELECT ROUND(AVG(lambda),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lambda),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lambda),2)
        FROM EA_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(lambda),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EA_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 889))
  ORDER BY  r.trading_period ; 
        
        /*TAB8: EA_raw: INTER_LAMBDA */
/* REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        890 AS bi_dim_market_id,
        r.INTER_LAMBDA AS clearing_price,
        (SELECT ROUND(AVG(INTER_LAMBDA),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(INTER_LAMBDA),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
        (SELECT ROUND(AVG(INTER_LAMBDA),2)
        FROM EA_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(INTER_LAMBDA),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EA_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 890))
  ORDER BY  r.trading_period ; */
        
        /*TAB8: EA_raw: INTERCONNECTOR */
/* REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        891 AS bi_dim_market_id,
        r.INTERCONNECTOR AS clearing_price,
        (SELECT ROUND(AVG(INTERCONNECTOR),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(INTERCONNECTOR),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
        (SELECT ROUND(AVG(INTERCONNECTOR),2)
        FROM EA_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(INTERCONNECTOR),2)
        FROM EA_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EA_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 891))
  ORDER BY  r.trading_period ; */
  
 /*TAB9: EP1_raw: SYSTEM_LOAD */
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        222 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.system_load AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP1_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 222))
        ORDER BY  r.trading_period ; 
  
/*TAB9: EP1_raw: NON_WIND_GEN */
/* EPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        223 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.non_wind_gen AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP1_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 223))
        ORDER BY  r.trading_period ; */
  
    /*TAB9: EP1_raw: WIND_GEN */
/* REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        224 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.wind_gen AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP1_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 224))
        ORDER BY  r.trading_period ; */
  
  /*TAB9: EP1_raw: TOTAL_GEN_COST */
/* REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        225 AS bi_dim_market_id,
        r.TOTAL_GEN_COST AS clearing_price,
        (SELECT ROUND(AVG(TOTAL_GEN_COST),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(TOTAL_GEN_COST),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
        (SELECT ROUND(AVG(TOTAL_GEN_COST),2)
        FROM EP1_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(TOTAL_GEN_COST),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP1_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 225))
  ORDER BY  r.trading_period ; */
  
  
  /*TAB9: EP1_raw: energy(smp) */
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        221 AS bi_dim_market_id,
        r.smp AS clearing_price,
        (SELECT ROUND(AVG(SMP),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(SMP),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
        (SELECT ROUND(AVG(SMP),2)
        FROM EP1_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(SMP),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP1_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 221))
  ORDER BY  r.trading_period ; 
  
        
        /*TAB9: EP1_raw: LAMBDA */
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        226 AS bi_dim_market_id,
        r.lambda AS clearing_price,
        (SELECT ROUND(AVG(lambda),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lambda),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lambda),2)
        FROM EP1_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
         (SELECT ROUND(AVG(lambda),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP1_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 226))
  ORDER BY  r.trading_period ; 
        
        /*TAB9: EP1_raw: INTER_LAMBDA */
/* REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        227 AS bi_dim_market_id,
        r.INTER_LAMBDA AS clearing_price,
        (SELECT ROUND(AVG(INTER_LAMBDA),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(INTER_LAMBDA),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
        (SELECT ROUND(AVG(INTER_LAMBDA),2)
        FROM EP1_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(INTER_LAMBDA),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP1_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 227))
  ORDER BY  r.trading_period ; */
        
        /*TAB9: EP1_raw: INTERCONNECTOR */
/* REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        228 AS bi_dim_market_id,
        r.INTERCONNECTOR AS clearing_price,
        (SELECT ROUND(AVG(INTERCONNECTOR),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(INTERCONNECTOR),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
         (SELECT ROUND(AVG(INTERCONNECTOR),2)
        FROM EP1_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(INTERCONNECTOR),2)
        FROM EP1_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP1_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 228))
  ORDER BY  r.trading_period ; */
        
        /*TAB10: EP2_raw: SYSTEM_LOAD */
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        332 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.system_load AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP2_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 332))
        ORDER BY  r.trading_period ; 
  
/*TAB10: EP2_raw: NON_WIND_GEN */
/* REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        333 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.non_wind_gen AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP2_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 333))
        ORDER BY  r.trading_period ; */
  
    /*TAB10: EP2_raw: WIND_GEN */
/* REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        334 AS bi_dim_market_id,
        NULL AS clearing_price,
        NULL AS thirty_day_avg,
        NULL  AS ninety_day_avg,
        NULL AS previous_year_clearing_price,
        r.wind_gen AS volume,
        NULL AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP2_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 334))
        ORDER BY  r.trading_period ; */
  
  /*TAB10: EP2_raw: TOTAL_GEN_COST */
/* REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        335 AS bi_dim_market_id,
        r.TOTAL_GEN_COST AS clearing_price,
        (SELECT ROUND(AVG(TOTAL_GEN_COST),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(TOTAL_GEN_COST),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
        (SELECT ROUND(AVG(TOTAL_GEN_COST),2)
        FROM EP2_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(TOTAL_GEN_COST),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP2_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 335))
  ORDER BY  r.trading_period ; */
  
  /*TAB10: EP2_raw: energy(smp) */
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        331 AS bi_dim_market_id,
        r.smp AS clearing_price,
        (SELECT ROUND(AVG(SMP),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(SMP),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
        (SELECT ROUND(AVG(SMP),2)
        FROM EP2_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(SMP),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP2_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 331))
  ORDER BY  r.trading_period ; 
        
        /*TAB10: EP2_raw: LAMBDA */
 REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        336 AS bi_dim_market_id,
        r.lambda AS clearing_price,
        (SELECT ROUND(AVG(lambda),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lambda),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lambda),2)
        FROM EP2_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(lambda),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP2_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 336))
  ORDER BY  r.trading_period ; 
        
        /*TAB10: EP2_raw: INTER_LAMBDA */
/* REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        337 AS bi_dim_market_id,
        r.INTER_LAMBDA AS clearing_price,
        (SELECT ROUND(AVG(INTER_LAMBDA),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(INTER_LAMBDA),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))   AS ninety_day_avg,
        (SELECT ROUND(AVG(INTER_LAMBDA),2)
        FROM EP2_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
         (SELECT ROUND(AVG(INTER_LAMBDA),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP2_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 337))
  ORDER BY  r.trading_period ; */
        
        /*TAB10: EP2_raw: INTERCONNECTOR */
/* REPLACE INTO bi_fact_markets_part
SELECT d.id AS bi_dim_date_id,
        338 AS bi_dim_market_id,
        r.INTERCONNECTOR AS clearing_price,
         (SELECT ROUND(AVG(INTERCONNECTOR),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 29 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS thirty_day_avg,
        (SELECT ROUND(AVG(INTERCONNECTOR),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 89 DAY) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt))  AS ninety_day_avg,
        (SELECT ROUND(AVG(INTERCONNECTOR),2)
        FROM EP2_raw WHERE trading_period = DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) 
        AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(INTERCONNECTOR),2)
        FROM EP2_raw WHERE trading_period BETWEEN DATE_SUB(d.timestamp_gmt,INTERVAL 1 YEAR) AND
        d.timestamp_gmt AND HOUR(trading_period)=HOUR(d.timestamp_gmt)) AS one_year_avg,
        NULL AS "capacity",
        d.id+16 AS bi_dim_date_id_local
        FROM EP2_raw AS r, bi_dim_date AS d WHERE d.timestamp_gmt = r.trading_period AND DATE(d.timestamp_gmt)<=CURDATE() AND timestamp_gmt >  (SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX(bi_dim_date_id) FROM bi_fact_markets_part WHERE bi_dim_market_id = 338))
  ORDER BY  r.trading_period ; */
  
  
END$$

DELIMITER ;