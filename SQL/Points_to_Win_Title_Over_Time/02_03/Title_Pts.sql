SELECT Team, SUM(Points) AS Total_Pts
FROM (
    -- Home games
    SELECT HomeTeam AS Team,
           SUM(CASE 
               WHEN FTHome > FTAway THEN 3
               WHEN FTHome = FTAway THEN 1
               ELSE 0
           END) AS Points
    FROM Matches
    WHERE MatchDate BETWEEN '2002-08-17' AND '2003-05-11'
      AND Division = 'E0'
    GROUP BY HomeTeam

    UNION ALL

    -- Away games
    SELECT AwayTeam AS Team,
           SUM(CASE 
               WHEN FTAway > FTHome THEN 3
               WHEN FTAway = FTHome THEN 1
               ELSE 0
           END) AS Points
    FROM Matches
    WHERE MatchDate BETWEEN '2002-08-17' AND '2003-05-11'
      AND Division = 'E0'
    GROUP BY AwayTeam
) AS Combined
GROUP BY Team
ORDER BY Total_Pts DESC;
