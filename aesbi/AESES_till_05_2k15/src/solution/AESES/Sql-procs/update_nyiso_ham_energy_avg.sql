DELIMITER $$

USE `aeses`$$

DROP PROCEDURE IF EXISTS `update_nyiso_ham_energy_avg`$$

CREATE DEFINER=`puneet.b`@`%` PROCEDURE `update_nyiso_ham_energy_avg`()
BEGIN
                              /*NYISO ENERGY HAM  clearing_price_energy*/
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.lbmp AS clearing_price,
	(SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_capitl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_capitl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_capitl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_capitl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_capitl_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_centrl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_centrl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_centrl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_centrl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_centrl_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_dunwod_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_dunwod_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_dunwod_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_dunwod_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_dunwod_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_genese_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_genese_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_genese_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_genese_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_genese_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_hq_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_hq_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_hq_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_hq_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_hq_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_hud_vl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_hud_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_hud_vl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_hud_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_hud_vl_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_longil_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_longil_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_longil_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_longil_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_longil_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_mhk_vl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_mhk_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_mhk_vl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_mhk_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_mhk_vl_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_millwd_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_millwd_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_millwd_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_millwd_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_millwd_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_nyc_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_nyc_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_nyc_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_nyc_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_nyc_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_north_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_north_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_north_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_north_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_north_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_npx_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_npx_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_npx_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_npx_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_npx_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_oh_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_oh_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_oh_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_oh_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_oh_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_pjm_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_pjm_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_pjm_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_pjm_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_pjm_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_west_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_west_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_west_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(lbmp),2)
       FROM nyiso_ham_west_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,lbmp,NAME  FROM nyiso_ham_west_raw WHERE TIME_STAMP >=
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
       FROM nyiso_ham_capitl_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_capitl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_capitl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_capitl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_capitl_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1066))) AND NAME='CAPITL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='CAPITL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1066)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_centrl_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_centrl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_centrl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_centrl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_centrl_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1067))) AND NAME='CENTRL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='CENTRL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1067)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_dunwod_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_dunwod_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_dunwod_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_dunwod_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_dunwod_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1068))) AND NAME='DUNWOD') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='DUNWOD') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1068)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_genese_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_genese_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_genese_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_genese_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_genese_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1069))) AND NAME='GENESE') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='GENESE') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1069)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hq_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hq_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hq_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hq_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_hq_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1070))) AND NAME='H Q') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='H Q') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1070)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hud_vl_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hud_vl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hud_vl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_hud_vl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_hud_vl_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1071))) AND NAME='HUD VL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='HUD VL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1071)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_longil_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_longil_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_longil_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_longil_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_longil_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1072))) AND NAME='LONGIL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='LONGIL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1072)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_mhk_vl_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_mhk_vl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_mhk_vl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_mhk_vl_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_mhk_vl_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1073))) AND NAME='MHK VL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='MHK VL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1073)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_millwd_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_millwd_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_millwd_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_millwd_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_millwd_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1074))) AND NAME='MILLWD') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='MILLWD') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1074)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_nyc_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_nyc_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_nyc_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_nyc_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_nyc_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1075))) AND NAME='N.Y.C.') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='N.Y.C.') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1075)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_north_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_north_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_north_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_north_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_north_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1076))) AND NAME='NORTH') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='NORTH') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1076)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_npx_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_npx_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_npx_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_npx_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_npx_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1077))) AND NAME='NPX') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='NPX') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1077)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_oh_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_oh_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_oh_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_oh_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_oh_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1078))) AND NAME='O H') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='O H') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1078)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_pjm_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_pjm_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_pjm_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_pjm_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_pjm_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1079))) AND NAME='PJM') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='PJM') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1079)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_congestion AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_west_raw WHERE  NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_west_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_west_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_congestion),2)
       FROM nyiso_ham_west_raw WHERE NAME = a.NAME AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_congestion,NAME  FROM nyiso_ham_west_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1080))) AND NAME='WEST') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Congestion' AND Zone='WEST') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1080)))) c
ON c.timestamp=a.time_stamp;
                                 /*NYISO ENERGY HAM marginal_cost_losses*/
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_capitl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_capitl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_capitl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_capitl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_capitl_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1081))) AND NAME='CAPITL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='CAPITL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1081)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_centrl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_centrl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_centrl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_centrl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
      DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_centrl_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1082))) AND NAME='CENTRL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='CENTRL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1082)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_dunwod_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_dunwod_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_dunwod_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_dunwod_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_dunwod_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1083))) AND NAME='DUNWOD') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='DUNWOD') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1083)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_genese_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_genese_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_genese_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_genese_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_genese_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1084))) AND NAME='GENESE') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='GENESE') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1084)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hq_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hq_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hq_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hq_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_hq_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1085))) AND NAME='H Q') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='H Q') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1085)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hud_vl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hud_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hud_vl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_hud_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_capitl_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1086))) AND NAME='HUD VL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='HUD VL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1086)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_longil_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_longil_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_longil_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_longil_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_longil_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1087))) AND NAME='LONGIL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='LONGIL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1087)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_mhk_vl_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_mhk_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_mhk_vl_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_mhk_vl_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_mhk_vl_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1088))) AND NAME='MHK VL') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='MHK VL') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1088)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_millwd_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_millwd_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_millwd_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_millwd_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_millwd_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1089))) AND NAME='MILLWD') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='MILLWD') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1089)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_nyc_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_nyc_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_nyc_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_nyc_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_nyc_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1090))) AND NAME='N.Y.C.') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='N.Y.C.') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1090)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_north_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_north_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_north_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_north_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_north_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1091))) AND NAME='NORTH') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='NORTH') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1091)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_npx_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_npx_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_npx_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_npx_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_npx_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1092))) AND NAME='NPX') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='NPX') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1092)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_oh_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_oh_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_oh_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_oh_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_oh_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1093))) AND NAME='O H') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='O H') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1093)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_pjm_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_pjm_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_pjm_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_pjm_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_pjm_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1094))) AND NAME='PJM') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='PJM') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1094)))) c
ON c.timestamp=a.time_stamp;
REPLACE INTO bi_fact_markets_part
SELECT c.id AS bi_dim_date_id,
	b.id AS bi_dim_market_id,
	a.marginal_cost_losses AS clearing_price,
	(SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_west_raw WHERE  NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 29 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59')  AND HOUR(a.time_stamp)=HOUR(time_stamp)) AS thirty_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_west_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 89 DAY) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS ninety_day_avg,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_west_raw  WHERE  NAME = a.name AND  time_stamp=DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) ) AS previous_year_clearing_price,
       0 AS volume,
       (SELECT ROUND(AVG(marginal_cost_losses),2)
       FROM nyiso_ham_west_raw WHERE NAME = a.name AND time_stamp BETWEEN DATE_SUB(DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:00:00'),INTERVAL 1 YEAR) AND
       DATE_FORMAT(a.time_stamp,'%Y-%m-%d %H:59:59') AND HOUR(a.time_stamp)=HOUR(time_stamp))  AS one_year_avg,
       NULL AS capacity,
       c.id AS bi_dim_date_id_local
FROM
(SELECT TIME_STAMP,marginal_cost_losses,NAME  FROM nyiso_ham_west_raw WHERE TIME_STAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1095))) AND NAME='WEST') a
JOIN
(SELECT * FROM bi_dim_market WHERE iso='NYISO' AND market='Hour-Ahead Energy'AND service='Losses' AND Zone='WEST') b
JOIN
(SELECT * FROM bi_dim_date WHERE TIMESTAMP >=
(SELECT TIMESTAMP FROM bi_dim_date WHERE id = (SELECT MAX( bi_dim_date_id) FROM bi_fact_markets_part
WHERE bi_dim_market_id  IN (1095)))) c
ON c.timestamp=a.time_stamp;
END$$

DELIMITER ;