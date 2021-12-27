CREATE TABLE [dbo].[Payment] (
    [PaymentID]         INT             IDENTITY (1, 1) NOT NULL,
    [RegistrationID]    INT             NULL,
    [PaymentDecription] VARCHAR (255)   NOT NULL,
    [Amount]            DECIMAL (10, 2) NOT NULL,
    [PaymentDate]       DATETIME        NOT NULL,
    [Success] BIT NOT NULL DEFAULT 1, 
    CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED ([PaymentID] ASC),
    CONSTRAINT [FK_Payment_Registration] FOREIGN KEY ([RegistrationID]) REFERENCES [dbo].[Registration] ([RegistrationID]) ON DELETE CASCADE
);

