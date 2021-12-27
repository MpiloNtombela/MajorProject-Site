CREATE TABLE [dbo].[Subject] (
    [SubjectCode]        VARCHAR (5)     NOT NULL,
    [TeacherID]          INT             NOT NULL,
    [SubjectName]        VARCHAR (32)    NOT NULL,
    [SubjectDescription] VARCHAR (700)   NOT NULL,
    [SubjectPrice]       DECIMAL (10, 2) NOT NULL,
    [IsActive]           BIT             NOT NULL,
    CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED ([SubjectCode] ASC),
    CONSTRAINT [FK_Subject_Teacher] FOREIGN KEY ([TeacherID]) REFERENCES [dbo].[Teacher] ([TeacherID]) ON DELETE CASCADE
);

