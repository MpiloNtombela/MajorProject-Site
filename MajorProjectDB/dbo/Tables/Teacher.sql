CREATE TABLE [dbo].[Teacher] (
    [TeacherID]     INT            IDENTITY (1, 1) NOT NULL,
    [UserID]        NVARCHAR (128) NOT NULL,
    [Gender]        CHAR (1)       NOT NULL,
    [Qualification] VARCHAR (128)  NOT NULL,
    CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED ([TeacherID] ASC),
    CONSTRAINT [FK_Teacher_User] FOREIGN KEY ([UserID]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);

