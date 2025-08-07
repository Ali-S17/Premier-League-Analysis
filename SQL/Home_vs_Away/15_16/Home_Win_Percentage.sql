SELECT HomeTeam,
				COUNT(*) AS Total_Home_Games,
				SUM(CASE WHEN FTHome > FTAway THEN 1 
							ELSE 0 END) AS home_wins,
				ROUND(SUM(CASE WHEN FTHome > FTAway THEN 1 ELSE 0 END) * 100.0 / COUNT(*) , 2) AS Home_Win_Percentage
FROM Matches
			  WHERE Division = 'E0'
			   AND MatchDate BETWEEN '2015-08-08' AND '2016-05-17'
GROUP BY HomeTeam
ORDER BY Home_Win_Percentage DESC;
