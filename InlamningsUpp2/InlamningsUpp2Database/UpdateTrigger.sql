CREATE TRIGGER [dbo].[ContactNameUpdate] 
   ON  [dbo].[Customers] 
   for UPDATE
AS 
BEGIN

	SET NOCOUNT ON;

	Insert into [dbo].[ContactNameChange] ([ContactID], [OldContactName], [NewContactName], [ChangedDate], [UserId])
		select i.CustomerID, d.ContactName, i.ContactName, GETDATE(), USER_ID()
			from inserted i
				inner join deleted d on i.[CustomerID]=d.[CustomerID]
			where d.[ContactName] <> i.[ContactName]

END