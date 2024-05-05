USE POS;
GO

/*
  Function GetExpiredLots retrieves expired product lots respect to a given date (usually today).

  Parameters:
    - @GivenDate: specified date for determining expiration of product lots.
  Return:
    - Return a table with ProductLotID, ProductTypeID, QuantityInLot, ExpireDate for product lots
	that have been expired.
	- If @GivenDate is null, return empty table.
*/
CREATE FUNCTION dbo.GetExpiredLots(@GivenDate DATE)
RETURNS @ExpiredLots TABLE (
	ProductLotID INT,
	ProductTypeID NVARCHAR(20),
	QuantityInLot INT,
	ExpireDate DATE
)
AS
BEGIN
	IF @GivenDate IS NULL
	BEGIN
		RETURN;
	END;

	DECLARE @ProductLotID INT;
    DECLARE @ProductTypeID NVARCHAR(20);
    DECLARE @QuantityInLot INT;
	DECLARE @ExpireDate DATE;

	-- Create a cursor for looping through ProductLot table
	DECLARE LotCursor CURSOR FOR
	SELECT ProductLotID, ProductTypeID, QuantityInLot, ExpireDate
	FROM ProductLot;

	OPEN LotCursor;
	FETCH NEXT FROM LotCursor INTO @ProductLotID, @ProductTypeID, @QuantityInLot, @ExpireDate;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- Add product lot to the returned table if it is expired respect to GivenDate
		IF @ExpireDate < @GivenDate
		BEGIN
			INSERT INTO @ExpiredLots (ProductLotID, ProductTypeID, QuantityInLot, ExpireDate)
			VALUES (@ProductLotID, @ProductTypeID, @QuantityInLot, @ExpireDate);
		END;

		FETCH NEXT FROM LotCursor INTO @ProductLotID, @ProductTypeID, @QuantityInLot, @ExpireDate;
	END;

	-- Clean up cursor and return table
	CLOSE LotCursor;
	DEALLOCATE LotCursor;
	RETURN;
END;

GO

-- Example for GetExpiredLots: getting ProductLot with ID 4 in which there are expired product types before 2025-01-10
SELECT * FROM dbo.GetExpiredLots('2025-01-10')
WHERE ProductLotID = 4;

GO

/*
  Function GetExpiredLotsToday retrieves expired product lots respect to today date.

  Return:
    - Return a table with ProductLotID, ProductTypeID, QuantityInLot, ExpireDate for product lots
	that have been expired.
*/
CREATE FUNCTION dbo.GetExpiredLotsToday()
RETURNS TABLE
AS
RETURN (
	-- Reuse GetExpiredLots with today as GivenDate parameter
	SELECT * FROM dbo.GetExpiredLots(CAST(GETDATE() AS DATE))
);

GO

-- Exampple for GetExpiredLotsToday
SELECT * FROM dbo.GetExpiredLotsToday();

GO

/*
  Function GetExceedQuantityLots retrieves table of lots that has quantity exceeding certain limit.

  Parameter:
    - @MaxLimitQuantity: the given limit of maximum quantity.
  Return:
    - Return a table with ProductLotID, ProductTypeID, QuantityInLot, ExpireDate for product lots
	that have exceeded the given limit of quantity.
*/
CREATE FUNCTION dbo.GetExceedQuantityLots(@MaxLimitQuantity INT)
RETURNS TABLE
AS
RETURN (
	SELECT * FROM ProductLot
	WHERE QuantityInLot > @MaxLimitQuantity
);

GO

-- Example for GetExceedQuantityLots: getting product lots that exceed 50 in quantity
SELECT * FROM dbo.GetExceedQuantityLots(50);

GO

-- Example for both GetExpiredLotsToday and GetExceedQuantityLots (optional):
-- getting product lots that have expired and also exceed 30 in quantity
SELECT exp.ProductLotID, exp.ProductTypeID, exp.QuantityInLot, exp.ExpireDate
FROM dbo.GetExpiredLots('2025-01-01') AS exp
INNER JOIN dbo.GetExceedQuantityLots(30) AS exc
    ON exp.ProductLotID = exc.ProductLotID
   AND exp.ProductTypeID = exc.ProductTypeID;

GO

/*
  Function CalcBillPrice retrieves the total price of a given bill.

  Parameters:
    - @BillID: the ID of an entry in Bill table.
  Return:
    - Return calculated total price of the specified bill.
	- If @BillID is not found, return null.
*/
CREATE FUNCTION dbo.CalcBillPrice(@BillID INT)
RETURNS DECIMAL(10, 3)
AS
BEGIN
	IF NOT EXISTS (
        SELECT 1 FROM Bill
        WHERE BillID = @BillID
    )
    BEGIN
        RETURN NULL;
    END;

	DECLARE @ProductTypeID NVARCHAR(20);
	DECLARE @ProductLotID INT;
	DECLARE @QuantityInBill INT;
	DECLARE @SalePrice DECIMAL(10, 3);

	-- Create price accumulator
	DECLARE @TotalPrice DECIMAL(10, 3) = 0;

	-- Create a cursor for looping through Bill_ProductLot table
	DECLARE BillCursor CURSOR FOR
	SELECT ProductTypeID, ProductLotID, QuantityInBill, SalePrice
	FROM Bill_ProductLot
	WHERE BillID = @BillID;

	OPEN BillCursor;
	FETCH NEXT FROM BillCursor
	INTO @ProductTypeID, @ProductLotID, @QuantityInBill, @SalePrice;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- Add to total price if data entry is valid
		IF @QuantityInBill > 0 AND @SalePrice > 0
		BEGIN
			SET @TotalPrice = @TotalPrice + @QuantityInBill * @SalePrice;
		END;

		FETCH NEXT FROM BillCursor
		INTO @ProductTypeID, @ProductLotID, @QuantityInBill, @SalePrice;
	END;

	-- Clean up cursor and return accumulator
	CLOSE BillCursor;
	DEALLOCATE BillCursor;
	RETURN @TotalPrice;
END;

GO

-- Example for CalcBillPrice: getting table of total price for each bill
SELECT BillID, dbo.CalcBillPrice(BillID) AS TotalPrice
FROM Bill_ProductLot
GROUP BY BillID;

CREATE PROCEDURE CallAllBill 
AS
BEGIN
	SELECT *
	FROM Bill_ProductLot
END

EXEC dbo.CallAllBill 
DROP PROCEDURE FindEmployeeByEmployeeID


GO

/*
  Function GetMatchedEmployees retrieves a list of employees that at least one cell match MatchingString

  Parameters:
    - @MatchingString: the given string to be matched
  Return:
    - Return a table of employees who has at least one cell matches given string
*/
CREATE FUNCTION dbo.GetMatchedEmployees(@MatchingString NVARCHAR(320))
RETURNS TABLE
AS
RETURN (
	SELECT * FROM Employee
	WHERE LastName = @MatchingString OR
		  MiddleName = @MatchingString OR
		  FirstName = @MatchingString OR
		  CCCD = @MatchingString OR
		  PhoneNo = @MatchingString OR
		  Email = @MatchingString
);

GO

-- Example for GetMatchedEmployees: getting employes that has Thị in their name
SELECT * FROM dbo.GetMatchedEmployees(N'Thị');