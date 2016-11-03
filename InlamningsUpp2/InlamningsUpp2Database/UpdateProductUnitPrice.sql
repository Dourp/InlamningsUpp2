USE [NORTHWND]
GO
/****** Object:  StoredProcedure [dbo].[UpDateProductPrice]    Script Date: 2016-11-03 12:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[UpDateProductPrice](@ProductID int, @UnitPrice money)

as

	update Products
	set [UnitPrice] = @UnitPrice
	where ProductID = @ProductID
