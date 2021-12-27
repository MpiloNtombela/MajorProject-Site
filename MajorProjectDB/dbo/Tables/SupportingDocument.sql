CREATE TABLE [dbo].[SupportingDocument] (
    [SupportingDocumentID] INT             IDENTITY (1, 1) NOT NULL,
    [StudentID]            INT             NOT NULL,
    [File]                 VARBINARY (MAX) NOT NULL,
    [FileName]             VARCHAR (255)    NOT NULL,
    [IsVerified]           BIT             NOT NULL,
    [ContentType] NCHAR(32) NOT NULL, 
    [FileType] VARCHAR(32) NOT NULL, 
    CONSTRAINT [PK_SupportingDocument] PRIMARY KEY CLUSTERED ([SupportingDocumentID] ASC),
    CONSTRAINT [FK_SupportingDocument_Student] FOREIGN KEY ([StudentID]) REFERENCES [dbo].[Student] ([StudentID]) ON DELETE CASCADE
);

