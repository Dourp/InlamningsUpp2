create procedure SupplierDelete (@SupplierID int)
as

	Delete from Suppliers
	where(SupplierID = @SupplierID)