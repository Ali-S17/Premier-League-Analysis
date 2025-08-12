-- How often do teams come back to win after being behind at half-time. (From 02/03 & Top 5 Leagues)

SELECT Division, 
				 SUM(CASE WHEN HTAway > HTHome AND FTHome > FTAway THEN 1 ELSE 0 END) AS Home_Comebacks,
				 SUM(CASE WHEN HTHome > HTAway AND FTAway > FTHome THEN 1 ELSE 0 END) AS Away_Comebacks,
				 SUM(CASE WHEN (HTAway > HTHome AND FTHome > FTAway) OR (HTHome > HTAway AND FTAway > FTHome) THEN 1 ELSE 0 END) AS Total_Comebacks
FROM Matches
			  WHERE Division IN ('E0', 'F1', 'SP1', 'I1', 'D1')
			  AND MatchDate  BETWEEN '2002-08-01' AND '2025-05-31'
GROUP BY Division;
