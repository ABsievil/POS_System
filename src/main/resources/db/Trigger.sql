-- kiểm tra số ca làm tối đa 
Create Trigger CheckShiftMax  
On Shift 
after insert, update 
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
		raiserror('Nhan vien lam viec qua 8 ca mot tuan',16,2);
		rollback transaction 
	end 
	if @sumofshift <4 
	begin 
		raiserror('Nhan vien lam viec khong du so ca qui dinh',16,2); 
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
		raiserror ('Nhan vien lam viec khong du so ca qui dinh',16,2); 
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
 select @sluongban = QuantityInBill from inserted ;
 select @malo =  ProductLotID from inserted ;
 select @maloaisp = ProductTypeID from inserted ;
 update ProductLot 
 set QuantityinLot= quantityinlot - @sluongban
 where ProductLotID = @malo and ProductTypeID = @maloaisp ;
 update ProductType 
 set Stockquantity = stockquantity - @sluongban 
 where ProductTypeID = @maloaisp ;
end;

drop trigger soluongton
-- Kiem tra trigger 
delete from shift 
where EmployeeID = 2 and ShiftTime =3; 
insert into Shift values (1,2,6) 
insert into Bill  values (7,'2023-02-02 12:00:00',35);
INSERT INTO Bill_ProductLot (BillID, ProductLotID, ProductTypeID, QuantityInBill, SalePrice)
VALUES
	(7, 2, 'VNM001', 3, 49.500)
