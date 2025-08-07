SELECT HomeTeam,
				COUNT(*) AS Total_Home_Games,
				SUM(CASE WHEN FTHome > FTAway THEN 1 
							ELSE 0 END) AS home_wins,
				ROUND(SUM(CASE WHEN FTHome > FTAway THEN 1 ELSE 0 END) * 100.0 / COUNT(*) , 2) AS Home_Win_Percentage
FROM Matches
			  WHERE Division = 'E0'
			   AND MatchDate BETWEEN '2016-08-13' AND '2017-05-21'
GROUP BY HomeTeam
ORDER BY Home_Win_Percentage DESC;
