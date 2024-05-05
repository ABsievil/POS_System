CREATE PROCEDURE EmployeeInfor AS
BEGIN
	SELECT *
	FROM EMPLOYEE
END

EXEC dbo.EmployeeInfor 

DROP PROCEDURE EmployeeInfor

CREATE PROCEDURE FindEmployeeByEmployeeID 
 @EmployeeID INT
AS
BEGIN
	SELECT *
	FROM EMPLOYEE
	WHERE EmployeeID = @EmployeeID
END

EXEC dbo.FindEmployeeByEmployeeID 
@EmployeeID = 1
DROP PROCEDURE FindEmployeeByEmployeeID