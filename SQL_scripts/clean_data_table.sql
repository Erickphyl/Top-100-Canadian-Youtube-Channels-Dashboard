/*

Data cleaning steps
Remove unnecessary columns by only selecting the ones we need
Extract the Youtube channel names from the first columns
Rename the column names

*/

CREATE VIEW view_can_youtubers_2025 AS 

SELECT 
    CAST(SUBSTRING(NAME, 1, CHARINDEX('@', NAME) - 1) AS VARCHAR(100)) as channel_name,
    total_subscribers,
    total_views,
    total_videos,
    category

FROM 
    top_cad_youtubers_2025

-- SUBSTRING: extracts portion of string at a specific starting position for a specified length.
-- (CHARINDEX('@', NAME) - 1): ends at the @ and removes @ that would've been included in the name.
-- CAST(... AS VARCHAR(100)): converts substring and stores it into VARCHAR (Variable-length character) type string.
-- VARCHAR(100): Stores text up to max lenght of 100 characters.
