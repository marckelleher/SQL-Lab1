

USE FiredUp    -- ensures correct database is active

GO
PRINT 'CIS2275, Lab1, question 1, ten points possible.
Project everything (all columns and all rows) from the SUPPLIERS table.' + CHAR(10)
-- Your SELECT will have a list of column names each separated with a comma (,).
-- Each projection item goes on a separate line. Do not format output nor use aliases.
-- Your FROM will name the table and end with a semi-colon (;)
GO

SELECT	SupplierNbr, 
		Name, 
		SalesRep, 
		RepPhoneNumber, 
		CSPhoneNumber, 
		Address, 
		City, 
		State
FROM	SUPPLIER;

GO
PRINT 'CIS275, Lab1, question 2, ten points possible.
Project everything (all columns and all rows) from the STOVE table.' + CHAR(10);
-- Your SELECT will have a list of column names each separated with a comma (,).
-- Each projection item goes on a separate line. Do not format output nor use aliases.
-- Your FROM will name the table and end with a semi-colon (;).
GO

SELECT	SerialNumber, 
		Type, 
		Version, 
		DateOfManufacture, 
		Color, 
		FK_EmpId
FROM	STOVE;

GO
PRINT REPLICATE('=',80) + CHAR(10) +
'From now on every query will have formatted projection items with aliases
and end with a semi-colon. Table names are uppercase.
Formats to use are the following:
CAST(column_name AS CHAR(#)) for character data where # is field length
STR(column_name, precision, scale) for numbers 
    where precision is field length and includes the decimal point 
    and scale is the number of decimal places (always use 2 for money)
CONVERT(CHAR(12), column_name, #) for dates where # is 1 or 101' + 
CHAR(10) +REPLICATE('=',80) + CHAR(10);
GO
PRINT 'CIS275, Lab1, question 3, ten points possible.
Display everything from the PURCHASE_ORDER table.' + CHAR(10);
GO

SELECT		STR(PONbr,18,0) AS 'PO Number',
			CONVERT(CHAR(12), OrderDt, 1) AS 'Order Date',
			CAST(Terms AS CHAR(15)) AS 'Terms',
			STR(FK_SupplierNbr,18,0) AS 'FK Supplier Number'
FROM		PURCHASE_ORDER;

GO
PRINT 'CIS275, Lab1, question 4, ten points possible.
You have been asked to supply a list of all employees names
and their ID numbers. Do so.' + CHAR(10);
GO

SELECT		CAST(Name AS CHAR(50)) AS 'Employee Name',
			STR(EmpID,18,0) AS 'Employee ID'
FROM		EMPLOYEE;

GO
PRINT 'CIS275, Lab1, question 5, ten points possible.
Show the FK_PartNbr, Quantity, ExtendedPrice and (ExtendedPrice * 1.07) from the
REPAIR_LINE_ITEM table. Limit output to rows have a quantity greater than one.' + CHAR(10);
GO

SELECT		STR(FK_PartNbr,4,0) AS 'FK Part Number',
			STR(Quantity,4,0) AS 'Quantity',
			STR(ExtendedPrice,8,2) AS 'Extended Price',
			STR((ExtendedPrice * 1.07),8,2) AS 'Calculated End Price'
FROM		REPAIR_LINE_ITEM
WHERE		Quantity > 1;

GO
PRINT 'CIS2275, Lab1, question 6, ten points possible.
What INVOICEs have TotalPrice of more than $200? 
Show InvoiceNbr, InvoiceDt, and TotalPrice.' + CHAR(10)
GO

SELECT		STR(InvoiceNbr,18,0) AS 'Invoice Number',
			CONVERT(CHAR(12), InvoiceDt, 1) AS 'Invoice Date',
			STR(TotalPrice,18,2) AS 'Total Price'
FROM		INVOICE
WHERE		TotalPrice > 200;

GO
PRINT 'CIS275, Lab1, question 7, ten points possible.
What INVOICEs have TotalPrice of BETWEEN $1 AND $50? 
Show InvoiceNbr, InvoiceDt, and TotalPrice.' + CHAR(10);
GO

SELECT		STR(InvoiceNbr,18,0) AS 'Invoice Number',
			CONVERT(CHAR(12), InvoiceDt, 1) AS 'Invoice Date',
			STR(TotalPrice,18,2) AS 'Total Price'
FROM		INVOICE
WHERE		TotalPrice BETWEEN 1 AND 50;

GO
PRINT 'CIS275, Lab1, question 8, ten points possible.
Display FK_InvoiceNbr, LineNbr, FK_StoveNbr from the INV_LINE_ITEM table.
Eliminate non-stove rows: WHERE FK_PartNbr IS NULL.' + CHAR(10);
GO

SELECT		STR(FK_InvoiceNbr,18,0) AS 'Invoice Number',
			STR(LineNbr,18,0) AS 'Line Number',
			STR(FK_StoveNbr,18,0) AS 'Stove Number'
FROM		INV_LINE_ITEM
WHERE		FK_PartNbr IS NULL;

GO
PRINT 'CIS275, Lab1, question 9, ten points possible.
Show all columns of PURCHASE_ORDER table 
WHERE FK_SupplierNbr IN (801, 803, 805, 807).' + CHAR(10);
GO

SELECT		STR(PONbr,18,0) AS 'PO Number',
			CONVERT(CHAR(12), OrderDt, 1) AS 'Order Date',
			CAST(Terms AS CHAR(15)) AS 'Terms',
			STR(FK_SupplierNbr,18,0) AS 'Supplier Number'
FROM		PURCHASE_ORDER
WHERE		FK_SupplierNbr IN (801, 803, 805, 807);

GO
PRINT 'CIS275, Lab1, question 10, ten points possible.
Show all columns of PURCHASE_ORDER table 
WHERE FK_SupplierNbr NOT IN (801, 803, 805, 807).' + CHAR(10);

SELECT		STR(PONbr,18,0) AS 'PO Number',
			CONVERT(CHAR(12), OrderDt, 1) AS 'Order Date',
			CAST(Terms AS CHAR(15)) AS 'Terms',
			STR(FK_SupplierNbr,18,0) AS 'Supplier Number'
FROM		PURCHASE_ORDER
WHERE		FK_SupplierNbr NOT IN (801, 803, 805, 807);

GO
-------------------------------------------------------------------------------------
-- This is an anonymous program block. DO NOT CHANGE OR DELETE.
-------------------------------------------------------------------------------------
BEGIN
    PRINT '|---' + REPLICATE('+----',15) + '|';
    PRINT ' End of CIS275 Lab1' + REPLICATE(' ',50) + CONVERT(CHAR(12),GETDATE(),101);
    PRINT '|---' + REPLICATE('+----',15) + '|';
END;


