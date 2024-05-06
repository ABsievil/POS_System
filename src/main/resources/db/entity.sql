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