GO

-- Constraint on total price of an Bill (trigger when Product changes)
CREATE TRIGGER trg_CheckBillTotalPrice_Bill
ON Bill
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @BillID INT;
    DECLARE @TotalPrice DECIMAL(10, 3);

    -- Get the BillID from the inserted or updated data
    SELECT @BillID = BillID FROM inserted;

    -- Calculate the total price for this Bill
   SELECT @TotalPrice = SUM(bp.SalePrice * bp.QuantityInBill)
   FROM Bill_ProductLot AS bp
   WHERE BillID = @BillID;

    -- If the total price exceeds the limit 20,000,000 vnd, raise an error
    IF @TotalPrice > 20000
    BEGIN
        RAISERROR('Total price for the Bill exceeds the limit of 20,000,000 vnd.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO

-- kiểm tra số ca làm tối đa 
CREATE TRIGGER CheckShift
ON Shift 
after INSERT, UPDATE
As 
begin 
	declare @sumofshift int;
	declare @manv int
	select @manv = EmployeeID 
	from inserted 
	select @sumofshift = count(employeeID)
	from shift 
	where @manv= employeeID 
	if @sumofshift > 8 
	begin 
		raiserror('Nhân viên làm việc quá 8 ca một tuần',16,2);
		rollback transaction 
	end 
end;

GO

-- kiểm tra số ca làmm tối thiếu của nhân viên 
CREATE TRIGGER CheckshiftMin 
on shift 
for delete 
As 
begin 
	declare @manv int;
	declare @sumofshift int;
	select @manv = EmployeeID 
	from deleted; 
	select @sumofshift = count(employeeID)
	from shift
	where @manv= employeeID ;
	if @sumofshift < 4 
		begin 
		raiserror ('Nhân viên làm việc không đủ 4 ca một tuần',16,2); 
		end ;
end;

GO

-- tự động cập nhật số lượng hàng tồn sau mỗi lần xuất hóa đơn 
CREATE TRIGGER Soluongton 
on Bill_ProductLot 
after insert
as 
begin 
 declare @malo int; 
 declare @maloaisp nvarchar(20); 
 declare @sluongban int; 
 select @sluongban = QuantityInBill from inserted ; --  số lượng sản phẩm bán từ bill vừa được insert
 select @malo =  ProductLotID from inserted ;	-- mã lô được bán
 select @maloaisp = ProductTypeID from inserted ; -- mã loại sp được bán
 update ProductLot 	-- cập nhật số sản phẩm tồn ở bảng lô sp
 set QuantityinLot= quantityinlot - @sluongban
 where ProductLotID = @malo and ProductTypeID = @maloaisp ;
 update ProductType -- cập nhật số sản phẩm tồn ở bảng loại sp 
 set Stockquantity = stockquantity - @sluongban 
 where ProductTypeID = @maloaisp ;
end;

GO

-- Kiem tra trigger
delete from shift 
where EmployeeID = 2 and ShiftTime =3; 
insert into Shift values (1,2,6) 
insert into Bill  values (7,'2023-02-02 12:00:00',35);
delete from bill where billID = 7
INSERT INTO Bill_ProductLot (BillID, ProductLotID, ProductTypeID, QuantityInBill, SalePrice)
VALUES
	(7, 2, 'VNM001', 3, 49.500)
delete form Bill_ProductLot where billID = 7;

GO

-- Constraint on the number of supervisors per shift
CREATE TRIGGER trg_CheckShiftSupervisor_Shift
ON Shift
AFTER DELETE
AS
BEGIN
    DECLARE @ShiftTime INT;
    DECLARE @ShiftDay VARCHAR(2);

    -- Create cursor to loop through information of deleted shift
    DECLARE ShiftCursor CURSOR FOR
    SELECT DISTINCT ShiftTime, ShiftDay FROM deleted;
    OPEN ShiftCursor;
    FETCH NEXT FROM ShiftCursor INTO @ShiftTime, @ShiftDay;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF NOT EXISTS (
            SELECT 1 FROM Shift sh INNER JOIN Employee em
			ON sh.EmployeeID = em.EmployeeID
            WHERE sh.ShiftTime = @ShiftTime
              AND sh.ShiftDay = @ShiftDay
              AND em.SupervisorID IS NOT NULL
        )
        BEGIN
            RAISERROR('Mỗi ca làm cần ít nhất một nhân viên giám sát. Vui lòng chọn nhân viên giám sát khác trước khi xóa ca làm này.', 16, 1);
            ROLLBACK;
            RETURN;
        END

        FETCH NEXT FROM ShiftCursor INTO @ShiftTime, @ShiftDay;
    END

	-- Clean up cursor
    CLOSE ShiftCursor;
    DEALLOCATE ShiftCursor;
END

-- Constraint on day interval between each batch of the same product type
CREATE TRIGGER trg_CheckBatchDateInterval_ImportBatch
ON ImportBatch
BEFORE INSERT, UPDATE
AS
BEGIN
    DECLARE @ProductTypeID NVARCHAR(20);
    DECLARE @BatchDate DATE;

    -- Create cursor to loop through information of inserted batches
    DECLARE BatchCursor CURSOR FOR
    SELECT ProductTypeID, BatchDate FROM inserted;
    OPEN BatchCursor;
    FETCH NEXT FROM BatchCursor INTO @ProductTypeID, @BatchDate;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Get the most recent batch date of this product type
        DECLARE @LatestBatchDate DATE;
        SELECT @LatestBatchDate = MAX(BatchDate) FROM ImportBatch
        WHERE ProductTypeID = @ProductTypeID;

		-- Check the constrain if this latest batch date does exist
        IF @LatestBatchDate IS NOT NULL
        BEGIN
            IF DATEDIFF(DAY, @LatestBatchDate, @BatchDate) > 7
            BEGIN
                RAISERROR('Đợt nhập hàng của cùng một loại sản phẩm không thể cách quá 7 ngày so với đợt nhập trước đó.', 16, 1);
                ROLLBACK;
                RETURN;
            END
        END

        FETCH NEXT FROM BatchCursor INTO @ProductTypeID, @BatchDate;
    END

    CLOSE BatchCursor;
    DEALLOCATE BatchCursor;
END