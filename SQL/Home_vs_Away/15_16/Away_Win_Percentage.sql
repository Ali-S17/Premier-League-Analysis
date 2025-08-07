SELECT AwayTeam,
				COUNT(*) AS Total_Away_Games,
				SUM(CASE WHEN FTAway > FTHome THEN 1 
							ELSE 0 END) AS away_wins,
				ROUND(SUM(CASE WHEN FTAway > FTHome THEN 1 ELSE 0 END) * 100.0 / COUNT(*) , 2) AS Away_Win_Percentage
FROM Matches
			  WHERE Division = 'E0'
			   AND MatchDate BETWEEN '2015-08-08' AND '2016-05-17'
GROUP BY AwayTeam
ORDER BY Away_Win_Percentage DESC;
