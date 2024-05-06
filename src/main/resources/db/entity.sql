-- Gọi bảng Supplier
create proc callSupplier 
as 
begin 
	select * from supplier 
end; 
----------------------
exec callsupplier
-------------------------
drop proc callSupplier


CREATE PROCEDURE callNormalEmployee
AS
BEGIN
	SELECT EmployeeID, CONCAT(LastName,' ', MiddleName,' ',FirstName) AS FullName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID
	FROM Employee AS E
	WHERE 
			E.EmployeeID NOT IN (SELECT EmployeeID FROM Cashier) AND
			E.EmployeeID NOT IN (SELECT EmployeeID FROM Manager) AND
			NOT EXISTS (SELECT SupervisorID FROM Employee WHERE SupervisorID = E.EmployeeID)
END
----------------------
EXEC callNormalEmployee
-------------------------
DROP callNormalEmployee