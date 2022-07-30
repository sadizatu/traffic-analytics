SET search_path TO cc_user;
--1
 select pg_size_pretty(pg_total_relation_size('sensors.observations'));
--SELECT * FROM sensors.observations;
--2
SELECT pg_size_pretty( 
    pg_indexes_size('sensors.observations'));
--3
SELECT 
    pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size, 
    pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
    pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;
--4
UPDATE sensors.observations 
SET distance = (2352 * 3.281) 
WHERE TRUE;
--5
SELECT pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size, 
    pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
    pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;
--6
VACUUM sensors.observations;
select pg_size_pretty(pg_total_relation_size('sensors.observations'));
--7
\COPY sensors.observations (id, datetime, location_id, duration, distance, category) FROM './additional_obs_types.csv' WITH DELIMITER ',' CSV HEADER;
--8
SELECT pg_size_pretty(pg_table_size('sensors.observations')) as total_size;
--9
VACUUM FULL sensors.observations;
 
SELECT pg_size_pretty(pg_table_size('sensors.observations')) as total_size;
--10
DELETE from sensors.observations 
WHERE location_id > 24;
--11
 select pg_size_pretty(pg_total_relation_size('sensors.observations'));
--12
TRUNCATE sensors.observations;
--13
\COPY sensors.observations (id, datetime, location_id, duration, distance, category) FROM './original_obs_types.csv' WITH DELIMITER ',' CSV HEADER;
 
\COPY sensors.observations (id, datetime, location_id, duration, distance, category) FROM './additional_obs_types.csv' WITH DELIMITER ',' CSV HEADER;
--14
SELECT 
    pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size, 
    pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
    pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;
