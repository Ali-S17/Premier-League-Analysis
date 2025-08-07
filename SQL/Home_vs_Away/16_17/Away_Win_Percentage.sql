SELECT AwayTeam,
				COUNT(*) AS Total_Away_Games,
				SUM(CASE WHEN FTAway > FTHome THEN 1 
							ELSE 0 END) AS away_wins,
				ROUND(SUM(CASE WHEN FTAway > FTHome THEN 1 ELSE 0 END) * 100.0 / COUNT(*) , 2) AS Away_Win_Percentage
FROM Matches
			  WHERE Division = 'E0'
			   AND MatchDate BETWEEN '2016-08-13' AND '2017-05-21'
GROUP BY AwayTeam
ORDER BY Away_Win_Percentage DESC;
