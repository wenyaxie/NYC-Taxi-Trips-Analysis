/*How many trips did Yellow taxis take EACH YEAR from 2013 to 2020?*/
SELECT
  COUNT(*) trips, pickup_year
FROM
  `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year BETWEEN 2013 AND 2020
GROUP BY pickup_year
ORDER BY pickup_year; 

##########   2013 year tab  #########
/*legal passenger_count (<6) each month in 2013*/
SELECT Count(1) AS Count_in_2013, pickup_month AS Month,
  CASE
    WHEN passenger_count < 6 THEN 'TRUE'
    ELSE 'FALSE'
  END
  AS is_legal
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2013 AND passenger_count < 11
GROUP BY pickup_month, is_legal
ORDER BY pickup_month;

####### group by weekday  #########
SELECT pickup_weekday as Week, COUNT(vendorID) as Trip_Number 
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2013
GROUP BY pickup_weekday
ORDER BY (case when pickup_weekday = 'Monday' then '1' when pickup_weekday = 'Tuesday' then '2' when pickup_weekday = 'Wednesday' then '3'
when pickup_weekday = 'Thursday' then '4' when pickup_weekday = 'Friday' then '5' when pickup_weekday = 'Saturday' then '6'
when pickup_weekday = 'Sunday' then '7' end);

######### group by month  #########
SELECT pickup_month as Month, COUNT(vendorID) as Trip_Number
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2013
GROUP BY pickup_month
ORDER BY pickup_month;

###########  2014 year tab  #########
/*legal passenger_count (<6) each month in 2014*/
SELECT Count(1) AS Count_in_2014, pickup_month AS Month,
  CASE
    WHEN passenger_count < 6 THEN 'TRUE'
    ELSE 'FALSE'
  END
  AS is_legal
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2014 AND passenger_count < 11
GROUP BY pickup_month, is_legal
ORDER BY pickup_month;

####### group by weekday  #########
SELECT pickup_weekday as Week, COUNT(vendorID) as Trip_Number 
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2014
GROUP BY pickup_weekday
ORDER BY (case when pickup_weekday = 'Monday' then '1' when pickup_weekday = 'Tuesday' then '2' when pickup_weekday = 'Wednesday' then '3'
when pickup_weekday = 'Thursday' then '4' when pickup_weekday = 'Friday' then '5' when pickup_weekday = 'Saturday' then '6'
when pickup_weekday = 'Sunday' then '7' end);

######### group by month  #########
SELECT pickup_month as Month, COUNT(vendorID) as Trip_Number
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2014
GROUP BY pickup_month
ORDER BY pickup_month;

###########  2015 year tab #########
/*legal passenger_count (<6) each month in 2015*/
SELECT Count(1) AS Count_in_2015, pickup_month AS Month,
  CASE
    WHEN passenger_count < 6 THEN 'TRUE'
    ELSE 'FALSE'
  END
  AS is_legal
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2015 AND passenger_count < 11
GROUP BY pickup_month, is_legal
ORDER BY pickup_month;

####### group by weekday  #########
SELECT pickup_weekday as Week, COUNT(vendorID) as Trip_Number 
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2015
GROUP BY pickup_weekday
ORDER BY (case when pickup_weekday = 'Monday' then '1' when pickup_weekday = 'Tuesday' then '2' when pickup_weekday = 'Wednesday' then '3'
when pickup_weekday = 'Thursday' then '4' when pickup_weekday = 'Friday' then '5' when pickup_weekday = 'Saturday' then '6'
when pickup_weekday = 'Sunday' then '7' end);

######### group by month  #########
SELECT pickup_month as Month, COUNT(vendorID) as Trip_Number
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2015
GROUP BY pickup_month
ORDER BY pickup_month;

###########  2016 year tab #########
/*legal passenger_count (<6) each month in 2016*/
SELECT Count(1) AS Count_in_2016, pickup_month AS Month,
  CASE
    WHEN passenger_count < 6 THEN 'TRUE'
    ELSE 'FALSE'
  END
  AS is_legal
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2016 AND passenger_count < 11
GROUP BY pickup_month, is_legal
ORDER BY pickup_month;

####### group by weekday  #########
SELECT pickup_weekday as Week, COUNT(vendorID) as Trip_Number 
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2016
GROUP BY pickup_weekday
ORDER BY (case when pickup_weekday = 'Monday' then '1' when pickup_weekday = 'Tuesday' then '2' when pickup_weekday = 'Wednesday' then '3'
when pickup_weekday = 'Thursday' then '4' when pickup_weekday = 'Friday' then '5' when pickup_weekday = 'Saturday' then '6'
when pickup_weekday = 'Sunday' then '7' end);

######### group by month  #########
SELECT pickup_month as Month, COUNT(vendorID) as Trip_Number
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2016
GROUP BY pickup_month
ORDER BY pickup_month;

###########  2017 year tab #########
/*legal passenger_count (<6) each month in 2017*/
SELECT Count(1) AS Count_in_2017, pickup_month AS Month,
  CASE
    WHEN passenger_count < 6 THEN 'TRUE'
    ELSE 'FALSE'
  END
  AS is_legal
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2017 AND passenger_count < 11
GROUP BY pickup_month, is_legal
ORDER BY pickup_month;

####### group by weekday  #########
SELECT pickup_weekday as Week, COUNT(vendorID) as Trip_Number 
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2017
GROUP BY pickup_weekday
ORDER BY (case when pickup_weekday = 'Monday' then '1' when pickup_weekday = 'Tuesday' then '2' when pickup_weekday = 'Wednesday' then '3'
when pickup_weekday = 'Thursday' then '4' when pickup_weekday = 'Friday' then '5' when pickup_weekday = 'Saturday' then '6'
when pickup_weekday = 'Sunday' then '7' end);

######### group by month  #########
SELECT pickup_month as Month, COUNT(vendorID) as Trip_Number
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2017
GROUP BY pickup_month
ORDER BY pickup_month;

###########  2018 year tab #########
/*legal passenger_count (<6) each month in 2018*/
SELECT Count(1) AS Count_in_2018, pickup_month AS Month,
  CASE
    WHEN passenger_count < 6 THEN 'TRUE'
    ELSE 'FALSE'
  END
  AS is_legal
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2018 AND passenger_count < 11
GROUP BY pickup_month, is_legal
ORDER BY pickup_month;

####### group by weekday  #########
SELECT pickup_weekday as Week, COUNT(vendorID) as Trip_Number 
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2018
GROUP BY pickup_weekday
ORDER BY (case when pickup_weekday = 'Monday' then '1' when pickup_weekday = 'Tuesday' then '2' when pickup_weekday = 'Wednesday' then '3'
when pickup_weekday = 'Thursday' then '4' when pickup_weekday = 'Friday' then '5' when pickup_weekday = 'Saturday' then '6'
when pickup_weekday = 'Sunday' then '7' end);

######### group by month  #########
SELECT pickup_month as Month, COUNT(vendorID) as Trip_Number
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2018
GROUP BY pickup_month
ORDER BY pickup_month;

###########  2019 year tab #########
/*legal passenger_count (<6) each month in 2019*/
SELECT Count(1) AS Count_in_2019, pickup_month AS Month,
  CASE
    WHEN passenger_count < 6 THEN 'TRUE'
    ELSE 'FALSE'
  END
  AS is_legal
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2019 AND passenger_count < 11
GROUP BY pickup_month, is_legal
ORDER BY pickup_month;

####### group by weekday  #########
SELECT pickup_weekday as Week, COUNT(vendorID) as Trip_Number 
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2019
GROUP BY pickup_weekday
ORDER BY (case when pickup_weekday = 'Monday' then '1' when pickup_weekday = 'Tuesday' then '2' when pickup_weekday = 'Wednesday' then '3'
when pickup_weekday = 'Thursday' then '4' when pickup_weekday = 'Friday' then '5' when pickup_weekday = 'Saturday' then '6'
when pickup_weekday = 'Sunday' then '7' end);

######### group by month  #########
SELECT pickup_month as Month, COUNT(vendorID) as Trip_Number
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2019
GROUP BY pickup_month
ORDER BY pickup_month;

###########  2020 year tab #########
/*legal passenger_count (<6) each month in 2020*/

SELECT Count(1) AS Count_in_2020, pickup_month AS Month,
  CASE
    WHEN passenger_count < 6 THEN 'TRUE'
    ELSE 'FALSE'
  END
  AS is_legal
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2020 AND passenger_count < 11
GROUP BY pickup_month, is_legal
ORDER BY pickup_month;

####### group by weekday  #########
SELECT pickup_weekday as Week, COUNT(vendorID) as Trip_Number 
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2020
GROUP BY pickup_weekday
ORDER BY (case when pickup_weekday = 'Monday' then '1' when pickup_weekday = 'Tuesday' then '2' when pickup_weekday = 'Wednesday' then '3'
when pickup_weekday = 'Thursday' then '4' when pickup_weekday = 'Friday' then '5' when pickup_weekday = 'Saturday' then '6'
when pickup_weekday = 'Sunday' then '7' end);

######### group by month  #########
SELECT pickup_month as month, COUNT(vendorID) as Trip_Number
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year = 2020
GROUP BY pickup_month
ORDER BY pickup_month;

#########  2019 trips & 2020 trip & covid_agg_confirmed_casesNum  &  covid_agg_deathsNum  ###############
SELECT pickup_month as month ,COUNT(*) tripNum, IFNULL(confirmed_cases, 0) AS covid_confirmed_casesNum ,IFNULL(deaths_num, 0) AS covid_deathsNum
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
left Join
      (SELECT extract(MONTH from date ) as pickup_month ,extract(YEAR from date) as pickup_year,max(confirmed_cases) as confirmed_cases, max(deaths) as deaths_num, 
      FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.covid19state_confirmed_cases`
      where state_name = 'New York' and date <= '2020-12-31'
      group by pickup_month,pickup_year ) using (pickup_month,pickup_year)
WHERE pickup_year = 2020
GROUP BY pickup_month,confirmed_cases,deaths_num
ORDER BY pickup_month;

#######   2013-2020 change of payment_type   #######
######### use cash or credit card  ############
SELECT pickup_year, count( payment_type ) as number, payment_type 
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T` 
WHERE payment_type = 'CSH' OR payment_type = 'CRD'
group by payment_type, pickup_year
ORDER BY pickup_year, payment_type;

/* 2013-2020 Change of tip_rate*/
SELECT ROUND(AVG(tip_rate), 2) AS Tip_Rate, pickup_year
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year BETWEEN 2013 and 2020
GROUP BY pickup_year
ORDER BY pickup_year;

/*New Yorker's yellow teaxi tipping description*/
select count(1)
from `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
where tip_amount = 0.0 AND pickup_year BETWEEN 2013 and 2020; #402925352

select count(1)
from `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
where tip_rate > 20 AND pickup_year BETWEEN 2013 and 2020; #6249565(0.6% for 25% tip & 4.9% for 20% tip)

select count(1)
from `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
where pickup_year BETWEEN 2013 and 2020; #1038198267

/*passenger count 2013-2020*/
/*True is legal, False is illegal or overloaded*/
SELECT Count(1) AS Count, pickup_year AS Year,
  CASE
    WHEN passenger_count < 6 THEN 'TRUE'
    ELSE 'FALSE'
  END
  AS is_legal
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T`
WHERE pickup_year BETWEEN 2013 AND 2020 AND passenger_count < 11
GROUP BY pickup_year, is_legal
ORDER BY pickup_year;

### speed: 2019  vs before 2020 11.7  vs  after 2020.11.7  ##########
select '2019-01-01,2019-12-31'as date, count(speed_miles_per_hour) as overSpeedNum, total, SAFE_DIVIDE( count(speed_miles_per_hour) , total)*100 as ratio 
from `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T` as T2,
(SELECT count(speed_miles_per_hour) as total FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T` where pickup_year= 2019 GROUP BY pickup_year )as T1
where pickup_year= 2019 and speed_miles_per_hour >= 30 
GROUP BY pickup_year,total
union all
select '2020-01-01,2020-11-06'as date,  count(speed_miles_per_hour) as overNum, total, SAFE_DIVIDE( count(speed_miles_per_hour) , total)*100 as ratio 
from `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T` as T2,
(SELECT count(speed_miles_per_hour) as total FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T` where pickup_year =2020 AND pickup_date < '2020-11-07' GROUP BY pickup_year )as T1
where pickup_year= 2020 AND pickup_date < '2020-11-07'and speed_miles_per_hour >= 30 
GROUP BY pickup_year,total
union all
select '2020-11-07,2020-12-31'as date, count(speed_miles_per_hour) as overNum, total, SAFE_DIVIDE( count(speed_miles_per_hour) , total)*100 as ratio 
from `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T` as T2,
(SELECT count(speed_miles_per_hour) as total FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013-2020T` where pickup_year =2020 AND pickup_date >= '2020-11-07' GROUP BY pickup_year )as T1
where pickup_year= 2020 AND pickup_date >= '2020-11-07'and speed_miles_per_hour >= 25
GROUP BY pickup_year,total 
order by date;

###### Top 20 Pickup Borough ######
SELECT
  COUNT(t3.vendor_id) AS amnt ,
  t3.zone_name,
  t3.borough,
  t3.year
FROM (
  SELECT
    t1.VendorID vendor_id,
    t2.zone_name,
    t2.borough,
    EXTRACT(YEAR
    FROM
      t1.tpep_pickup_datetime ) year
  FROM
  
    `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2019` t1
  JOIN
    `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.NYC_TAXI_ZONE` t2
  ON
      t1.PULocationID = CAST( t2.zone_id AS int64 )
    )t3
WHERE
  t3.year = 2019
GROUP BY
  t3.zone_name,
  t3.borough,
  t3.year
ORDER BY
  amnt DESC
limit 20

###### Top 20 Drop-off Borough ######
SELECT
  COUNT(t3.vendor_id) AS amnt ,
  t3.zone_name,
  t3.borough,
  t3.year
FROM (
  SELECT
    t1.VendorID vendor_id,
    t2.zone_name,
    t2.borough,
    EXTRACT(YEAR
    FROM
      t1.tpep_pickup_datetime ) year
  FROM
  
    `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2019` t1
  JOIN
    `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.NYC_TAXI_ZONE` t2
  ON
    t1.DOLocationID = CAST( t2.zone_id AS int64 )   
    )t3
WHERE
  t3.year = 2019
GROUP BY
  t3.zone_name,
  t3.borough,
  t3.year
ORDER BY
  amnt DESC
limit 20

#### third-party integration using Mapbox ####
/*most expensive pick-up location*/
SELECT
    pickup_longitude,pickup_latitude
FROM
    `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2015_opensource` t1 
WHERE 
    pickup_datetime BETWEEN '2015-01-01' AND '2015-12-31' 
    AND dropoff_datetime BETWEEN '2015-01-01' AND '2015-12-31'
    AND TIMESTAMP_DIFF(dropoff_datetime,pickup_datetime,SECOND) > 0
    AND passenger_count > 0
    AND trip_distance >= 0 
    AND tip_amount >= 0 
    AND tolls_amount >= 0 
    AND mta_tax >= 0 
    AND fare_amount >= 0
    AND total_amount >= 0
ORDER BY fare_amount DESC
LIMIT 10000;

/*pickup and dropoff locations for JFK pickups*/
SELECT * FROM 
(SELECT
    pickup_longitude AS longitude, pickup_latitude AS latitude, 0 AS is_dropoff
FROM
    `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2015_opensource` t1 
WHERE pickup_longitude > -73.833357 AND pickup_longitude < -73.742684 AND pickup_latitude > 40.631033 AND pickup_latitude < 40.674460
    AND t1.trip_distance > 0 
    AND pickup_datetime BETWEEN '2015-01-01' AND '2015-12-31' 
    AND dropoff_datetime BETWEEN '2015-01-01' AND '2015-12-31'
    AND TIMESTAMP_DIFF(dropoff_datetime,pickup_datetime,SECOND) > 0
    AND passenger_count > 0
    AND trip_distance >= 0 
    AND tip_amount >= 0 
    AND tolls_amount >= 0 
    AND mta_tax >= 0 
    AND fare_amount >= 0
    AND total_amount >= 0
LIMIT 1000)
UNION ALL 
(SELECT
    dropoff_longitude AS longitude, dropoff_latitude AS latitude, 1 AS is_dropoff
FROM
    `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2015_opensource` t1 
WHERE pickup_longitude > -73.833357 AND pickup_longitude < -73.742684 AND pickup_latitude > 40.631033 AND pickup_latitude < 40.674460
    AND pickup_datetime BETWEEN '2015-01-01' AND '2015-12-31' 
    AND dropoff_datetime BETWEEN '2015-01-01' AND '2015-12-31'
    AND TIMESTAMP_DIFF(dropoff_datetime,pickup_datetime,SECOND) > 0
    AND passenger_count > 0
    AND trip_distance >= 0 
    AND tip_amount >= 0 
    AND tolls_amount >= 0 
    AND mta_tax >= 0 
    AND fare_amount >= 0
    AND total_amount >= 0
AND t1.trip_distance > 0
LIMIT 100000);

/*Payment Type By Location*/
SELECT
    pickup_longitude, pickup_latitude, payment_type
FROM
    `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2015_opensource` t1 
WHERE pickup_longitude != 0 AND pickup_latitude != 0 AND RAND() < 100000/146112989 
    AND pickup_datetime BETWEEN '2015-01-01' AND '2015-12-31' 
    AND dropoff_datetime BETWEEN '2015-01-01' AND '2015-12-31'
    AND TIMESTAMP_DIFF(dropoff_datetime,pickup_datetime,SECOND) > 0
    AND passenger_count > 0
    AND trip_distance >= 0 
    AND tip_amount >= 0 
    AND tolls_amount >= 0 
    AND mta_tax >= 0 
    AND fare_amount >= 0
    AND total_amount >= 0;

    