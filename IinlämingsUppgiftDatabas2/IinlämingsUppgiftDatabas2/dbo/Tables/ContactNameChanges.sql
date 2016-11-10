CREATE TABLE [dbo].[ContactNameChanges](
    [ContactNameChangesID] [int] IDENTITY(1,1) NOT NULL,
    [CustomerID] [nchar](5) NOT NULL,
    [OldContactName] [nvarchar](30) NOT NULL,
    [NewContactName] [nvarchar](30) NOT NULL,
    [ChangedDate] [datetime] NOT NULL,
    PRIMARY KEY CLUSTERED 
    (
        [ContactNameChangesID] ASC
    )
)

GO