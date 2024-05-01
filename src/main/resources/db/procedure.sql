/*select * from branch
select * 
from employee
select * 
from manager

*/
-- thủ tục thêm nhân viên mới 
create proc insertemp 
	@manv INT ,
	@ho NVARCHAR(10) ,
	@tenlot NVARCHAR(20),
	@ten NVARCHAR(10) ,
	@cccd VARCHAR(12) ,
	@sdt VARCHAR(10) ,
	@email NVARCHAR(320) ,
	@luongnv DECIMAL(6, 3) ,
	@nguoigiamsat INT,
	@machinhanh INT
 as 
begin
	declare @luongql decimal(6,3); 
	select @luongql = salary from employee e join manager m on e.employeeID = m.employeeID
	where @machinhanh = m.branchID; 
	if exists (select * from employee where @cccd = CCCD or @manv = employeeID) -- kiểm tra nv đã tồn tại chưa
	begin 
		raiserror('Nhân viên đã tồn tại',16,1 ) ;
	end
	if not exists ( select * from Branch where branchID = @machinhanh) -- kiểm tra chi nhánh tồn tại chưa 
	begin 
		raiserror('Chi nhánh không tồn tại',16,1); 
	end
	if( len(@cccd) <>12)    -- kiểm tra cccd có đủ 12 ký tự không 
	begin 
		raiserror('Căn cước công dân không hợp lệ',16,1); 
	end
	if (@sdt not like '0%')  -- kiểm tra sdt có bắt đầu bằng 0 
	begin 
		raiserror('Số điện thoại không họp lệ',16,1); 
	end
	if(@luongnv >= @luongql)  -- kiểm tra lương nhân viên có ít hơn lương quản lí không 
	begin 
		raiserror('Lương nhân viên phải thấp hơn lương quản lí', 16,1);
	end
 INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES (@manv,@ho,@tenlot, @ten, @cccd,@sdt,@email,@luongnv,@nguoigiamsat,@machinhanh);
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

delete from employee where employeeid =120

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

