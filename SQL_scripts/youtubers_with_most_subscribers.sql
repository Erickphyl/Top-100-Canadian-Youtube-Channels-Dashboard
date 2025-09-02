/*
1. Define the variables
2. Create a CTE that rounds the average views per video
3. Select the columns that are required for the analysis
4. Filter the results by the Youtube channels with the highest subscriber base
5.Order by net_profit (from highest to lowest)


*/

--1.
DECLARE @conversionRate FLOAT = 0.02;
DECLARE @productCost FLOAT =5.0;
DECLARE @campaignCost FLOAT = 50000.0;

WITH ChannelData AS (
	SELECT 
		channel_name,
		total_views,
		total_videos,
		ROUND(
			CAST(total_views AS FLOAT) / NULLIF(total_videos, 0), -5) AS rounded_average_views_per_video

	FROM 
		youtube_db.dbo.view_can_youtubers_2025
)


-- 3.
SELECT 
	channel_name,
	rounded_average_views_per_video,
	(rounded_average_views_per_video * @conversionRate) AS potential_units_sold_per_video,
	(rounded_average_views_per_video * @conversionRate * @productCost) AS potential_revenue_per_video,
	(rounded_average_views_per_video * @conversionRate * @productCost) - @campaignCost AS net_profit


FROM 
	ChannelData

-- 4.
WHERE 
	channel_name IN ('Justin Beiber', 'Super Simple Songs - Kids Songs', 'Sierra & Rhia FAM')

-- 5. 
ORDER BY
	net_profit DESC