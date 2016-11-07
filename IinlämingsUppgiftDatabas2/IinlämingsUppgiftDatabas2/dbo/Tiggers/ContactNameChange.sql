CREATE TABLE [dbo].[ContactNameChange](
    [ContactNameChangeID] [int] IDENTITY(1,1) NOT NULL,
    [ContactID] [int] NOT NULL,
    [OldContactName] [nvarchar] NOT NULL,
    [NewContactName] [nvarchar] NOT NULL,
    [ChangedDate] [datetime] NOT NULL,
    [UserId] [int] NOT NULL,
    PRIMARY KEY CLUSTERED 
    (
        [ContactNameChangeID] ASC
    )
)

GO