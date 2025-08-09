-- Average goals per game by season, query stays the same except MatchDate for each season
SELECT 
				ROUND(AVG(FTHome + FTAway), 2)
FROM Matches
			  WHERE Division = 'E0'
		      AND MatchDate BETWEEN '2015-08-01' AND '2016-05-31';
