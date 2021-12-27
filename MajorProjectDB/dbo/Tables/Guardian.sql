CREATE TABLE [dbo].[Guardian] (
    [GurdianID]   INT          IDENTITY (1, 1) NOT NULL,
    [StudentID]   INT          NOT NULL,
    [FirstName]   VARCHAR (32) NOT NULL,
    [LastName]    VARCHAR (32) NOT NULL,
    [IDNumber]    VARCHAR (13) NOT NULL,
    [HomeAddress] VARCHAR (64) NOT NULL,
    [PhoneNumber] VARCHAR (15) NOT NULL,
    CONSTRAINT [PK_Guardian] PRIMARY KEY CLUSTERED ([GurdianID] ASC),
    CONSTRAINT [FK_Guardian_Student] FOREIGN KEY ([StudentID]) REFERENCES [dbo].[Student] ([StudentID]) ON DELETE CASCADE
);

