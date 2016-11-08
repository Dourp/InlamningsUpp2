CREATE TRIGGER [dbo].[ContactNameUpdate] 
   ON  [dbo].[Customers] 
   for UPDATE
AS 
BEGIN

	SET NOCOUNT ON;

	Insert into [dbo].[ContactNameChanges] ([CustomerID], [OldContactName], [NewContactName], [ChangedDate])
		select i.CustomerID, d.ContactName, i.ContactName, GETDATE()
			from inserted i
				inner join deleted d on i.[CustomerID]=d.[CustomerID]
			where d.[ContactName] <> i.[ContactName]

END