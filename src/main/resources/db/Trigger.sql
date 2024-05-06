-- kiểm tra số ca làm tối đa 
Create Trigger CheckShift
On Shift 
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
-- kiểm tra số ca làmm tối thiếu của nhân viên 
Create trigger CheckshiftMin 
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
-- tự động cập nhật số lượng hàng tồn sau mỗi lần xuất hóa đơn 
create trigger Soluongton 
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

drop trigger soluongton
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
