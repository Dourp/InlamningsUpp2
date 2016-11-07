CREATE procedure ProdutDelete (@ProductID int)
as
	Delete from [Order Details] where ProductID=@ProductID
	Delete from Products where ProductID=@ProductID

exec ProdutDelete 1