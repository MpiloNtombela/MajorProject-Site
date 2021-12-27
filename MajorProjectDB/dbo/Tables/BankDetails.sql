CREATE TABLE [dbo].[BankDetails] (
    [BankDetailsID] INT           IDENTITY (1, 1) NOT NULL,
    [StudentID]     INT           NOT NULL,
    [BankName]      VARCHAR (128) NOT NULL,
    [CardHolder]    VARCHAR (128) NOT NULL,
    [CardNumber]    VARCHAR (19)  NOT NULL,
    [Cvc]           VARCHAR (5)   NOT NULL,
    [ExpiryDate]    DATE          NOT NULL,
    CONSTRAINT [PK_BankDetails] PRIMARY KEY CLUSTERED ([BankDetailsID] ASC),
    CONSTRAINT [FK_BankDetails_Student] FOREIGN KEY ([StudentID]) REFERENCES [dbo].[Student] ([StudentID]) ON DELETE CASCADE
);

