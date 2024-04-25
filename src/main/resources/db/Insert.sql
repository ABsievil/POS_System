USE POS
GO

-- Insert VALUES 

-- Insert Branch
INSERT INTO Branch VALUES (1,N'123 Lý Thường Kiệt, Q.10, TP.HCM'); 
INSERT INTO Branch VALUES (2,N'218 Phạm Văn Hai, Q.Tân Bình, TP.HCM'); 
INSERT INTO Branch VALUES (3,N'108 Trương Vĩnh Ký, Q.Tân Phú, TP.HCM'); 
INSERT INTO Branch VALUES (4,N'210 Huỳnh Mẫn Đạt, Q.5, TP.HCM');
INSERT INTO Branch VALUES (5,N'300 Quảng Trường Sáng Tạo ,TP.Dĩ An, Bình Dương'); 

-- Insert Employee 
INSERT INTO Employee VALUES (7, N'Đoàn', N'Gia', N'Hân', '079305028888', '0353215330', 'dhan@gmail.com', 15, null, 1);
INSERT INTO Employee VALUES (18, N'Nguyễn', N'Hồng', N'Nhung', '083192000999', '085659575', 'hongnhung@gmail.com',9, null, 1);
INSERT INTO Employee VALUES (26, N'Nguyễn', N'Thuỷ', N'Tiên', '060304666345', '0348212343', 'thutien212@gmail.com',5, null, 1);
INSERT INTO Employee VALUES (33, N'Vũ', N'Thị', N'Hương', '068303054467', '0367616768', 'vuhuong@gmail.com',7, 7, 1);
INSERT INTO Employee VALUES (41, N'Nguyễn', N'Đại', N'Phi', '068099658237', '0348621694', 'nguyenphi@gmail.com',6, 26, 1);
INSERT INTO Employee VALUES (12, N'Lê', N'Triệu', N'Vỹ', '096301335762', '0863387177', 'trieuvy@gmail.com',5, 7, 1);
INSERT INTO Employee VALUES (29, N'Hà', N'Văn', N'Huy', '070204582469', '0986783445', 'hahuy@gmail.com',9, 7, 1);
INSERT INTO Employee VALUES (37, N'Nguyễn', N'Thị', N'Oanh', '027305744281', '0356613385', 'oanhoanh@gmail.com',7, 26, 1)
INSERT INTO Employee VALUES (48, N'Nguyễn', N'Diễm', N'Kiều', '082193517880', '0862245589', 'diemkieu@gmail.com',10, 18, 1)
INSERT INTO Employee VALUES (11, N'Nguyễn', N'Văn', N'Thịnh', '079204674889', '0836388279', 'thinhnguyen@gmail.com',10, 7, 1)
INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES 
    (3, N'Trần', N'Thị', N'Bình', '100000000001', '0835376177', 'binhthi@gmail.com', 12.5, null, 2),
    (38, N'Lê', N'Thị', N'Thu', '100000000002', '0835376178', 'thule@gmail.com', 11.75, 3, 2),
    (44, N'Phạm', N'Văn', N'Cường', '100000000003', '0835376179', 'cuongvan@gmail.com', 10.5, 3, 2),
    (10, N'Hoàng', N'Thị', N'Mỹ', '100000000004', '0835376180', 'mythi@gmail.com', 11.5, 44, 2),
    (27, N'Võ', N'Văn', N'Hiếu', '100000000005', '0835376181', 'hieuvan@gmail.com', 12.500, 44, 2),
    (36, N'Đặng', N'Thị', N'Hương', '100000000006', '0835376182', 'huongthi@gmail.com', 10.500, 10, 2),
    (15, N'Ngô', N'Văn', N'Tài', '100000000007', '0835376183', 'taivan@gmail.com', 11, 27, 2),
    (47, N'Mai', N'Thị', N'Hoa', '100000000008', '0835376184', 'hoathi@gmail.com', 10, 44, 2),
    (21, N'Đỗ', N'Văn', N'Tuấn', '100000000009', '0835376185', 'tuandv@gmail.com', 10.5, 44, 2),
	(25, N'Nguyễn', N'Văn', N'An', '100000000000', '0835376176', 'vanan@gmail.com', 10, null, 2);
INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES 
    (39, N'Phan', N'Thị', N'Lan', '100000000011', '0835376187', 'lanpt@gmail.com', 10.5, null, 3),
    (6, N'Vũ', N'Văn', N'Minh', '100000000012', '0835376188', 'minhvv@gmail.com', 8.75, null, 3),
    (42, N'Bùi', N'Thị', N'Nga', '100000000013', '0835376189', 'ngabt@gmail.com', 8.25, null, 3),
    (22, N'Hà', N'Văn', N'Tiến', '100000000014', '0835376190', 'tienhv@gmail.com', 11.5, null, 3),
    (31, N'Nguyễn', N'Văn', N'Hiếu', '100000000015', '0835376191', 'hieunv@gmail.com', 12.5, null, 3),
    (16, N'Lê', N'Thị', N'Nhung', '100000000016', '0835376192', 'nhunglt@gmail.com', 10.5, null, 3),
    (45, N'Đoàn', N'Văn', N'Nam', '100000000017', '0835376193', 'namdv@gmail.com', 11, null, 3),
    (2, N'Mai', N'Thị', N'Linh', '100000000018', '0835376194', 'linhmt@gmail.com', 10, null, 3),
    (19, N'Hồ', N'Văn', N'Hùng', '100000000019', '0835376195', 'hungvh@gmail.com', 10.5, null, 3),
	(13, N'Trương', N'Văn', N'Hoa', '100000000010', '0835376186', 'hoatv@gmail.com', 10, null, 3);
INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES 
    (28, N'Nguyễn', N'Thị', N'Mai', '100000000025', '0835376201', 'maint@gmail.com', 15, null, 4),
    (5, N'Trần', N'Văn', N'Hai', '100000000026', '0835376202', 'haitv@gmail.com', 7.5, 28, 4),
    (46, N'Hoàng', N'Thị', N'Nhung', '100000000027', '0835376203', 'nhunght@gmail.com', 10.75, 5, 4),
    (30, N'Phạm', N'Văn', N'Nam', '100000000028', '0835376204', 'namvp@gmail.com', 10.5, null, 4),
    (35, N'Lê', N'Thị', N'Lan', '100000000029', '0835376205', 'lanlt@gmail.com', 11.5, null, 4),
    (8, N'Nguyễn', N'Văn', N'Tiến', '100000000030', '0835376206', 'tiennv@gmail.com', 9.5, 30, 4),
    (17, N'Trần', N'Thị', N'Hoa', '100000000031', '0835376207', 'hoatt@gmail.com', 9.5, null, 4),
    (34, N'Phan', N'Văn', N'Quang', '100000000032', '0835376208', 'quangpv@gmail.com', 5, 8, 4),
    (24, N'Đỗ', N'Thị', N'Thu', '100000000033', '0835376209', 'thudt@gmail.com', 7.3, 8, 4),
    (9, N'Võ', N'Văn', N'Tuấn', '100000000034', '0835376210', 'tuandv@gmail.com', 8.7, 8, 4);
INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES 
    (1, N'Nguyễn', N'Thị', N'Trang', '100000000035', '0835376211', 'trangnt@gmail.com', 10, null, 5),
    (32, N'Trần', N'Văn', N'Long', '100000000036', '0835376212', 'longtv@gmail.com', 8, 1, 5),
    (14, N'Lê', N'Thị', N'Nhung', '100000000037', '0835376213', 'nhunglt@gmail.com', 8, null, 5),
    (49, N'Pham', N'Văn', N'Hai', '100000000038', '0835376214', 'haivp@gmail.com', 10.5, 14, 5),
    (43, N'Võ', N'Thị', N'Linh', '100000000039', '0835376215', 'linhvt@gmail.com', 6, 14, 5),
    (20, N'Hoàng', N'Văn', N'Quân', '100000000040', '0835376216', 'quanvh@gmail.com', 12.5, 1, 5),
    (50, N'Nguyễn', N'Văn', N'Tiến', '100000000041', '0835376217', 'tiennv@gmail.com', 10.5, 49, 5),
    (4, N'Trần', N'Thị', N'Hoa', '100000000042', '0835376218', 'hoatt@gmail.com', 6, 20, 5),
    (23, N'Lê', N'Văn', N'Hùng', '100000000043', '0835376219', 'hunglv@gmail.com', 10, 43, 5),
    (40, N'Phan', N'Thị', N'Mai', '100000000044', '0835376220', 'maipt@gmail.com', 10.7, null, 5);

-- Insert Cashier 
INSERT INTO Cashier (EmployeeID, TypingSpeed) VALUES (41,2.5),(27,5.0),(31,3.5),(35,4.0),(43,2.5); 

-- Insert Manager
INSERT INTO Manager (EmployeeID, Degree, BranchID, ManageStartDate) VALUES (7, N'Cử nhân Quản trị kinh doanh', 1,'20240423'),(3, N'Cử nhân Quản trị kinh doanh', 2,'20240423'), (28, N'Cử nhân Quản trị kinh doanh', 3,'20240423'), (39, N'Cử nhân Quản trị kinh doanh', 4,'20240423'),(1,N'Cử nhân Quản trị kinh doanh', 5,'20240423');  

Delete Shift

-- Insert Shift
CREATE PROCEDURE Insert_Shift AS
BEGIN
	DECLARE @EmployeeID INT = 1
	WHILE @EmployeeID <= 50
		BEGIN 
			INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, @EmployeeID % 3 + 1, '2')
			INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 1) % 3 + 1, '3')
			INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, @EmployeeID % 3 + 1, '4')
			INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 2) % 3 + 1, '5')
			INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 1) % 3 + 1, '6')
			INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 1) % 3 + 1, '7')
			SET @EmployeeID = @EmployeeID + 1;
		END
END
EXEC Insert_Shift
DROP PROCEDURE Insert_Shift

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
end 

Create trigger CheckshiftMin 
on shift 
for delete 
As 
begin 
	select @manv = EmployeeID 
	from deleted  
	select @sumofshift = count(employeeID)
	from shift 
	where @manv= employeeID 
	if @sumofshift < 4 
		begin 
		raiserror ('Nhan vien lam viec khong du so ca qui dinh',16,2); 
		end 
end

-- Insert Branchschedules 
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (1, N'Thứ 2 đến Chủ nhật','07:00:00', '10:30:00');  
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (2,N'Thứ 2 đến Thứ 7','07:30:00', '10:30:00');  
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (3, N'Thứ 2 đến Chủ nhật','08:00:00', '11:30:00');  
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (4,N'Thứ 2 đến Thứ 7','07:00:00', '10:30:00');  
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (5,N'Thứ 2 đến Chủ nhật','09:00:00', '12:00:00');  

-- Insert Bill
INSERT INTO Bill (BillID, OrderDate, CashierID) VALUES
	(1, '2023-12-12 09:00:00', 27),
    (2, '2023-12-22 09:30:00', 43),
    (3, '2023-12-22 10:00:00', 43),
    (4, '2024-01-11 10:30:00', 31),
    (5, '2024-02-02 11:00:00', 35);

-- Insert Supplier
INSERT INTO Supplier (SupplierID, SupplierName, Email, ZipCode, PhoneNo)
VALUES
    (1, N'Công ty Sữa Vinamilk', 'vinamilk@example.com', '12345', '123-456-7890'),
    (2, N'Công ty nước giải khát CocaCola', 'coke@example.com', '23456', '234-567-8901'),
    (3, N'Công ty Dầu ăn Tường An', 'dichvukhachhang@tuongan.com.vn', '34567', '345-678-9012'),
    (4, N'Công ty Thương mại Toàn cầu', ' info@toancaugroup.com.vn ', '45678', '456-789-0123');

-- Insert ProductType
INSERT INTO ProductType (ProductTypeID, ProductTypeName, SupplierID, StockQuantity, SalePrice)
VALUES
	('VNM001', N'Sữa chua uống Probi có đường', 1, 90, 49.500),
	('VNM002', N'Sữa chua uống Vinamilk vị dâu', 1, 80, 29.500),
	('CC001', N'Coca Cola', 1, 50, 20.752),
	('CC002', N'Sprite', 1, 80, 18.752),
	('TA001', N'Dầu ăn Tường An', 2, 50, 120.500),
	('TA002', N'Nước mắm cá cơm Tường An', 2, 100, 85.200),
	('TC001', N'Chất phục hồi sáng bóng gỗ Howard Restor-A-Shine', 3, 100, 429.000);

-- Insert ProductLot
INSERT INTO ProductLot (ProductLotID, ProductTypeID, QuantityInLot, ExpireDate)
VALUES
	(1, 'VNM001', 10, '20241231'),
	(2, 'VNM001', 10, '20241231'),
	(3, 'VNM001', 10, '20241231'),
	(4, 'VNM001', 10, '20241231'),
	(5, 'VNM001', 10, '20241231'),
	(6, 'VNM001', 10, '20241231'),
	(7, 'VNM001', 10, '20241231'),
	(8, 'VNM001', 10, '20241231'),
	(9, 'VNM001', 10, '20241231'),

	(1, 'VNM002', 10, '20241231'),
	(2, 'VNM002', 10, '20241231'),
	(3, 'VNM002', 10, '20241231'),
	(4, 'VNM002', 10, '20241231'),
	(5, 'VNM002', 10, '20241231'),
	(6, 'VNM002', 10, '20241231'),
	(7, 'VNM002', 10, '20241231'),
	(8, 'VNM002', 10, '20241231'),

	(1, 'CC001', 10, '20241231'),
	(2, 'CC001', 10, '20241231'),
	(3, 'CC001', 10, '20241231'),
	(4, 'CC001', 10, '20241231'),
	(5, 'CC001', 10, '20241231'),

	(1, 'CC002', 20, '20241231'),
	(2, 'CC002', 20, '20241231'),
	(3, 'CC002', 20, '20241231'),
	(4, 'CC002', 20, '20241231'),

	(1, 'TA001', 25, '20241231'),
	(2, 'TA001', 25, '20241231'),

	(1, 'TA002', 25, '20241231'),
	(2, 'TA002', 25, '20241231'),
	(3, 'TA002', 25, '20241231'),
	(4, 'TA002', 25, '20241231'),

	(1, 'TC001', 25, '20241231'),
	(2, 'TC001', 25, '20241231'),
	(3, 'TC001', 25, '20241231'),
	(4, 'TC001', 25, '20241231');

--Insert Bill_ProductLot

INSERT INTO Bill_ProductLot(BillID, ProductLotID, ProductTypeID, QuantityInBill, SalePrice)
VALUES
	(1, 1, 'VNM001', 10, 20.752),
	(1, 1, 'VNM002', 10, 159.250),
	(3, 2, '29413', 2, 20.000);
	(4, 2, '29413', 2, 20.000);
	(5, 2, '29413', 2, 20.000);

--Insert ImportProduct
INSERT INTO ImportProduct (ProductTypeID, BranchID)
VALUES
	('VNM001', 1),
	('VNM001', 2),
	('VNM001', 3),
	('VNM001', 4),
	('VNM001', 5),

	('VNM002', 1),
	('VNM002', 2),
	('VNM002', 3),
	('VNM002', 4),
	('VNM002', 5),

	('CC001', 1),
	('CC001', 2),

	('CC002', 3),
	('CC002', 5),

	('TA001', 4),

	('TA002', 2),
	('TA002', 4),
	('TA002', 5),
	
	('TC001', 1),
	('TC001', 5);
	
--Insert ImportBatch
INSERT INTO ImportBatch (ProductTypeID, BranchID, ProductQuantity, BatchDate)
VALUES
	('VNM001', 1, 10, '20240424'),
	('VNM001', 2, 20, '20240424'),
	('VNM001', 3, 20, '20240424'),
	('VNM001', 4, 20, '20240424'),
	('VNM001', 5, 20, '20240424'),
	

	('VNM002', 1, 20, '20240424'),
	('VNM002', 2, 10, '20240424'),
	('VNM002', 3, 20, '20240424'),
	('VNM002', 4, 10, '20240424'),
	('VNM002', 5, 20, '20240424'),

	('CC001', 1, 20, '20240424'),
	('CC001', 2, 30, '20240424'),

	('CC002', 3, 40, '20240424'),
	('CC002', 5, 40, '20240424'),

	('TA001', 4, 50, '20240424'),

	('TA002', 2, 25, '20240424'),
	('TA002', 4, 25, '20240424'),
	('TA002', 5, 50, '20240424'),

	('TC001', 1, 50, '20240424'),
	('TC001', 5, 50, '20240424');

--Insert Discount
INSERT INTO Discount (ProductTypeID, DiscountID, DiscountDate, Discount)
VALUES 
	('VNM001', 1, '20240424', 10),
	('VNM001', 2, '20240424', 5),
	('VNM002', 1, '20240424', 20),
	('VNM002', 2, '20240424', 5);


