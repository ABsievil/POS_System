﻿--Câu số 1
/*
Yêu cầu: 2 bảng trở lên, có where, order by. Tham số đầu vào sẽ nằm trong mệnh đề where or having.
Mô tả: Hiển thị thông tin Họ và tên, Số điện thoại, Lương, ID chi nhánh của nhân viên có lương lớn hơn hoặc bằng
		7 triệu làm việc tại chi nhánh có Địa chỉ là biến đầu vào của thủ tục, và kết quả trả về được sắp xếp theo
		chiều tăng dần của lương. Nếu địa chỉ không hợp lệ, trả về "Không tìm thấy chi nhánh có địa chỉ : biến đầu
		vào". Nếu không có nhân viên nào ở chi nhánh đó thỏa mãn điều kiện thì trả về "Không tìm thấy nhân viên nào thỏa mãn".
*/
CREATE PROCEDURE FindEmployee
	@BranchID		int
AS
BEGIN 
	IF NOT EXISTS (SELECT * FROM Branch WHERE @BranchID = BranchID)
		BEGIN
			PRINT N'Không tìm thấy chi nhánh có ID : ' + @BranchID;
			RETURN;
		END
	ELSE IF NOT EXISTS (SELECT * FROM Employee WHERE Salary >= 7)
		BEGIN 
			PRINT N'Không tìm thấy nhân viên nào thỏa mãn';
			RETURN;
		END
	ELSE 
		BEGIN
			SELECT LastName + ' ' + MiddleName + ' ' + FirstName AS Name, PhoneNo, Salary
			FROM Employee, Branch
			WHERE @BranchID = Branch.BranchID AND Salary >= 7 AND Employee.BranchID = Branch.BranchID
			ORDER BY Salary ASC;
		END
END

EXEC dbo.FindEmployee
	@BranchID = 1;
DROP PROCEDURE FindEmployee


--Câu số 2
/*
Yêu cầu: 2 bảng trở lên, có hàm(MIN, MAX, SUM, AVG,...), group by, having, order by, where. Tham số đầu vào sẽ nằm trong mệnh đề where or having.
Mô tả: Hiển thị thông tin: ID chi nhánh, Ngày nhập, Tên loại sản phẩm, Tổng số lượng, Tổng tiền nhập của các đợt 
		nhập sản phẩm từ nhà cung cấp với tên là tham số đầu vào. Ngoài ra, ta còn có một tham số đầu vào khác là
		số tiền tối đa để kiểm tra đợt nhập ở mỗi chi nhánh có số tiền vượt quá cho phép. Sắp xếp theo chiều tăng dần của ID 
		chi nhánh kết quả trả về.
*/

CREATE PROCEDURE ImportProductBatch
	@SupplierName		nvarchar(100),
	@MaxMoney			decimal(10, 3)
AS
BEGIN 
	IF NOT EXISTS (SELECT * FROM Supplier WHERE @SupplierName = SupplierName)
		BEGIN
			PRINT N'Không tìm thấy nhà cung cấp : ' + @SupplierName;
			RETURN;
		END
	ELSE 
		BEGIN
			SELECT B.BranchID, I.BatchDate, P.ProductTypeName, SUM(I.ProductQuantity) AS TotalQuantity, SUM(I.ProductQuantity * P.SalePrice) AS Total
			FROM Branch AS B, ImportBatch AS I, ProductType AS P, Supplier AS S
			WHERE B.BranchID = I.BranchID AND I.ProductTypeID = P.ProductTypeID AND P.SupplierID = S.SupplierID AND SupplierName = @SupplierName
			GROUP BY B.BranchID, BatchDate, ProductTypeName, ProductQuantity, ProductQuantity * SalePrice, SupplierName
			HAVING SUM(I.ProductQuantity * P.SalePrice) > @MaxMoney 
			ORDER BY B.BranchID
		END
END

EXEC dbo.ImportProductBatch 
	@SupplierName = N'Công ty Sữa Vinamilk',
	@MaxMoney = 110.000;
DROP PROCEDURE ImportProductBatch





