DELIMITER $$

USE `aeses`$$

DROP PROCEDURE IF EXISTS `update_nyiso_ham_energy`$$

CREATE DEFINER=`sigma.siva`@`%` PROCEDURE `update_nyiso_ham_energy`()
BEGIN
/*NYISO ENERGY HAM  lbmp*/
/*
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1054' AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='GENESE' AND TIME_STAMP BETWEEN '2011-12-23 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-12-23 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1055' AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='H Q' AND TIME_STAMP BETWEEN '2011-12-23 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-12-23 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1056' AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='HUD VL' AND TIME_STAMP BETWEEN '2011-12-23 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-12-23 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1057' AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='LONGIL' AND TIME_STAMP BETWEEN '2011-12-23 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-12-23 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1058' AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='MHK VL' AND TIME_STAMP BETWEEN '2011-12-23 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-12-23 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1059' AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='MILLWD' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1060' AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='N.Y.C.' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1061' AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='NORTH' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1062' AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='NPX' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1063' AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='O H' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1064' AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='PJM' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1065' AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='WEST' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1066' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='CAPITL' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
/*
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1067' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='CENTRL' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1068' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='DUNWOD' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1069' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='GENESE' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1070' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='H Q' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1071' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='HUD VL' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1072' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='LONGIL' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-28 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1073' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='MHK VL' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-28 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1074' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='MILLWD' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-28 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1075' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='N.Y.C.' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-28 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1076' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='NORTH' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-28 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1077' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='NPX' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-28 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1078' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='O H' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-28 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1079' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='PJM' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-28 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1080' AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='WEST' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-26 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-28 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1081' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='CAPITL' AND TIME_STAMP BETWEEN '2011-12-26 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-12-26 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1082' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='CENTRL' AND TIME_STAMP BETWEEN '2011-12-26 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-12-26 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1083' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='DUNWOD' AND TIME_STAMP BETWEEN '2011-12-26 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-12-26 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1084' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='GENESE' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1085' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='H Q' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1086' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='HUD VL' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1087' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='LONGIL' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1088' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='MHK VL' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1089' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='MILLWD' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1090' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='N.Y.C.' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1091' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='NORTH' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1092' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='NPX' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1093' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='O H' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;*/
REPLACE INTO bi_fact_markets_part
SELECT b.id AS bi_dim_date_id,
    c.id AS bi_dim_market_id,
    a.settlementpointprice AS clearing_price,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_realtime_energy_prices
    WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 29 DAY) AND
    a.date_time AND HOUR(a.date_time)=HOUR(date_time)) AS thirty_day_avg,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_realtime_energy_prices
    WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 89 DAY) AND
    a.date_time AND HOUR(a.date_time)=HOUR(date_time)) AS ninety_day_avg,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_realtime_energy_prices
    WHERE date_time=DATE_SUB(a.date_time,INTERVAL 1 YEAR)) AS previous_year_clearing_price,
    0 AS volume,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_realtime_energy_prices
    WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 1 YEAR) AND
    a.date_time AND HOUR(a.date_time)=HOUR(date_time)) AS one_year_avg,
    NULL AS capacity
FROM
(SELECT date_time,settlementpointprice  FROM ercot_realtime_energy_prices WHERE date_time>=(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2009))) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP>=(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2009))) b
ON a.date_time=b.timestamp
JOIN
(SELECT * FROM bi_dim_market WHERE iso='ERCOT' AND market='Real-Time Energy' AND service='Energy' AND zone='All') c;
REPLACE INTO bi_fact_markets_part
SELECT b.id AS bi_dim_date_id,
    c.id AS bi_dim_market_id,
    a.settlementpointprice AS clearing_price,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_dayahead_energy_prices
    WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 29 DAY) AND
    a.date_time AND HOUR(a.date_time)=HOUR(date_time)) AS thirty_day_avg,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_dayahead_energy_prices
    WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 89 DAY) AND
    a.date_time AND HOUR(a.date_time)=HOUR(date_time)) AS ninety_day_avg,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_dayahead_energy_prices
    WHERE date_time=DATE_SUB(a.date_time,INTERVAL 1 YEAR)) AS previous_year_clearing_price,
    0 AS volume,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_dayahead_energy_prices
    WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 1 YEAR) AND
    a.date_time AND HOUR(a.date_time)=HOUR(date_time)) AS one_year_avg,
    NULL AS capacity
FROM
(SELECT date_time,settlementpointprice  FROM ercot_dayahead_energy_prices WHERE date_time>=(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2008))) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP>=(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2008))) b
ON a.date_time=b.timestamp
JOIN
(SELECT * FROM bi_dim_market WHERE iso='ERCOT' AND market='Day-Ahead Energy' AND service='Energy') c;
/*
REPLACE INTO bi_fact_markets_part
SELECT b.id AS bi_dim_date_id,
    c.id AS bi_dim_market_id,
    a.settlementpointprice AS clearing_price,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_realtime_energy_prices
    WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 29 DAY) AND
    a.date_time AND HOUR(a.date_time)=HOUR(date_time)) AS thirty_day_avg,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_realtime_energy_prices
    WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 89 DAY) AND
    a.date_time AND HOUR(a.date_time)=HOUR(date_time)) AS ninety_day_avg,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_realtime_energy_prices
    WHERE date_time=DATE_SUB(a.date_time,INTERVAL 1 YEAR)) AS previous_year_clearing_price,
    0 AS volume,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_realtime_energy_prices
    WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 1 YEAR) AND
    a.date_time AND HOUR(a.date_time)=HOUR(date_time)) AS one_year_avg,
    NULL AS capacity
FROM
(SELECT date_time,settlementpointprice  FROM ercot_realtime_energy_prices WHERE SettlementPointName="HB_HOUSTON" AND  date_time>=(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2010))) a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP>=(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id=2010))) b
ON a.date_time=b.timestamp
JOIN
(SELECT * FROM bi_dim_market WHERE iso='ERCOT' AND market='Real-Time Energy' AND service='Energy' AND zone='HB_HOUSTON') c;
*/
/* ISO-NE RT-DAM energy */
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        7005 AS bi_dim_market_id,
        a.energy_component AS clearing_price,
        (SELECT ROUND(AVG(energy_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 29 DAY) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS thirty_day_avg,
	(SELECT ROUND(AVG(energy_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 89 DAY) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS ninety_day_avg,
        (SELECT ROUND(AVG(energy_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time = DATE_SUB(a.date_time,INTERVAL 1 YEAR)
	AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS previous_year_clearing_price,
	0 AS volume,
        (SELECT ROUND(AVG(energy_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 1 YEAR) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS one_year_avg,
        NULL AS capacity
FROM (SELECT energy_component ,date_time FROM iso_ne_dam_rt_raw  WHERE date_time >= '2009-01-01 00:00:00'
) a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >= '2009-01-01 00:00:00'
) b ON b.timestamp =a.date_time ;
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        7006 AS bi_dim_market_id,
        a.marginal_loss_component AS clearing_price,
        (SELECT ROUND(AVG(marginal_loss_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 29 DAY) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS thirty_day_avg,
	(SELECT ROUND(AVG(marginal_loss_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 89 DAY) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_loss_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time = DATE_SUB(a.date_time,INTERVAL 1 YEAR)
	AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS previous_year_clearing_price,
	0 AS volume,
        (SELECT ROUND(AVG(marginal_loss_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 1 YEAR) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS one_year_avg,
        NULL AS capacity
FROM (SELECT marginal_loss_component ,date_time FROM iso_ne_dam_rt_raw  WHERE date_time >= '2009-01-01 00:00:00'
) a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >= '2009-01-01 00:00:00'
) b ON b.timestamp =a.date_time ;
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        7007 AS bi_dim_market_id,
        a.congestion_component AS clearing_price,
        (SELECT ROUND(AVG(congestion_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 29 DAY) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS thirty_day_avg,
	(SELECT ROUND(AVG(congestion_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 89 DAY) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS ninety_day_avg,
        (SELECT ROUND(AVG(congestion_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time = DATE_SUB(a.date_time,INTERVAL 1 YEAR)
	AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS previous_year_clearing_price,
	0 AS volume,
        (SELECT ROUND(AVG(congestion_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 1 YEAR) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS one_year_avg,
        NULL AS capacity
FROM (SELECT congestion_component ,date_time FROM iso_ne_dam_rt_raw  WHERE date_time >= '2009-01-01 00:00:00'
) a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >=
'2009-01-01 00:00:00') b ON b.timestamp =a.date_time;
/*RT */
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        7008 AS bi_dim_market_id,
        a.rt_congestion_component AS clearing_price,
        (SELECT ROUND(AVG(rt_congestion_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 29 DAY) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS thirty_day_avg,
	(SELECT ROUND(AVG(rt_congestion_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 89 DAY) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS ninety_day_avg,
        (SELECT ROUND(AVG(rt_congestion_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time = DATE_SUB(a.date_time,INTERVAL 1 YEAR)
	AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS previous_year_clearing_price,
	0 AS volume,
        (SELECT ROUND(AVG(rt_congestion_component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 1 YEAR) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS one_year_avg,
        NULL AS capacity
FROM (SELECT rt_congestion_component ,date_time FROM iso_ne_dam_rt_raw  WHERE date_time >=
'2009-01-01 00:00:00') a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >=
'2009-01-01 00:00:00') b ON b.timestamp =a.date_time;
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        7009 AS bi_dim_market_id,
        a.RT_Marginal_Loss_Component AS clearing_price,
        (SELECT ROUND(AVG(RT_Marginal_Loss_Component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 29 DAY) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS thirty_day_avg,
	(SELECT ROUND(AVG(RT_Marginal_Loss_Component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 89 DAY) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS ninety_day_avg,
        (SELECT ROUND(AVG(RT_Marginal_Loss_Component),2) FROM iso_ne_dam_rt_raw  WHERE date_time = DATE_SUB(a.date_time,INTERVAL 1 YEAR)
	AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS previous_year_clearing_price,
	0 AS volume,
        (SELECT ROUND(AVG(RT_Marginal_Loss_Component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 1 YEAR) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS one_year_avg,
        NULL AS capacity
FROM (SELECT RT_Marginal_Loss_Component ,date_time FROM iso_ne_dam_rt_raw  WHERE date_time >=
'2009-01-01 00:00:00') a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >=
'2009-01-01 00:00:00') b ON b.timestamp =a.date_time;
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        7010 AS bi_dim_market_id,
        a.RT_Energy_Component AS clearing_price,
        (SELECT ROUND(AVG(RT_Energy_Component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 29 DAY) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS thirty_day_avg,
	(SELECT ROUND(AVG(RT_Energy_Component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 89 DAY) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS ninety_day_avg,
        (SELECT ROUND(AVG(RT_Energy_Component),2) FROM iso_ne_dam_rt_raw  WHERE date_time = DATE_SUB(a.date_time,INTERVAL 1 YEAR)
	AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS previous_year_clearing_price,
	0 AS volume,
        (SELECT ROUND(AVG(RT_Energy_Component),2) FROM iso_ne_dam_rt_raw  WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 1 YEAR) AND
	a.date_time AND HOUR(a.date_time)=HOUR(TIMESTAMP)) AS one_year_avg,
        NULL AS capacity
FROM (SELECT RT_Energy_Component ,date_time FROM iso_ne_dam_rt_raw  WHERE date_time >=
'2009-01-01 00:00:00') a
JOIN
(SELECT id,TIMESTAMP FROM bi_dim_date WHERE TIMESTAMP >=
'2009-01-01 00:00:00') b ON b.timestamp =a.date_time;
REPLACE INTO bi_fact_markets_part
SELECT  b.id AS bi_dim_date_id,
        3050 AS bi_dim_market_id,
        a.clearing_price AS clearing_price,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dayahead_energy WHERE date_time BETWEEN DATE_SUB(a.DATETIME,INTERVAL 29 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(DATE_TIME) ) AS thirty_day_avg,
	(SELECT ROUND(AVG(clearing_price),2) FROM caiso_dayahead_energy WHERE date_time BETWEEN DATE_SUB(a.DATETIME,INTERVAL 89 DAY) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(DATE_TIME) ) AS ninety_day_avg,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dayahead_energy WHERE date_time = DATE_SUB(a.DATETIME,INTERVAL 1 YEAR)
	AND HOUR(a.DATETIME)=HOUR(DATE_TIME) ) AS previous_year_clearing_price,
        NULL AS volume,
        (SELECT ROUND(AVG(clearing_price),2) FROM caiso_dayahead_energy WHERE date_time BETWEEN DATE_SUB(a.DATETIME,INTERVAL 1 YEAR) AND
	a.DATETIME AND HOUR(a.DATETIME)=HOUR(DATE_TIME) ) AS one_year_avg,
	 NULL AS "capacity"
   
FROM (SELECT CONVERT_TZ(date_time,'US/Central','GMT') AS DATETIME ,clearing_price FROM caiso_dayahead_energy WHERE DATE_TIME >= '2010-01-01 00:00:00') a
JOIN
(SELECT id,timestamp_gmt FROM bi_dim_date WHERE timestamp_gmt >= '2010-01-01 00:00:00') b ON b.timestamp_gmt =a.datetime ;
/*
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1094' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='PJM' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	'1095' AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL as capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw_2010_11 WHERE NAME='WEST' AND TIME_STAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-06 00:00:00' AND '2011-12-29 23:59:59') c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT b.id AS bi_dim_date_id,
    c.id AS bi_dim_market_id,
    a.settlementpointprice AS clearing_price,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_realtime_energy_prices
    WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 29 DAY) AND
    a.date_time AND HOUR(a.date_time)=HOUR(date_time)) AS thirty_day_avg,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_realtime_energy_prices
    WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 89 DAY) AND
    a.date_time AND HOUR(a.date_time)=HOUR(date_time)) AS ninety_day_avg,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_realtime_energy_prices
    WHERE date_time=DATE_SUB(a.date_time,INTERVAL 1 YEAR)) AS previous_year_clearing_price,
    0 AS volume,
    (SELECT ROUND(AVG(settlementpointprice),2)
    FROM  ercot_realtime_energy_prices
    WHERE date_time BETWEEN DATE_SUB(a.date_time,INTERVAL 1 YEAR) AND
    a.date_time AND HOUR(a.date_time)=HOUR(date_time)) AS one_year_avg,
    NULL AS capacity
FROM
(SELECT date_time,settlementpointprice  FROM ercot_realtime_energy_prices WHERE SettlementPointName="HB_HOUSTON" AND  date_time between '2011-12-21 00:00:00' AND '2011-12-25 23:59:59') a
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP between '2011-12-21 00:00:00' and '2011-12-25 23:59:59') b
ON a.date_time=b.timestamp
JOIN
(SELECT * FROM bi_dim_market WHERE iso='ERCOT' AND market='Real-Time Energy' AND service='Energy' AND zone='HB_HOUSTON') c;
*/
/*NYISO ENERGY HAM  lbmp*/
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1051))) AND NAME='CAPITL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='CAPITL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1051)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1052))) AND NAME='CENTRL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='CENTRL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1052)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1053))) AND NAME='DUNWOD') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='DUNWOD') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1053)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1054))) AND NAME='GENESE') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='GENESE') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1054)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1055))) AND NAME='H Q') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='H Q') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1055)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1056))) AND NAME='HUD VL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='HUD VL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1056)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1057))) AND NAME='LONGIL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='LONGIL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1057)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1058))) AND NAME='MHK VL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='MHK VL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1058)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1059))) AND NAME='MILLWD') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='MILLWD') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1059)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1060))) AND NAME='N.Y.C.') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='N.Y.C.') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1060)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1061))) AND NAME='NORTH') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='NORTH') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1061)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1062))) AND NAME='NPX') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='NPX') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1062)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1063))) AND NAME='O H') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='O H') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1063)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1064))) AND NAME='PJM') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='PJM') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1064)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1065))) AND NAME='WEST') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Energy' AND Zone='WEST') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1065)))) c
ON c.timestamp=a.time_stamp;
/*NYISO ENERGY HAM  marginal_cost_congestion*/
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080)))) a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion') b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080)))) c
ON c.timestamp=a.time_stamp;
/*NYISO ENERGY HAM marginal_cost_losses*/
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_ham_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_ham_raw WHERE TIME_STAMP>=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093,1094,1095)))) a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses') b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093,1094,1095)))) c
ON c.timestamp=a.time_stamp;
END$$

DELIMITER ;