CREATE PROCEDURE CheckFreeAgentAlert
AS
BEGIN
    
    DECLARE @FreeAgentCount INT;
   
    SELECT @FreeAgentCount = COUNT(*)
    FROM ContractsExpireDate
    WHERE FreeAgentAlert <> 'OK';
    
    PRINT 'Liczba zawodnik�w, kt�rych kontrakt dobiega ko�ca: ' + CAST(@FreeAgentCount AS VARCHAR(10));
    
END;
---
EXEC CheckFreeAgentAlert