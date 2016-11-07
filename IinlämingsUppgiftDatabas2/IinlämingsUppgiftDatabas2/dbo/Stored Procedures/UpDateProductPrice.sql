create procedure UpDateProductPrice(@ProductID int, @UnitPrice money)

as

	update Products
	set [UnitPrice] = @UnitPrice
	where ProductID = @ProductID
