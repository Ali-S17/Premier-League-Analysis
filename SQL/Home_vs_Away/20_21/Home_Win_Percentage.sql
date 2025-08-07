SELECT HomeTeam,
				COUNT(*) AS Total_Home_Games,
				SUM(CASE WHEN FTHome > FTAway THEN 1 
							ELSE 0 END) AS Home_wins,
				ROUND(SUM(CASE WHEN FTHome > FTAway THEN 1 ELSE 0 END) * 100.0 / COUNT(*) , 2) AS Home_Win_Percentage
FROM Matches
			  WHERE Division = 'E0'
			   AND MatchDate BETWEEN '2020-09-12' AND '2021-05-23'
GROUP BY HomeTeam
ORDER BY Home_Win_Percentage DESC;
