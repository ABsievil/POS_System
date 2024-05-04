/*select * from branch
select * 
from employee
select * 
from manager

*/
-- thủ tục thêm nhân viên mới 
create proc insertemp 
	@EmployeeID INT ,
	@LastName NVARCHAR(10) ,
	@MiddleName NVARCHAR(20),
	@FirstName NVARCHAR(10) ,
	@CCCD VARCHAR(13) ,
	@PhoneNo VARCHAR(10) ,
	@Email NVARCHAR(320) ,
	@Salary DECIMAL(6, 3) ,
	@SupervisorID INT,
	@BranchID INT
 as 
begin
	declare @luongql decimal(6,3); 
	select @luongql = salary from employee e join manager m on e.employeeID = m.employeeID
	where @BranchID = m.branchID; 
	if exists (select * from employee where @CCCD = CCCD or @EmployeeID = employeeID) 
	begin 
		raiserror('Nhân viên đã tồn tại',16,1 ) ;
	end
	if not exists ( select * from Branch where branchID = @BranchID) 
	begin 
		raiserror('Chi nhánh không tồn tại',16,1); 
	end
	if( len(@CCCD) != 12) 
	begin 
		raiserror('Căn cước công dân không hợp lệ',16,1); 
	end
	if (@PhoneNo not like '0%') 
	begin 
		raiserror('Số điện thoại không họp lệ',16,1); 
	end
	if(@Salary >= @luongql) 
	begin 
		raiserror('Lương nhân viên phải thấp hơn lương quản lí', 16,1);
	end
 INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES (@EmployeeID,@LastName,@MiddleName, @FirstName, @CCCD,@PhoneNo,@Email,@Salary,@SupervisorID,@BranchID);
end;

drop proc insertemp
-- kiểm tra hợp lệ khi thêm nhân viên 
begin try 
	exec insertemp  120, 'Trương', 'Gia', 'Hân','079305102880', '353215330', 'dhan@gmail.com', 10, null, 10
	print('Nhập thông tin thành công'); 
	end try 
begin catch 
	select 
	ERROR_MESSAGE() as Message,
	ERROR_LINE() as Line,
	ERROR_NUMBER() as Number, 
	ERROR_SEVERITY() as Severity, 
	ERROR_STATE() as State, 
	Error_procedure() as ErrorProcedure
end catch; 

-- thu tuc xoa nhan vien
create proc deleteemployee 
@manv int
as 
begin 
	if not exists (select * from employee where employeeid = @manv)
	begin 
		raiserror ('Nhan vien khong ton tai',16,1); 
		return;
	end
	delete from employee where employeeid = @manv; 
end;

drop proc deleteemployee

begin try 
	exec deleteemployee 190
	print ('Xoa nhan vien thanh cong')
end try 
begin catch 
	select 
	ERROR_LINE() as Line, 
	ERROR_MESSAGE() as Message, 
	ERROR_PROCEDURE() as ErrorProcedure
end catch

select * 
from employee 

--thu tuc update luong nhan vien
create proc updatesalary
@manv int, 
@luongnv decimal(6,3)
as 
begin 
	declare @machinhanh int; 
	select @machinhanh = branchID from employee where employeeID = @manv; 
	declare @maql int; 
	select @maql = EmployeeID from manager where BranchID=@machinhanh; 
	declare @luongql decimal(6,3); 
	select @luongql = salary from employee where EmployeeID = @maql; 
	if not exists (select * from employee where employeeid = @manv)
	begin 
		raiserror ('Nhan vien khong ton tai',16,1); 
		return;
	end	
	if ( @maql != @manv and @luongnv >= @luongql) 
	begin 
		raiserror('Luong nhan vien phai thap hon luong quan li cua ho',16,1); 
		return;
	end 
	update employee set salary = @luongnv where EmployeeID = @manv 
end; 

drop proc updatesalary

begin try 
	exec updatesalary 7, 18
	print('Cap nhat luong thanh cong')
end try 
begin catch 
	select 
	ERROR_LINE() as Line, 
	ERROR_MESSAGE() as Message, 
	ERROR_PROCEDURE() as ErrorProcedure
end catch; 


-- thủ tục xóa chi nhánh và kiểm tra hợp lệ 
create proc deletebranch 
 @machinhanh INT 
as 
begin 
	delete from branch where branchid = @machinhanh
end

begin try 
	exec deletebranch 1 
	print('Xóa dữ liệu thành công'); 
end try 
begin catch 
	select 
	ERROR_LINE() as Line, 
	ERROR_MESSAGE() as Message, 
	ERROR_PROCEDURE() as ErrorProcedure
end catch

--thủ tục thay đổi giờ làm và kiểm tra hợp lệ 
create proc updateshifttime
@manv  INT,
@giolam INT,
@ngaylam VARCHAR(2),
@giolammoi INT
as 
begin 
	if not exists( select * from employee where @manv = EmployeeID) 
	begin 
		raiserror('Nhân viên không tồn tại',16,1); 
	end 
	if not exists (select * from shift where @giolam = shifttime and @ngaylam = shiftday) 
	begin
		raiserror ('Ca làm không tồn tại',16,1);
	end 
	update shift set shifttime = @giolammoi 
	where @manv =employeeId and @giolam = shifttime and @ngaylam =shiftday;
end; 


begin try 
	exec updateshifttime 1,2,'8',2
	print('Đổi ca làm thành công'); 
end try
begin catch 
	select 
	ERROR_MESSAGE() as Message,
	ERROR_LINE() as Line,
	ERROR_NUMBER() as Number, 
	ERROR_SEVERITY() as Severity, 
	ERROR_STATE() as State, 
	Error_procedure() as ErrorProcedure
end catch; 

select * from shift where employeeid =1 

