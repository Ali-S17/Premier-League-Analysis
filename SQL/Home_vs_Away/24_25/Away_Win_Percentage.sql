SELECT AwayTeam,
				CASE WHEN AwayTeam IN ('Nott''m Forest', 'Nottm Forest') THEN 'Nottingham Forest'
                             ELSE AwayTeam END AS Standardised_AwayTeam,
				
				COUNT(*) AS Total_Away_Games,
				SUM(CASE WHEN FTAway > FTHome THEN 1 
							ELSE 0 END) AS Away_wins,
				ROUND(SUM(CASE WHEN FTAway > FTHome THEN 1 ELSE 0 END) * 100.0 / COUNT(*) , 2) AS Away_Win_Percentage
FROM Matches
			  WHERE Division = 'E0'
			   AND MatchDate BETWEEN '2024-08-11' AND '2025-05-28'
GROUP BY Standardised_AwayTeam
ORDER BY Away_Win_Percentage DESC;
