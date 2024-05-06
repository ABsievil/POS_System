/*
Sắp xếp theo EmployeeID
*/
CREATE PROCEDURE EmployeeInforEA AS
BEGIN
	SELECT * FROM EMPLOYEE ORDER BY EmployeeID ASC;
END
EXEC dbo.EmployeeInforEA 
DROP PROCEDURE EmployeeInforEA

CREATE PROCEDURE EmployeeInforED AS
BEGIN
	SELECT * FROM EMPLOYEE ORDER BY EmployeeID DESC;
END
EXEC dbo.EmployeeInforED 
DROP PROCEDURE EmployeeInforED

/*
Sắp xếp theo BranchID
*/
CREATE PROCEDURE EmployeeInforBA AS
BEGIN
	SELECT * FROM EMPLOYEE ORDER BY BranchID ASC;
END
EXEC dbo.EmployeeInforBA 
DROP PROCEDURE EmployeeInforBA

CREATE PROCEDURE EmployeeInforBD AS
BEGIN
	SELECT * FROM EMPLOYEE ORDER BY BranchID DESC;
END
EXEC dbo.EmployeeInforBD 
DROP PROCEDURE EmployeeInforBD

/*
Sắp xếp theo SupervisorID
*/
CREATE PROCEDURE EmployeeInforSA AS
BEGIN
	SELECT * FROM EMPLOYEE ORDER BY SupervisorID ASC;
END
EXEC dbo.EmployeeInforSA 
DROP PROCEDURE EmployeeInforSA

CREATE PROCEDURE EmployeeInforSD AS
BEGIN
	SELECT * FROM EMPLOYEE ORDER BY SupervisorID DESC;
END
EXEC dbo.EmployeeInforSD 
DROP PROCEDURE EmployeeInforSD

/*
Tìm employee theo EmployeeID
*/
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

