create procedure EmployeeTotalSales (@EmployeeID int)
as

SELECT        SUM(od.UnitPrice * od.Quantity*(1-od.Discount)) AS Expr1, e.EmployeeID
FROM            Employees e  INNER JOIN
                         Orders o ON e.EmployeeID = o.EmployeeID INNER JOIN
                         [Order Details] od ON o.OrderID = od.OrderID
where e.EmployeeID = @EmployeeID
GROUP BY e.EmployeeID