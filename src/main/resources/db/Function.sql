USE POS;
GO

/*
  Function GetExpiredLots retrieves expired product lots respect to a given date (usually today).

  Parameters:
    - @GivenDate: specified date for determining expiration of product lots.
  Return:
    - Return a table with ProductLotID, ProductTypeID, QuantityInLot, ExpireDate for product lots
	that have been expired.
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
  Function GetDiscountRate retrieves discount rate of a specified product type on a given date.

  Parameters:
    - @ProductTypeID: the ID of an entry in ProductType table.
	- @GivenDate: the date to check discount rate.
  Return:
    - Return discount rate in DECIMAL(5, 2). If no match found, return 0.
*/
CREATE FUNCTION dbo.GetDiscountRate(@ProductTypeID NVARCHAR(20), @GivenDate DATETIME)
RETURNS DECIMAL(5, 2)
AS
BEGIN
	DECLARE @DiscountID INT;
	DECLARE @DiscountDate DATETIME;
	DECLARE @Discount DECIMAL(5, 2);

	-- Default return discount is 0 if no match found
	DECLARE @FoundDiscount DECIMAL(5, 2) = 0;

	-- Create a cursor for looping through Discount table
	DECLARE DiscountCursor CURSOR FOR
	SELECT DiscountID, DiscountDate, Discount
	FROM Discount
	WHERE ProductTypeID = @ProductTypeID;

	OPEN DiscountCursor;
	FETCH NEXT FROM DiscountCursor INTO @DiscountID, @DiscountDate, @Discount;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- Loop end when there is discount that matches specified date
		IF @DiscountDate = @GivenDate
		BEGIN
			SET @FoundDiscount = @Discount;
			BREAK;
		END;

		FETCH NEXT FROM DiscountCursor INTO @DiscountID, @DiscountDate, @Discount;
	END;

	-- Clean up cursor and return matched discount rate
	CLOSE DiscountCursor;
	DEALLOCATE DiscountCursor;
	RETURN @FoundDiscount;
END;

GO

-- Example for GetDiscountRate: Getting Discount Rate of Product Type VNM002 at 2024-04-29
SELECT dbo.GetDiscountRate('VNM002', '2024-04-29') AS DiscountRate;

GO

/*
  Function CalcBillPrice retrieves the total price of a given bill.

  Parameters:
    - @BillID: the ID of an entry in Bill table.
  Return:
    - Return calculated total price of the specified bill.
*/
CREATE FUNCTION dbo.CalcBillPrice(@BillID INT)
RETURNS DECIMAL(10, 3)
AS
BEGIN
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