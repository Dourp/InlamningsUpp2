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
CREATE TRIGGER [dbo].[ContactNameChanged] 
   ON  [dbo].[Customers] 
   for UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

	Insert into ContactNameChange ([ContactID], [OldContactName], [NewContactName], [ChangedDate], [UserId])
		select i.ContactID, d.ContactName, i.ContactName, GETDATE(), USER_ID()
			from inserted i
				inner join deleted d on i.[CustomerID]=d.[CustomerID]
			where d.[ContactName] <> i.[ContactName]

END