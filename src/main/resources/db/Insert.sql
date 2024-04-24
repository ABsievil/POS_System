USE POS
GO

-- Insert VALUES 

-- Insert Branch
INSERT INTO Branch VALUES (1,'123 Ly Thuong Kiet, Q.10, TP.HCM'); 
INSERT INTO Branch VALUES (2,'218 Pham Van Hai, Q.TanBinh, TP.HCM'); 
INSERT INTO Branch VALUES (3,'108 Truong Vinh Ky, Q.TanPhu, TP.HCM'); 
INSERT INTO Branch VALUES (4,'210 Huynh Man Dat, Q.5, TP.HCM');
INSERT INTO Branch VALUES (5, '300 Quang Truong Sang Tao ,TP.Di An'); 

-- Insert Employee 
INSERT INTO Employee VALUES (1, 'Doan', 'Gia', 'Han', '079305028888', '0353215330', 'dhan@gmail.com', 15, null, 1);
INSERT INTO Employee VALUES (2, 'Nguyen', 'Hong', 'Nhung', '083192000999', '085659575', 'hongnhung@gmail.com',9, null, 1);
INSERT INTO Employee VALUES (3, 'Nguyen', 'Thu', 'Tien', '060304666345', '0348212343', 'thutien212@gmail.com',5, null, 1);
INSERT INTO Employee VALUES (4, 'Vu', 'Thi', 'Huong', '068303054467', '0367616768', 'vuhuong@gmail.com',7, 1, 1);
INSERT INTO Employee VALUES (5, 'Nguyen', 'Dai', 'Phi', '068099658237', '0348621694', 'nguyenphi@gmail.com',6, 2, 1);
INSERT INTO Employee VALUES (6, 'Le', 'Trieu', 'Vy', '096301335762', '0863387177', 'trieuvy@gmail.com',5, 1, 1);
INSERT INTO Employee VALUES (7, 'Ha', 'Van', 'Huy', '070204582469', '0986783445', 'hahuy@gmail.com',9, 1, 1);
INSERT INTO Employee VALUES (8, 'Nguyen', 'Thi', 'Oanh', '027305744281', '0356613385', 'oanhoanh@gmail.com',7, 2, 1)
INSERT INTO Employee VALUES (9, 'Nguyen', 'Diem', 'Kieu', '082193517880', '0862245589', 'diemkieu@gmail.com',10, 2, 1)
INSERT INTO Employee VALUES (10, 'Nguyen', 'Van', 'Thinh', '079204674889', '0836388279', 'thinhnguyen@gmail.com',10, 2, 1)
INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES 
    (11, 'Tran', 'Thi', 'Binh', '100000000001', '0835376177', 'binhthi@gmail.com', 12.5, 1, 2),
    (12, 'Le', 'Thi', 'Thu', '100000000002', '0835376178', 'thule@gmail.com', 11.75, 1, 2),
    (13, 'Pham', 'Van', 'Cuong', '100000000003', '0835376179', 'cuongvan@gmail.com', 10.5, 2, 2),
    (14, 'Hoang', 'Thi', 'My', '100000000004', '0835376180', 'mythi@gmail.com', 11.5, 3, 2),
    (15, 'Vo', 'Van', 'Hieu', '100000000005', '0835376181', 'hieuvan@gmail.com', 12.500, 2, 2),
    (16, 'Dang', 'Thi', 'Huong', '100000000006', '0835376182', 'huongthi@gmail.com', 10.500, 3, 2),
    (17, 'Ngo', 'Van', 'Tai', '100000000007', '0835376183', 'taivan@gmail.com', 11, 1, 2),
    (18, 'Mai', 'Thi', 'Hoa', '100000000008', '0835376184', 'hoathi@gmail.com', 10, 2, 2),
    (19, 'Do', 'Van', 'Tuan', '100000000009', '0835376185', 'tuandv@gmail.com', 10.5, 3, 2),
	(20, 'Nguyen', 'Van', 'An', '100000000000', '0835376176', 'vanan@gmail.com', 10, null, 2);
INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES 
    (21, 'Phan', 'Thi', 'Lan', '100000000011', '0835376187', 'lanpt@gmail.com', 10.5, null, 3),
    (22, 'Vu', 'Van', 'Minh', '100000000012', '0835376188', 'minhvv@gmail.com', 8.75, null, 3),
    (23, 'Bui', 'Thi', 'Nga', '100000000013', '0835376189', 'ngabt@gmail.com', 8.25, null, 3),
    (24, 'Ha', 'Van', 'Tien', '100000000014', '0835376190', 'tienhv@gmail.com', 11.5, null, 3),
    (25, 'Nguyen', 'Van', 'Hieu', '100000000015', '0835376191', 'hieunv@gmail.com', 12.5, null, 3),
    (26, 'Le', 'Thi', 'Nhung', '100000000016', '0835376192', 'nhunglt@gmail.com', 10.5, null, 3),
    (27, 'Doan', 'Van', 'Nam', '100000000017', '0835376193', 'namdv@gmail.com', 11, null, 3),
    (28, 'Mai', 'Thi', 'Linh', '100000000018', '0835376194', 'linhmt@gmail.com', 10, null, 3),
    (29, 'Ho', 'Van', 'Hung', '100000000019', '0835376195', 'hungvh@gmail.com', 10.5, null, 3),
	(30, 'Truong', 'Van', 'Hoa', '100000000010', '0835376186', 'hoatv@gmail.com', 10, null, 3);
INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES 
    (31, 'Nguyen', 'Thi', 'Mai', '100000000025', '0835376201', 'maint@gmail.com', 15, null, 4),
    (32, 'Tran', 'Van', 'Hai', '100000000026', '0835376202', 'haitv@gmail.com', 7.5, 31, 4),
    (33, 'Hoang', 'Thi', 'Nhung', '100000000027', '0835376203', 'nhunght@gmail.com', 10.75, 31, 4),
    (34, 'Pham', 'Van', 'Nam', '100000000028', '0835376204', 'namvp@gmail.com', 10.5, null, 4),
    (35, 'Le', 'Thi', 'Lan', '100000000029', '0835376205', 'lanlt@gmail.com', 11.5, null, 4),
    (36, 'Nguyen', 'Van', 'Tien', '100000000030', '0835376206', 'tiennv@gmail.com', 9.5, 33, 4),
    (37, 'Tran', 'Thi', 'Hoa', '100000000031', '0835376207', 'hoatt@gmail.com', 9.5, 33, 4),
    (38, 'Phan', 'Van', 'Quang', '100000000032', '0835376208', 'quangpv@gmail.com', 5, 34, 4),
    (39, 'Do', 'Thi', 'Thu', '100000000033', '0835376209', 'thudt@gmail.com', 7.3, 34, 4),
    (40, 'Vo', 'Van', 'Tuan', '100000000034', '0835376210', 'tuandv@gmail.com', 8.7, 35, 4);
INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES 
    (41, 'Nguyen', 'Thi', 'Trang', '100000000035', '0835376211', 'trangnt@gmail.com', 10, null, 5),
    (42, 'Tran', 'Van', 'Long', '100000000036', '0835376212', 'longtv@gmail.com', 8, 41, 5),
    (43, 'Le', 'Thi', 'Nhung', '100000000037', '0835376213', 'nhunglt@gmail.com', 8, 41, 5),
    (44, 'Pham', 'Van', 'Hai', '100000000038', '0835376214', 'haivp@gmail.com', 10.5, null, 5),
    (45, 'Vo', 'Thi', 'Linh', '100000000039', '0835376215', 'linhvt@gmail.com', 6, 42, 5),
    (46, 'Hoang', 'Van', 'Quan', '100000000040', '0835376216', 'quanvh@gmail.com', 12.5, null, 5),
    (47, 'Nguyen', 'Van', 'Tien', '100000000041', '0835376217', 'tiennv@gmail.com', 10.5, null, 5),
    (48, 'Tran', 'Thi', 'Hoa', '100000000042', '0835376218', 'hoatt@gmail.com', 6, 44, 5),
    (49, 'Le', 'Van', 'Hung', '100000000043', '0835376219', 'hunglv@gmail.com', 10, null, 5),
    (50, 'Phan', 'Thi', 'Mai', '100000000044', '0835376220', 'maipt@gmail.com', 10.7, null, 5);

-- Insert Cashier 
INSERT INTO Cashier (EmployeeID, TypingSpeed) VALUES (2,2.5),(11,5.0),(25,3.5),(38,4.0),(44,2.5); 

-- Insert Manager
INSERT INTO Manager (EmployeeID, Degree, BranchID, ManageStartDate) VALUES (1,'Bachelor of Business', 1,'20240423'),(11,'Bachelor of Business', 2,'20240423'), (25,'Bachelor of Business', 3,'20240423'), (31,'Bachelor of Business', 4,'20240423'),(50,'Bachelor of Business', 5,'20240423');  

-- Insert Shift
INSERT INTO Shift (EmployeeID, ShiftTime) VALUES (1,1),(2,1),(5,1),(6,1),(8,2),(9,2),(10,2),(3,3),(4,3),(7,3); 
INSERT INTO Shift (EmployeeID, ShiftTime) VALUES (15,1),(12,1),(11,1),(16,1),(18,2),(19,2),(12,2),(13,3),(14,3),(17,3),(15,3);  
INSERT INTO Shift (EmployeeID, ShiftTime) VALUES (21,1),(22,1),(25,1),(26,1),(28,2),(29,2),(27,2),(23,3),(24,3),(27,3); 
INSERT INTO Shift (EmployeeID, ShiftTime) VALUES (33,1),(32,1),(35,1),(36,1),(38,2),(39,2),(36,2),(31,3),(34,3),(37,3); 
INSERT INTO Shift (EmployeeID, ShiftTime) VALUES (44,1),(42,1),(45,1),(46,1),(48,2),(49,2),(41,2),(43,3),(44,3),(47,3); 

-- Insert Branchschedules 
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (1,'Monday to Sunday','07:00:00', '10:30:00');  
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (2,'Monday to Friday','07:30:00', '10:30:00');  
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (3,'Monday to Sunday','08:00:00', '11:30:00');  
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (4,'Monday to Saturday','07:00:00', '10:30:00');  
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (5,'Monday to Sunday','09:00:00', '12:00:00');  

-- Insert Bill
INSERT INTO Bill (BillID, OrderDate, CashierID) VALUES
	(1, '2023-12-12 09:00:00', 2),
    (2, '2023-12-22 09:30:00', 11),
    (3, '2023-12-22 10:00:00', 25),
    (4, '2024-01-11 10:30:00', 38),
    (5, '2024-02-02 11:00:00', 44),
    (6, '2024-02-05 11:30:00', 2),
    (7, '2024-02-22 12:00:00', 11),
    (8, '2024-02-25 12:30:00', 25),
    (9, '2024-03-12 13:00:00', 38),
    (10, '2024-03-13 13:30:00', 44),
    (11, '2024-03-14 14:00:00', 2),
    (12, '2024-04-22 14:30:00', 11),
    (13, '2024-04-22 15:00:00', 25),
    (14, '2024-04-22 15:30:00', 38),
    (15, '2024-04-22 16:00:00', 44),
    (16, '2024-04-22 16:30:00', 2),
    (17, '2024-04-22 17:00:00', 11),
    (18, '2024-04-22 17:30:00', 25),
    (19, '2024-04-22 18:00:00', 38),
    (20, '2024-04-22 18:30:00', 44);

-- Insert Supplier
DELETE FROM Supplier;
INSERT INTO Supplier (SupplierID, SupplierName, Email, ZipCode, PhoneNo)
VALUES
    (1, 'Công ty Sua Vinamilk', 'vinamilk@example.com', '12345', '123-456-7890'),
    (2, 'Công ty nuoc giai khat CocaCola', 'coke@example.com', '23456', '234-567-8901'),
    (3, 'Công ty Thương mại Toàn cầu', 'global@example.com', '34567', '345-678-9012'),
    (4, 'Công ty Bình Minh', 'sunrise@example.com', '45678', '456-789-0123'),
    (5, 'Công ty Ánh Trăng', 'moonlight@example.com', '56789', '567-890-1234');

-- Insert ProductType
INSERT INTO ProductType (ProductTypeID, ProductTypeName, CostPrice, SupplierID, StockQuantity, SalePrice)
VALUES
	('09431', 'Sữa chua uống Probi có đường', 229.540, 1, 5, 249.500),
	('85557', 'Sữa tươi thanh trùng nguyên chất Vinamilk Green Farm không đường', 508.939, 1, 5, 598.752),
	('34210', 'Coca Cola Fiber', 12.600, 2, 5, 15.200),
	('29413', 'Coca Cola Light', 12.600, 2, 5, 15.200),
	('50001', 'Chất phục hồi sáng bóng gỗ Howard Restor-A-Shine', 349.000, 3, 5, 429.000);

