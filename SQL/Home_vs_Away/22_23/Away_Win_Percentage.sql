SELECT AwayTeam,
				COUNT(*) AS Total_Away_Games,
				SUM(CASE WHEN FTAway > FTHome THEN 1 
							ELSE 0 END) AS Away_wins,
				ROUND(SUM(CASE WHEN FTAway > FTHome THEN 1 ELSE 0 END) * 100.0 / COUNT(*) , 2) AS Away_Win_Percentage
FROM Matches
			  WHERE Division = 'E0'
			   AND MatchDate BETWEEN '2022-08-05' AND '2023-05-28'
GROUP BY AwayTeam
ORDER BY Away_Win_Percentage DESC;
