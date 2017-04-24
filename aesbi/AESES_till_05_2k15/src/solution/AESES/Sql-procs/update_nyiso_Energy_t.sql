DELIMITER $$

USE `aeses`$$

DROP PROCEDURE IF EXISTS `update_nyiso_Energy_t`$$

CREATE DEFINER=`puneet.b`@`%` PROCEDURE `update_nyiso_Energy_t`()
BEGIN

/* REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1006) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1007) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1008) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1009) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1010) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1011) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1012) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1013) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1014) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1015) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1016) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1017) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1018) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1019) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.lbmp AS clearing_price,
    (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(lbmp),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1020) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1021) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1022) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1023) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1024) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1025) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1026) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1027) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1028) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1029) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1030) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1031) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1032) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1033) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1034) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_congestion AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
        (SELECT ROUND(AVG(marginal_cost_congestion),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1035) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE
(TIME_STAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1036) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE (TIMESTAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) c
ON c.timestamp=a.time_stamp; */

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE
(TIME_STAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1037) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE (TIMESTAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE
(TIME_STAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1038) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE (TIMESTAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE
(TIME_STAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1039) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE (TIMESTAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE
(TIME_STAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1040) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE (TIMESTAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE
(TIME_STAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1041) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE (TIMESTAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1042) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE
(TIME_STAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1043) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE (TIMESTAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE
(TIME_STAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1044) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE (TIMESTAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1045) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00') c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE
(TIME_STAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1046) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE (TIMESTAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE
(TIME_STAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1047) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE (TIMESTAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE
(TIME_STAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1048) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE (TIMESTAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE
(TIME_STAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1049) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE (TIMESTAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
    b.id AS bi_dim_market_id,
    a.marginal_cost_losses AS clearing_price,
    (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
        (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw  WHERE time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND NAME=a.name ) AS previous_year_clearing_price,
        0 AS volume,
         (SELECT ROUND(AVG(marginal_cost_losses),2)
        FROM nyiso_lbmp_dam_raw WHERE time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
        a.time_stamp AND NAME=a.name AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
        NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_dam_raw WHERE
(TIME_STAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) a
JOIN
(SELECT id,service_orig,zone FROM bi_dim_market WHERE id = 1050) b
ON a.name=b.zone
JOIN
(SELECT * FROM bi_dim_date WHERE (TIMESTAMP BETWEEN '2010-09-16 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-11-30 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1051 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_capitl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_capitl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_capitl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_capitl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_capitl_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='CAPITL' AND c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1052 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_centrl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_centrl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_centrl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_centrl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_centrl_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='CENTRL' AND c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1053 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_dunwod_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_dunwod_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_dunwod_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_dunwod_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_dunwod_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='DUNWOD' AND c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	 1054 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_genese_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_genese_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_genese_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_genese_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_genese_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='GENESE' AND c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1055 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_hq_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_hq_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_hq_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_hq_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_hq_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='H Q' AND c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1056 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_hud_vl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_hud_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_hud_vl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_hud_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_hud_vl_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='HUD VL' AND c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1057 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_longil_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_longil_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_longil_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_longil_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_longil_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-11-02 00:00:00' AND '2011-11-08 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='LONGIL' AND c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1058 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_mhk_vl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_mhk_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_mhk_vl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_mhk_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_mhk_vl_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='MHK VL' AND c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1059 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_millwd_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_millwd_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_millwd_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_millwd_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_millwd_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='MILLWD' AND c.timestamp=a.time_stamp;







REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1060 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_nyc_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_nyc_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_nyc_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_nyc_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_nyc_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='N.Y.C.' AND c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1061 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_north_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_north_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_north_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_north_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_north_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='NORTH' AND c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1062 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_npx_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_npx_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_npx_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_npx_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_npx_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='NPX' AND c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1063 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_oh_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_oh_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_oh_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_oh_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_oh_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='O H' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1064 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_pjm_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_pjm_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_pjm_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_pjm_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_pjm_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='PJM' AND c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1065 AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_west_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_west_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_west_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_west_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_west_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='WEST' AND c.timestamp=a.time_stamp;



REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1066 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_capitl_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_capitl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_capitl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_capitl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_capitl_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='CAPITL' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1067 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_centrl_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_centrl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_centrl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_centrl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_centrl_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='CENTRL' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1068 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_dunwod_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_dunwod_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_dunwod_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_dunwod_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_dunwod_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='DUNWOD' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1069 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_genese_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_genese_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_genese_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_genese_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_genese_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='GENESE' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1070 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hq_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hq_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hq_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hq_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_hq_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='H Q' AND c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1071 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hud_vl_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hud_vl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hud_vl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hud_vl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_hud_vl_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='HUD VL' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1072 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_longil_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_longil_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_longil_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_longil_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_longil_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='LONGIL' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1073 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_mhk_vl_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_mhk_vl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_mhk_vl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_mhk_vl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_mhk_vl_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='MHK VL' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1074 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_millwd_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_millwd_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_millwd_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_millwd_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_millwd_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='MILLWD' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1075 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_nyc_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_nyc_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_nyc_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_nyc_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_nyc_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='N.Y.C.' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1076 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_north_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_north_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_north_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_north_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_north_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='NORTH' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1077 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_npx_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_npx_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_npx_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_npx_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_npx_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='NPX' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1078 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_oh_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_oh_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_oh_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_oh_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_oh_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='O H' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1079 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_pjm_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_pjm_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_pjm_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_pjm_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_pjm_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='PJM' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1080 AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_west_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_west_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_west_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_west_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_west_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00'))
AND a.NAME='WEST' AND c.timestamp=a.time_stamp;




REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1081 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_capitl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_capitl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_capitl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_capitl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_capitl_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00'))
AND a.NAME='CAPITL' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1082 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_centrl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_centrl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_centrl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_centrl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_centrl_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00'))
AND a.NAME='CENTRL' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1083 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_dunwod_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_dunwod_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_dunwod_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_dunwod_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_dunwod_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00'))
AND a.NAME='DUNWOD' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1084 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_genese_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_genese_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_genese_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_genese_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_genese_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00'))
AND a.NAME='GENESE' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1085 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hq_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hq_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hq_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hq_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_hq_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00'))
AND a.NAME='H Q' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1086 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hud_vl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hud_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hud_vl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hud_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_hud_vl_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00')
OR
(TIME_STAMP BETWEEN '2012-03-30 00:00:00' AND '2012-05-08 23:45:00'))
AND a.NAME='HUD VL' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1087 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_longil_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_longil_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_longil_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_longil_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_longil_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00'))
AND a.NAME='LONGIL' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1088 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_mhk_vl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_mhk_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_mhk_vl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_mhk_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_mhk_vl_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00'))
AND a.NAME='MHK VL' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1089 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_millwd_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_millwd_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_millwd_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_millwd_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_millwd_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00'))
AND a.NAME='MILLWD' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1090 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_nyc_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_nyc_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_nyc_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_nyc_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_nyc_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00'))
AND a.NAME='N.Y.C.' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1091 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_north_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_north_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_north_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_north_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_north_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00'))
AND a.NAME='NORTH' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1092 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_npx_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_npx_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_npx_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_npx_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_npx_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00'))
AND a.NAME='NPX' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1093 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_oh_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_oh_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_oh_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_oh_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_oh_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00'))
AND a.NAME='O H' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1094 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_pjm_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_pjm_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_pjm_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_pjm_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_pjm_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00'))
AND a.NAME='PJM' AND c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	1095 AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_west_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_west_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_west_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_west_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM nyiso_ham_west_raw a, bi_dim_date c WHERE
((TIME_STAMP BETWEEN '2010-09-14 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-05-29 00:00:00' AND '2012-05-29 23:45:00')
OR
(TIME_STAMP BETWEEN '2011-07-11 00:00:00' AND '2012-07-27 23:45:00'))
AND a.NAME='WEST' AND c.timestamp=a.time_stamp;







REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1096) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1097) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1098) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1099) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1100) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1101) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1102) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1103) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1104) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1105) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1106) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1107) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1108) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1109) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1110) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;





REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1111) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1112) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1113) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1114) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1115) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1116) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1117) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1118) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1119) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1120) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1121) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1122) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1123) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1124) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 3 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1125) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;





REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1126) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1127) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1128) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1129) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1130) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1131) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1132) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1133) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1134) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1135) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1136) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1137) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1138) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1139) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE  NAME =a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 29 DAY) AND
       a.time_stamp  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 89 DAY) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated  WHERE  NAME = a.name  AND  time_stamp=DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_lbmp_rt_raw_aggregated WHERE NAME = a.name  AND time_stamp BETWEEN DATE_SUB(a.time_stamp,INTERVAL 1 YEAR) AND
       a.time_stamp AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_lbmp_rt_raw_aggregated WHERE
(TIME_STAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIME_STAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) a
JOIN
(SELECT * FROM bi_dim_market WHERE id = 1140) b
ON b.zone=a.name
JOIN
(SELECT * FROM bi_dim_date WHERE
(TIMESTAMP BETWEEN '2010-09-15 00:00:00' AND '2011-12-31 23:45:00' )
OR
(TIMESTAMP BETWEEN '2011-11-26 00:00:00' AND '2012-12-01 23:45:00')) c
ON c.timestamp=a.time_stamp;





REPLACE INTO bi_fact_markets_part_raw
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
WHERE DATE(time_stamp) BETWEEN '2009-01-01' AND '2010-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
WHERE DATE(time_stamp) BETWEEN '2011-02-27' AND '2012-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
WHERE DATE(time_stamp) BETWEEN '2011-03-22' AND '2012-03-22'
AND b.timestamp = a.time_stamp;


REPLACE INTO bi_fact_markets_part_raw
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
WHERE DATE(time_stamp) BETWEEN '2011-04-06' AND '2012-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
WHERE DATE(time_stamp) BETWEEN '2011-04-16' AND '2012-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
WHERE DATE(time_stamp) BETWEEN '2012-04-11' AND '2013-04-11'
AND b.timestamp = a.time_stamp;







REPLACE INTO bi_fact_markets_part_raw
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
WHERE DATE(time_stamp) BETWEEN '2009-01-01' AND '2010-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
WHERE DATE(time_stamp) BETWEEN '2011-02-27' AND '2012-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
WHERE DATE(time_stamp) BETWEEN '2011-03-22' AND '2012-03-22'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
WHERE DATE(time_stamp) BETWEEN '2011-04-06' AND '2012-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
WHERE DATE(time_stamp) BETWEEN '2011-04-16' AND '2012-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
WHERE DATE(time_stamp) BETWEEN '2012-04-11' AND '2013-04-11'
AND b.timestamp = a.time_stamp;








REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2009-01-01' AND '2010-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-02-27' AND '2012-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-03-22' AND '2012-03-22'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-04-06' AND '2012-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-04-16' AND '2012-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2012-04-11' AND '2013-04-11'
AND b.timestamp = a.time_stamp;









REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2009-01-01' AND '2010-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-02-27' AND '2012-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-03-22' AND '2012-03-22'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-04-06' AND '2012-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-04-16' AND '2012-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2012-04-11' AND '2013-04-11'
AND b.timestamp = a.time_stamp;










REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2009-01-01' AND '2010-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-02-27' AND '2012-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-03-22' AND '2012-03-22'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-04-06' AND '2012-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-04-16' AND '2012-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2012-04-11' AND '2013-04-11'
AND b.timestamp = a.time_stamp;










REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2009-01-01' AND '2010-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-02-27' AND '2012-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-03-22' AND '2012-03-22'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-04-06' AND '2012-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-04-16' AND '2012-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2012-04-11' AND '2013-04-11'
AND b.timestamp = a.time_stamp;









REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2009-01-01' AND '2010-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-02-27' AND '2012-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-03-22' AND '2012-03-22'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-04-06' AND '2012-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-04-16' AND '2012-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2012-04-11' AND '2013-04-11'
AND b.timestamp = a.time_stamp;









REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2009-01-01' AND '2010-01-01'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-02-27' AND '2012-02-27'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-03-22' AND '2012-03-22'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2011-04-06' AND '2012-04-06'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
JOIN (SELECT * FROM bi_dim_market WHERE zone = 'West' AND service = 'Operating Reserve' AND id = 1156) c
WHERE
DATE(time_stamp) BETWEEN '2011-04-16' AND '2012-04-16'
AND b.timestamp = a.time_stamp;

REPLACE INTO bi_fact_markets_part_raw
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
DATE(time_stamp) BETWEEN '2012-04-11' AND '2013-04-11'
AND b.timestamp = a.time_stamp;


END$$

DELIMITER ;