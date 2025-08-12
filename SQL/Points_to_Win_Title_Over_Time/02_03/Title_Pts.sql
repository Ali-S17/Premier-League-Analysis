-- Points needed to win the title over time / Date is the only thing to change

SELECT Team, SUM(Points) AS Total_Pts
FROM
			 (SELECT HomeTeam AS Team,
			   CASE WHEN FTHome > FTAway THEN 3
						   WHEN FTHome = FTAway THEN 1
						   ELSE 0 END AS Points
				FROM Matches 
				WHERE Division = 'E0'
				AND MatchDate BETWEEN '2024-08-01' AND '2025-05-31'
				
UNION ALL

				SELECT AwayTeam AS Team,
				CASE WHEN FTAway > FTHome THEN 3
							WHEN FTAway = FTHome THEN 1
							ELSE 0 END AS Points
				FROM Matches
				WHERE Division = 'E0'
				AND MatchDate BETWEEN '2024-08-01' AND '2025-05-31')
GROUP BY Team
ORDER BY Total_Pts DESC
LIMIT 4;
