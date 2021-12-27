CREATE TABLE [dbo].[Student] (
    [StudentID]   INT            IDENTITY (1, 1) NOT NULL,
    [IDNumber]    VARCHAR (13)   NOT NULL,
    [DateOfBirth] DATE           NOT NULL,
    [HomeAddress] VARCHAR (255)  NOT NULL,
    [Gender]      CHAR (1)       NOT NULL,
    [UserID]      NVARCHAR (128) NOT NULL,
    [Active] BIT NOT NULL DEFAULT 1, 
    CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED ([StudentID] ASC),
    CONSTRAINT [FK_Student_User] FOREIGN KEY ([UserID]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [Unique_UserId] UNIQUE(UserID)
);

