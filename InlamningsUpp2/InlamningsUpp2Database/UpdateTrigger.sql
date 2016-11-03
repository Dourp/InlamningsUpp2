USE [NORTHWND]
GO
/****** Object:  Trigger [dbo].[ContactNameChanged]    Script Date: 2016-11-03 12:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
ALTER TRIGGER [dbo].[ContactNameChanged] 
   ON  [dbo].[Customers] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

	Insert into CustomerNameChange (CustomerID, OldContactName, NewContactName)
		select i.CustomerID, d.ContactName, i.ContactName
			from inserted i
			inner join deleted d on i.CustomerID=d.CustomerID

END