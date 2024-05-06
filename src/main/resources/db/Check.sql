-- Constraint on employee's salary
ALTER TABLE Employee
ADD CONSTRAINT CHK_SalaryRange CHECK (Salary >= 5);


-- Constraint on available shift's time
ALTER TABLE [Shift]
ADD CONSTRAINT CHK_ShiftTimeRange CHECK (ShiftTime IN (1, 2, 3));

-- Constraint on Discount's discount rate (in %)
ALTER TABLE Discount
ADD CONSTRAINT CHK_DiscountRange CHECK (Discount >= 5 AND Discount <= 90);

-- Constraint on the number of each product type in a batch
ALTER TABLE ImportBatch
ADD CONSTRAINT CHK_BatchQuantityRange CHECK (ProductQuantity > 0 AND ProductQuantity <= 3000);