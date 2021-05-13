#######################  2013-2020 year  ###############################
#### pick_up_datetime: date, year, month, week, hour, minute   ########
#### drop_off_datetime: date, year, month, week, hour        ######## 
#### vendorID, speed_miles_per_hour, passenger_count, trip_distance ,fare_amount, tip_amount ,tip_rate, payment_type, total_amount ########

SELECT
    VendorID,
-- extract pickup time     
    EXTRACT(DATE from tpep_pickup_datetime) as pickup_date,
    EXTRACT(YEAR from tpep_pickup_datetime) as pickup_year,
    EXTRACT(MONTH from tpep_pickup_datetime) as pickup_month,
    FORMAT_DATE('%A',DATE(tpep_pickup_datetime)) as pickup_weekday,
    EXTRACT(HOUR from tpep_pickup_datetime) as pickup_hour,
    EXTRACT(MINUTE from tpep_pickup_datetime) as pickup_minute,
-- extract dropoff time    
    EXTRACT(DATE from tpep_dropoff_datetime) as dropoff_date,
    EXTRACT(YEAR from tpep_dropoff_datetime) as dropoff_year,
    EXTRACT(MONTH from tpep_dropoff_datetime) as dropoff_month,
    FORMAT_DATE('%A',DATE(tpep_dropoff_datetime)) as dropoff_weekday,
    EXTRACT(HOUR from tpep_dropoff_datetime) as dropoff_hour, 
--  other columns
    ROUND(trip_distance/TIMESTAMP_DIFF(tpep_dropoff_datetime,tpep_pickup_datetime,SECOND)*3600,2) as speed_miles_per_hour,
    passenger_count, trip_distance ,fare_amount, tip_amount ,
    (CASE WHEN total_amount=0 THEN 0 ELSE ROUND(tip_amount*100/total_amount,2) END) as tip_rate,
    CASE WHEN payment_type = 1 THEN 'CRD' ELSE 'CSH' END as payment_type,
    total_amount
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2020` as ninet
WHERE 
    PULocationID BETWEEN 1 AND 263 
    AND DOLocationID BETWEEN 1 AND 263
    AND tpep_pickup_datetime BETWEEN '2020-01-01' AND '2020-12-31' 
    AND tpep_dropoff_datetime BETWEEN '2020-01-01' AND '2020-12-31'
    AND TIMESTAMP_DIFF(tpep_dropoff_datetime,tpep_pickup_datetime,SECOND) > 0
    AND passenger_count > 0
    AND trip_distance >= 0 
    AND tip_amount >= 0 
    AND tolls_amount >= 0 
    AND mta_tax >= 0 
    AND fare_amount >= 0
    AND total_amount >= 0
UNION ALL
SELECT
    VendorID,
-- extract pickup time     
    EXTRACT(DATE from tpep_pickup_datetime) as pickup_date,
    EXTRACT(YEAR from tpep_pickup_datetime) as pickup_year,
    EXTRACT(MONTH from tpep_pickup_datetime) as pickup_month,
    FORMAT_DATE('%A',DATE(tpep_pickup_datetime)) as pickup_weekday,
    EXTRACT(HOUR from tpep_pickup_datetime) as pickup_hour,
    EXTRACT(MINUTE from tpep_pickup_datetime) as pickup_minute,
-- extract dropoff time    
    EXTRACT(DATE from tpep_dropoff_datetime) as dropoff_date,
    EXTRACT(YEAR from tpep_dropoff_datetime) as dropoff_year,
    EXTRACT(MONTH from tpep_dropoff_datetime) as dropoff_month,
    FORMAT_DATE('%A',DATE(tpep_dropoff_datetime)) as dropoff_weekday,
    EXTRACT(HOUR from tpep_dropoff_datetime) as dropoff_hour, 
--  other columns
    ROUND(trip_distance/TIMESTAMP_DIFF(tpep_dropoff_datetime,tpep_pickup_datetime,SECOND)*3600,2) as speed_miles_per_hour,
    passenger_count, trip_distance ,fare_amount, tip_amount ,
    (CASE WHEN total_amount=0 THEN 0 ELSE ROUND(tip_amount*100/total_amount,2) END) as tip_rate,
    CASE WHEN payment_type = 1 THEN 'CRD' ELSE 'CSH' END as payment_type,
    total_amount
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2019` as ninet
WHERE 
    PULocationID BETWEEN 1 AND 263 
    AND DOLocationID BETWEEN 1 AND 263
    AND tpep_pickup_datetime BETWEEN '2019-01-01' AND '2019-12-31' 
    AND tpep_dropoff_datetime BETWEEN '2019-01-01' AND '2019-12-31'
    AND TIMESTAMP_DIFF(tpep_dropoff_datetime,tpep_pickup_datetime,SECOND) > 0
    AND passenger_count > 0
    AND trip_distance >= 0 
    AND tip_amount >= 0 
    AND tolls_amount >= 0 
    AND mta_tax >= 0 
    AND fare_amount >= 0
    AND total_amount >= 0
UNION ALL
SELECT 
    VendorID,
-- extract pickup time    
    EXTRACT(DATE from tpep_pickup_datetime) as pickup_date,
    EXTRACT(YEAR from tpep_pickup_datetime) as pickup_year,
    EXTRACT(MONTH from tpep_pickup_datetime) as pickup_month,
    FORMAT_DATE('%A',DATE(tpep_pickup_datetime)) as pickup_weekday,
    EXTRACT(HOUR from tpep_pickup_datetime) as pickup_hour,
    EXTRACT(MINUTE from tpep_pickup_datetime) as pickup_minute,
-- extract dropoff time  
    EXTRACT(DATE from tpep_dropoff_datetime) as dropoff_date,
    EXTRACT(YEAR from tpep_dropoff_datetime) as dropoff_year,
    EXTRACT(MONTH from tpep_dropoff_datetime) as dropoff_month,
    FORMAT_DATE('%A',DATE(tpep_dropoff_datetime)) as dropoff_weekday,
    EXTRACT(HOUR from tpep_dropoff_datetime) as dropoff_hour, 
--  other columns    
    ROUND(trip_distance/TIMESTAMP_DIFF(tpep_dropoff_datetime,tpep_pickup_datetime,SECOND)*3600,2) as speed_miles_per_hour,
    passenger_count, trip_distance, fare_amount, tip_amount , 
    (CASE WHEN total_amount=0 THEN 0 ELSE ROUND(tip_amount*100/total_amount,2) END) as tip_rate,
    CASE WHEN payment_type = 1 THEN 'CRD' ELSE 'CSH' END as payment_type,
    total_amount
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2018` as eightt
WHERE 
    PULocationID BETWEEN 1 AND 263 
    AND DOLocationID BETWEEN 1 AND 263
    AND tpep_pickup_datetime BETWEEN '2018-01-01' AND '2018-12-31' 
    AND tpep_dropoff_datetime BETWEEN '2018-01-01' AND '2018-12-31'
    AND TIMESTAMP_DIFF(tpep_dropoff_datetime,tpep_pickup_datetime,SECOND) > 0
    AND passenger_count > 0
    AND trip_distance >= 0 
    AND tip_amount >= 0 
    AND tolls_amount >= 0 
    AND mta_tax >= 0 
    AND fare_amount >= 0
    AND total_amount >= 0
UNION ALL
SELECT
    VendorID, 
-- extract pickup time     
    EXTRACT(DATE from tpep_pickup_datetime) as pickup_date,
    EXTRACT(YEAR from tpep_pickup_datetime) as pickup_year,
    EXTRACT(MONTH from tpep_pickup_datetime) as pickup_month,
    FORMAT_DATE('%A',DATE(tpep_pickup_datetime)) as pickup_weekday,
    EXTRACT(HOUR from tpep_pickup_datetime) as pickup_hour,
    EXTRACT(MINUTE from tpep_pickup_datetime) as pickup_minute,
-- extract dropoff time     
    EXTRACT(DATE from tpep_dropoff_datetime) as dropoff_date,
    EXTRACT(YEAR from tpep_dropoff_datetime) as dropoff_year,
    EXTRACT(MONTH from tpep_dropoff_datetime) as dropoff_month,
    FORMAT_DATE('%A',DATE(tpep_dropoff_datetime)) as dropoff_weekday,
    EXTRACT(HOUR from tpep_dropoff_datetime) as dropoff_hour, 
--  other columns    
    ROUND(trip_distance/TIMESTAMP_DIFF(tpep_dropoff_datetime,tpep_pickup_datetime,SECOND)*3600,2) as speed_miles_per_hour,
    passenger_count, trip_distance, fare_amount, tip_amount ,
    (CASE WHEN total_amount=0 THEN 0 ELSE ROUND(tip_amount*100/total_amount,2) END) as tip_rate,
    CASE WHEN payment_type = 1 THEN 'CRD' ELSE 'CSH' END as payment_type,
    total_amount
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2017` as sevent
WHERE 
    PULocationID BETWEEN 1 AND 263 
    AND DOLocationID BETWEEN 1 AND 263
    AND tpep_pickup_datetime BETWEEN '2017-01-01' AND '2017-12-31' 
    AND tpep_dropoff_datetime BETWEEN '2017-01-01' AND '2017-12-31'
    AND TIMESTAMP_DIFF(tpep_dropoff_datetime,tpep_pickup_datetime,SECOND) > 0
    AND passenger_count > 0
    AND trip_distance >= 0 
    AND tip_amount >= 0 
    AND tolls_amount >= 0 
    AND mta_tax >= 0 
    AND fare_amount >= 0
    AND total_amount >= 0
UNION ALL
SELECT
    cast(vendor_id as int64), 
-- extract pickup time     
    EXTRACT(DATE from TIMESTAMP( pickup_datetime )) as pickup_date,
    EXTRACT(YEAR from TIMESTAMP( pickup_datetime )) as pickup_year,
    EXTRACT(MONTH from TIMESTAMP( pickup_datetime )) as pickup_month,
    FORMAT_DATE('%A',DATE(TIMESTAMP( pickup_datetime ))) as pickup_weekday,
    EXTRACT(HOUR from TIMESTAMP( pickup_datetime )) as pickup_hour,
    EXTRACT(MINUTE from TIMESTAMP( pickup_datetime )) as pickup_minute,
-- extract dropoff time     
    EXTRACT(DATE from TIMESTAMP( dropoff_datetime )) as dropoff_date,
    EXTRACT(YEAR from TIMESTAMP( dropoff_datetime )) as dropoff_year,
    EXTRACT(MONTH from TIMESTAMP( dropoff_datetime )) as dropoff_month,
    FORMAT_DATE('%A',DATE(TIMESTAMP( dropoff_datetime ))) as dropoff_weekday,
    EXTRACT(HOUR from TIMESTAMP( dropoff_datetime )) as dropoff_hour,
--  other columns    
    ROUND(trip_distance/TIMESTAMP_DIFF(TIMESTAMP( dropoff_datetime ),TIMESTAMP( pickup_datetime ),SECOND)*3600,2) as speed_miles_per_hour,
    passenger_count, trip_distance, fare_amount, tip_amount , 
    (CASE WHEN total_amount=0 THEN 0 ELSE ROUND(tip_amount*100/total_amount,2) END) as tip_rate,
    CASE WHEN payment_type = '1' THEN 'CRD' ELSE 'CSH' END as payment_type ,
    total_amount
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2016_opensource` as sixt
WHERE 
    TIMESTAMP( pickup_datetime ) BETWEEN '2016-01-01' AND '2016-12-31' 
    AND TIMESTAMP( dropoff_datetime ) BETWEEN '2016-01-01' AND '2016-12-31'
    AND TIMESTAMP_DIFF(TIMESTAMP( dropoff_datetime ),TIMESTAMP( pickup_datetime ),SECOND) > 0
    AND passenger_count > 0
    AND trip_distance >= 0 
    AND tip_amount >= 0 
    AND tolls_amount >= 0 
    AND mta_tax >= 0 
    AND fare_amount >= 0
    AND total_amount >= 0
UNION ALL
SELECT
    cast(vendor_id as int64), 
-- extract pickup time     
    EXTRACT(DATE from TIMESTAMP( pickup_datetime )) as pickup_date,
    EXTRACT(YEAR from TIMESTAMP( pickup_datetime )) as pickup_year,
    EXTRACT(MONTH from TIMESTAMP( pickup_datetime )) as pickup_month,
    FORMAT_DATE('%A',DATE(TIMESTAMP( pickup_datetime ))) as pickup_weekday,
    EXTRACT(HOUR from TIMESTAMP( pickup_datetime )) as pickup_hour,
    EXTRACT(MINUTE from TIMESTAMP( pickup_datetime )) as pickup_minute,
-- extract dropoff time     
    EXTRACT(DATE from TIMESTAMP( dropoff_datetime )) as dropoff_date,
    EXTRACT(YEAR from TIMESTAMP(dropoff_datetime )) as dropoff_year,
    EXTRACT(MONTH from TIMESTAMP( dropoff_datetime )) as dropoff_month,
    FORMAT_DATE('%A',DATE(TIMESTAMP( dropoff_datetime ))) as dropoff_weekday,
    EXTRACT(HOUR from TIMESTAMP( dropoff_datetime )) as dropoff_hour, 
--  other columns    
    ROUND(trip_distance/TIMESTAMP_DIFF(TIMESTAMP( dropoff_datetime ),TIMESTAMP( pickup_datetime ),SECOND)*3600,2) as speed_miles_per_hour,
    passenger_count, trip_distance, fare_amount, tip_amount, 
    (CASE WHEN total_amount=0 THEN 0 ELSE ROUND(tip_amount*100/total_amount,2) END) as tip_rate,
    CASE WHEN payment_type = '1' THEN 'CRD' ELSE 'CSH' END as payment_type,
    total_amount
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2015_opensource` as fivet
WHERE 
    ((pickup_latitude BETWEEN -90 AND 90) AND (pickup_longitude BETWEEN -180 AND 180)) 
    AND
    ((dropoff_latitude BETWEEN -90 AND 90) AND (dropoff_longitude BETWEEN -180 AND 180))
    AND
    TIMESTAMP( pickup_datetime ) BETWEEN '2015-01-01' AND '2015-12-31' 
    AND TIMESTAMP( dropoff_datetime ) BETWEEN '2015-01-01' AND '2015-12-31'
    AND TIMESTAMP_DIFF(TIMESTAMP( dropoff_datetime ),TIMESTAMP( pickup_datetime ),SECOND) > 0
    AND passenger_count > 0
    AND trip_distance >= 0 
    AND tip_amount >= 0 
    AND tolls_amount >= 0 
    AND mta_tax >= 0 
    AND fare_amount >= 0
    AND total_amount >= 0
UNION ALL
SELECT
    case when vendor_id = 'CMT' then 1 else 2 end ,
-- extract pickup time     
    EXTRACT(DATE from _pickup_datetime) as pickup_date,
    EXTRACT(YEAR from _pickup_datetime) as pickup_year,
    EXTRACT(MONTH from _pickup_datetime) as pickup_month,   
    FORMAT_DATE('%A',DATE(_pickup_datetime)) as pickup_weekday,
    EXTRACT(HOUR from _pickup_datetime) as pickup_hour,
    EXTRACT(MINUTE from _pickup_datetime) as pickup_minute,
-- extract dropoff time     
    EXTRACT(DATE from _dropoff_datetime) as dropoff_date,
    EXTRACT(YEAR from _dropoff_datetime) as dropoff_year,
    EXTRACT(MONTH from _dropoff_datetime) as dropoff_month,
    FORMAT_DATE('%A',DATE(_dropoff_datetime)) as dropoff_weekday,
    EXTRACT(HOUR from _dropoff_datetime) as dropoff_hour,
--  other columns   
    ROUND(_trip_distance/TIMESTAMP_DIFF(_dropoff_datetime,_pickup_datetime,SECOND)*3600,2) as speed_miles_per_hour,
    _passenger_count ,_trip_distance, _fare_amount, _tip_amount,
    (CASE WHEN _total_amount=0 THEN 0 ELSE ROUND(_tip_amount*100/_total_amount,2) END) as tip_rate,
    _payment_type ,_total_amount
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2014` as fourt
WHERE 
    ((_pickup_latitude BETWEEN -90 AND 90) AND (_pickup_longitude BETWEEN -180 AND 180)) 
    AND
    ((_dropoff_latitude BETWEEN -90 AND 90) AND (_dropoff_longitude BETWEEN -180 AND 180))
    AND
    _pickup_datetime BETWEEN '2014-01-01' AND '2014-12-31' 
    AND _dropoff_datetime BETWEEN '2014-01-01' AND '2014-12-31'
    AND TIMESTAMP_DIFF(_dropoff_datetime,_pickup_datetime,SECOND) > 0
    AND _passenger_count > 0
    AND _trip_distance >= 0 
    AND _tip_amount >= 0 
    AND _tolls_amount >= 0 
    AND _mta_tax >= 0 
    AND _fare_amount >= 0
    AND _total_amount >= 0
UNION ALL
SELECT
    case when vendor_id = 'CMT' then 1 else 2 end ,
-- extract pickup time     
    EXTRACT(DATE from pickup_datetime) as pickup_date,
    EXTRACT(YEAR from pickup_datetime) as pickup_year,
    EXTRACT(MONTH from pickup_datetime) as pickup_month,
    FORMAT_DATE('%A',DATE(pickup_datetime)) as pickup_weekday,
    EXTRACT(HOUR from pickup_datetime) as pickup_hour,
    EXTRACT(MINUTE from pickup_datetime) as pickup_minute,
-- extract dropoff time     
    EXTRACT(DATE from dropoff_datetime) as dropoff_date,
    EXTRACT(YEAR from dropoff_datetime) as dropoff_year,
    EXTRACT(MONTH from dropoff_datetime) as dropoff_month,   
    FORMAT_DATE('%A',DATE(dropoff_datetime)) as dropoff_weekday,
    EXTRACT(HOUR from dropoff_datetime) as dropoff_hour,
--  other columns
    ROUND(trip_distance/TIMESTAMP_DIFF(dropoff_datetime,pickup_datetime,SECOND)*3600,2) as speed_miles_per_hour,
    passenger_count, trip_distance, fare_amount, tip_amount,
    (CASE WHEN total_amount=0 THEN 0 ELSE ROUND(tip_amount*100/total_amount,2) END) as tip_rate,
    payment_type ,total_amount
FROM `sjsu-nyc-taxi-trips-analysis.yellowcab_taxi.2013` as threet
WHERE 
    ((pickup_latitude BETWEEN -90 AND 90) AND (pickup_longitude BETWEEN -180 AND 180)) 
    AND
    ((dropoff_latitude BETWEEN -90 AND 90) AND (dropoff_longitude BETWEEN -180 AND 180))
    AND
    pickup_datetime BETWEEN '2013-01-01' AND '2013-12-31' 
    AND dropoff_datetime BETWEEN '2013-01-01' AND '2013-12-31'
    AND TIMESTAMP_DIFF(dropoff_datetime,pickup_datetime,SECOND) > 0
    AND passenger_count > 0
    AND trip_distance >= 0 
    AND tip_amount >= 0 
    AND tolls_amount >= 0 
    AND mta_tax >= 0 
    AND fare_amount >= 0
    AND total_amount >= 0
ORDER BY pickup_date;
