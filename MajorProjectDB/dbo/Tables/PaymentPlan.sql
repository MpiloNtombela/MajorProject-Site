CREATE TABLE [dbo].[PaymentPlan] (
    [PaymentTitle]           VARCHAR (32)  NOT NULL, 
    [PaymentPlanDescription] VARCHAR (255) NOT NULL,
    [PaymentLength]          INT           NOT NULL,
    CONSTRAINT [PK_PaymentPlan] PRIMARY KEY ([PaymentTitle])
);

