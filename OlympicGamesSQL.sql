
--As a data analyst working at a news company you are asked to visualize data that will help readers understand how countries have performed historically in the summer Olympic Games.
--You also know that there is an interest in details about the competitors 
--The main task is still to show historical performance for different countries, with the possibility to select your own country."

SELECT
         [ID]
        ,[Name] AS 'Competitor Name' -- Renamed Column
        ,CASE	WHEN SEX = 'M' THEN 'Male' 
			ELSE 'Female' 
		END AS Sex -- Better name for filters and visualisations
        ,[Age]
		,CASE	WHEN [Age] < 18 THEN 'Under 18'
				WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
				WHEN [Age] BETWEEN 25 AND 30 THEN '25-30'
				WHEN [Age] > 30 THEN 'Over 30'
		 END AS [Age Grouping]
        ,[Height]
        ,[Weight]
        ,[NOC] AS 'Nation Code' -- Explained abbreviation
        ,LEFT(Games, CHARINDEX(' ', Games) - 1) AS 'Year' -- Split 'Games' column to isolate Year, based on space
        ,RIGHT(Games,CHARINDEX(' ', REVERSE(Games))-1) AS 'Season' -- Split 'Games' column to isolate Season, based on space
        -- ,[Games]
        ,[City] -- Commented out as it is not necessary for the analysis
        ,[Sport]
        ,[Event]
        ,CASE	WHEN Medal = 'NA' THEN 'Not Registered' 
			ELSE Medal 
		END AS Medal -- Replaced NA with Not Registered
  FROM [olympic_games].[dbo].[athletes_event_results]
  WHERE RIGHT(Games,CHARINDEX(' ', REVERSE(Games))-1) = 'Summer'; -- Where Clause to isolate Summer Season