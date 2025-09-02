/*
Data quality tests
The data needs to be 100 records of Youtube Channels (row count test)    *** (Status: passed the test)
The data needs 4 fields (column count test)                                *** (Status: passed the test)
The channel name must be string format, and the other columns must be an integer data type (data type check) *** (Status: passed the test)
Each record must be unique in the dataset (duplicate count count)        *** (Status: passed the test)

Row count - 100 
Column count - 4 

Data types

channel_name = VARCHAR
total_subscribers = INTEGER
total_views = INTEGER
total_videos = INTEGER
catergory = VARCHAR

Duplicate count = 0

*/


-- 1. Row count test

SELECT 
    COUNT(*) as no_of_rows
FROM 
    view_can_youtubers_2025


-- 2. Column count test

SELECT 
    COUNT(*) as column_count
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'view_can_youtubers_2025'


-- 3. Data type check

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_NAME = 'view_can_youtubers_2025'


-- 4. Duplicate record count check
SELECT 
    channel_name,
    COUNT(*) as duplicate_count
FROM 
    view_can_youtubers_2025
GROUP BY
    channel_name
HAVING
    COUNT(*) > 1