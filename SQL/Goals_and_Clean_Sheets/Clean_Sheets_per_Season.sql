-- Clean Sheets per season, only MatchDate changes in code based on season
SELECT 
				SUM(CASE WHEN FTHome = 0 THEN 1 ELSE 0 END) +
				SUM(CASE WHEN FTAway = 0 THEN 1 ELSE 0 END) AS Total_Clean_Sheets
FROM Matches
WHERE Division = 'E0'
      AND MatchDate BETWEEN '2024-08-01' AND '2025-05-31';
