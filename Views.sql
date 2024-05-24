CREATE VIEW ContractsExpireDate AS
SELECT P2.FirstName, P2.LastName, P3.Position, C.ExpireDate, DATEDIFF(MONTH,GETDATE(), C.ExpireDate) as MonthsToEnd,
CASE
WHEN DATEDIFF(MONTH,GETDATE(), C.ExpireDate)  < 6 THEN 'Free Agent Soon'
ELSE 'OK'
END as FreeAgentAlert
FROM tbl_Players as P1 
LEFT JOIN tbl_PlayersName as P2 on P2.PlayerID = P1.PlayerID
LEFT JOIN tbl_Positions as P3 ON P1.Position=P3.PositionID 
LEFT JOIN tbl_Contracts as C on P1.PlayerID=C.PlayerID;
---


CREATE VIEW PlayersNationalitiesCount AS
SELECT N.Nationality, COUNT(PlayerID) as NumberOfPlayersFrom FROM tbl_Players as P
LEFT JOIN tbl_Nationalities as N
ON P.Nationality=N.NationalityID
GROUP BY N.Nationality;
---

CREATE VIEW Top5Goalscorers AS
SELECT TOP 5 WITH TIES P2.FirstName, P2.LastName, S.Goals
FROM tbl_Players as P 
LEFT JOIN tbl_PlayersName as P2 on P.PlayerID=P2.PlayerID
LEFT JOIN tbl_PlayersStatistics as S
ON P.PlayerID = S.PlayerID
ORDER BY S.Goals DESC;
---

CREATE VIEW Top5Assistants AS
SELECT TOP 5 WITH TIES P2.FirstName, P2.LastName, S.Assists
FROM tbl_Players as P 
LEFT JOIN tbl_PlayersName as P2 on P.PlayerID=P2.PlayerID
LEFT JOIN tbl_PlayersStatistics as S
ON P.PlayerID = S.PlayerID
ORDER BY S.Assists DESC;
---


CREATE VIEW Top5MostEfficient AS
SELECT TOP 5 WITH TIES P2.FirstName, P2.LastName, S.Goals, S.Assists, (S.Goals + S.Assists) as [Sum]
FROM tbl_Players as P 
LEFT JOIN tbl_PlayersName as P2 on P.PlayerID=P2.PlayerID
LEFT JOIN tbl_PlayersStatistics as S
ON P.PlayerID = S.PlayerID
ORDER BY [Sum] DESC;
---


CREATE VIEW AllStatistics AS
SELECT P2.FirstName, P2.LastName, S.Games, S.Goals, S.Assists, S.[Minutes], S.YellowCards, S.RedCards, M.MarketValue
FROM tbl_Players as P 
LEFT JOIN tbl_PlayersName as P2 on P.PlayerID=P2.PlayerID
LEFT JOIN tbl_PlayersStatistics as S
ON P.PlayerID = S.PlayerID
LEFT JOIN tbl_MarketValue as M
ON M.PlayerID = P.PlayerID;
---


CREATE VIEW MarketValueRankingOverPosition AS
SELECT P2.FirstName, P2.LastName, M.MarketValue, RANK() OVER(ORDER BY M.MarketValue DESC) as Ranking, PS.Position, RANK() OVER(PARTITION BY PS.Position ORDER BY M.MarketValue DESC) as RankOverPosition
FROM tbl_Players as P 
LEFT JOIN tbl_PlayersName as P2 on P.PlayerID=P2.PlayerID
LEFT JOIN tbl_MarketValue as M
ON M.PlayerID = P.PlayerID
LEFT JOIN tbl_Positions as PS
ON P.Position= PS.PositionID
GROUP BY P2.FirstName, P2.LastName, M.MarketValue, PS.Position;
