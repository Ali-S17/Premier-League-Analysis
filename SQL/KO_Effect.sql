-- How does the time of the match affect teams in the big 6? Data from 19/20 to 24/25

SELECT Team, MatchTime, COUNT(*) AS Match_Count,
				  SUM(CASE WHEN Team = HomeTeam AND FTHome > FTAway THEN 1
							              WHEN Team = AwayTeam  AND FTAway > FTHome THEN 1 ELSE 0 END) AS Wins,
				  SUM(CASE WHEN Team = HomeTeam AND FTAway > FTHome THEN 1 
										  WHEN Team = AwayTeam AND FTHome > FTAway THEN 1 ELSE 0 END) AS Losses,
				  SUM(CASE WHEN FTHome = FTAway THEN 1 ELSE 0 END) AS Draws
FROM Matches
JOIN ( SELECT 'Arsenal' AS Team
			  UNION ALL SELECT 'Man City'
			  UNION ALL SELECT 'Liverpool'
			  UNION ALL SELECT 'Tottenham'
			  UNION ALL SELECT 'Chelsea'
			  UNION ALL SELECT 'Man United') ON (HomeTeam = Team OR AwayTeam = Team)
			 
WHERE Division = 'E0'
				AND MatchDate BETWEEN '2019-08-01' AND '2025-05-31'
GROUP BY Team, MatchTime
ORDER BY Team, MatchTime;
