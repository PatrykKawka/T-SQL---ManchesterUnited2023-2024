CREATE PROCEDURE CheckFreeAgentAlert
AS
BEGIN
    
    DECLARE @FreeAgentCount INT;
   
    SELECT @FreeAgentCount = COUNT(*)
    FROM ContractsExpireDate
    WHERE FreeAgentAlert <> 'OK';
    
    PRINT 'Liczba zawodników, których kontrakt dobiega koñca: ' + CAST(@FreeAgentCount AS VARCHAR(10));
    
END;
---
EXEC CheckFreeAgentAlert