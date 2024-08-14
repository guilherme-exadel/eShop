-- Sample stored procedure with potential issues
CREATE PROCEDURE GetEmployeeDetails
    @EmployeeID NVARCHAR(50)
AS
BEGIN
    -- No error handling
    -- Potential SQL injection risk due to direct concatenation of input parameter
    DECLARE @SQL NVARCHAR(MAX)
    SET @SQL = 'SELECT * FROM Employees WHERE EmployeeID = ' + @EmployeeID
    EXEC sp_executesql @SQL
    
    -- SELECT * can be flagged for not being explicit about columns
    -- No TRY...CATCH block for error handling
END
GO

-- Calling the stored procedure with a parameter
EXEC GetEmployeeDetails '1 OR 1=1'  -- Example of SQL injection risk
