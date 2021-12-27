CREATE TABLE [dbo].[RegisteredSubject] (
    [SubjectCode] VARCHAR (5) DEFAULT ('EXED') NOT NULL,
    [StudentID]   INT    NOT NULL,
    [MatricMark]  TINYINT     NOT NULL,
    [UpgradeMark] TINYINT     NULL,
    CONSTRAINT [PK_RegisteredSubject] PRIMARY KEY CLUSTERED ([SubjectCode] ASC, [StudentID] ASC),
    CONSTRAINT [FK_RegisteredSubject_Student] FOREIGN KEY ([StudentID]) REFERENCES [dbo].[Student] ([StudentID]) ON DELETE CASCADE,
    CONSTRAINT [FK_RegisteredSubject_Subject] FOREIGN KEY ([SubjectCode]) REFERENCES [dbo].[Subject] ([SubjectCode])
);

