﻿CREATE TABLE [dbo].[Notification]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [UserId] NVARCHAR(128) NOT NULL,
    [Title] VARCHAR(50) NOT NULL, 
    [Message] VARCHAR(255) NOT NULL,
    [Url] NVARCHAR(255) NULL,
    [Seen] BIT NOT NULL DEFAULT 0,
    [Trash] BIT NULL DEFAULT 0, 
    [Timestamp] DATETIME NOT NULL, 
    CONSTRAINT [FK_Notification_ToAspNetUsers] FOREIGN KEY (UserId) REFERENCES AspNetUsers(Id) ON DELETE CASCADE
)
