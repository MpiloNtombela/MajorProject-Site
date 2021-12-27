CREATE TABLE [dbo].[Registration] (
    [RegistrationID]    INT             IDENTITY (1, 1) NOT NULL,
    [PaymentPlanID]       VARCHAR(32)   DEFAULT ('platinum') NOT NULL,
    [StudentID]         INT             NOT NULL,
    [AdminID]           INT             NULL,
    [RegistrationDate]  DATETIME        DEFAULT (getdate()) NOT NULL,
    [AmountDue]         DECIMAL (10, 2) NOT NULL,
    [AmountPayed]       DECIMAL (10, 2) NOT NULL,
    [IsApproved]        BIT             NOT NULL,
    [ReasonNotApproved] VARCHAR (255)   DEFAULT ('Awaiting admin review') NOT NULL,
    [NextPayment] DATETIME NULL, 
    [PaymentCycle] TINYINT NOT NULL DEFAULT 1, 
    [ApproveDate] DATETIME NULL, 
    CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED ([RegistrationID] ASC),
    CONSTRAINT [FK_Registration_PaymentPlan] FOREIGN KEY ([PaymentPlanID]) REFERENCES [dbo].[PaymentPlan] ([PaymentTitle]) ON DELETE CASCADE,
    CONSTRAINT [FK_Registration_Student] FOREIGN KEY ([StudentID]) REFERENCES [dbo].[Student] ([StudentID]) ON DELETE CASCADE
);

