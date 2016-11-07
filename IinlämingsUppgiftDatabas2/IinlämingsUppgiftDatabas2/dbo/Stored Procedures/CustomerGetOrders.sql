CREATE procedure CustomerGetOrders (@CustomerID nvarchar(5))
as

	SELECT        e.CompanyName, e.ContactName, o.OrderDate
	FROM          Customers e INNER JOIN
                  Orders o ON e.CustomerID = o.CustomerID

	where e.CustomerID=@CustomerID