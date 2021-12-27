CREATE TABLE [dbo].[Admin] (
    [AdminID] INT            IDENTITY (1, 1) NOT NULL,
    [UserID]  NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED ([AdminID] ASC),
    CONSTRAINT [FK_Admin_User] FOREIGN KEY ([UserID]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);

