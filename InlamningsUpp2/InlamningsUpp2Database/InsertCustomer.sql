create procedure InsertProduct(@ProductName nvarchar(40), @SupplierID int, @CategoryID int, @QuantityPerUnit nvarchar(20), @UnitPrice money, 
								@UnitsInStock smallint, @UnitsOnOrder smallint, @ReorderLevel smallint, @Discontinued bit)
as

	INSERT INTO [dbo].[Products]
			    ([ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued])
		 VALUES
				(@ProductName, @SupplierID, @CategoryID, @QuantityPerUnit, @UnitPrice, @UnitsInStock, @UnitsOnOrder, @ReorderLevel, @Discontinued)


--USE [NORTHWND]
--GO
--/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 2016-11-02 16:12:34 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--ALTER procedure [dbo].[InsertCustomer](@CustomerID nvarchar(5), @CompanyName nvarchar(40), @ContactName nvarchar(30), @ContactTitle nvarchar(30), 
--								@Address nvarchar(60), @City nvarchar(15), @Region nvarchar(15), @PostalCode nvarchar(10),
--								@Country nvarchar(15), @Phone nvarchar(24), @Fax nvarchar(24))
--as

--	INSERT INTO [dbo].[Customers]
--			    ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax])
--		 VALUES
--				(@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax)