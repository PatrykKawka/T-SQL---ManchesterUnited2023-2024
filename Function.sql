CREATE FUNCTION PlayerStatistic (@LastName NVARCHAR(32))
RETURNS TABLE 
AS
RETURN
SELECT P2.FirstName, P2.LastName, S.Goals, S.Assists, (S.Goals + S.Assists) as [Sum]
FROM tbl_Players as P 
LEFT JOIN tbl_PlayersName as P2 ON P2.PlayerID = P.PlayerID
LEFT JOIN tbl_PlayersStatistics as S ON P.PlayerID = S.PlayerID
WHERE P2.LastName = @LastName
---

SELECT * FROM  PlayerStatistic('Casemiro')