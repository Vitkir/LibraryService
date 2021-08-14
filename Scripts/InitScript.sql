use [LibraryDB]

CREATE TABLE [dbo].[Infos]
(
	[Id] INT NOT NULL, 
    [Name] NVARCHAR(300) NOT NULL, 
    [City] NVARCHAR(200) NOT NULL, 
    [Pages] INT NOT NULL, 
    [Description] NVARCHAR(2000) NULL, 
    CONSTRAINT PK_Infos_Id PRIMARY KEY ([Id])
);

CREATE TABLE [dbo].[Publications]
(
	[Id] INT NOT NULL, 
    [Publisher] NVARCHAR(300) NOT NULL, 
    [Year] NVARCHAR(4) NOT NULL, 
    CONSTRAINT PK_Publications_Id PRIMARY KEY ([Id])
);

CREATE TABLE [dbo].[Authors]
(
    [Id] INT NOT NULL,
    [Name] NVARCHAR(50) NOT NULL,
    [Surname] NVARCHAR(200) NOT NULL, 
    CONSTRAINT PK_Authors_Id PRIMARY KEY ([Id])
);

CREATE TABLE [dbo].[InfoAuthors]
(
    [InfoId] INT NOT NULL,
    [AuthorId] INT NOT NULL,
    CONSTRAINT PK_InfoAuthors_InfoId_AuthorId PRIMARY KEY ([InfoId],[AuthorId])
);

CREATE TABLE [dbo].[Books] 
(
	[Id] INT NOT NULL,
    [InfoId] INT NOT NULL,
    [PublicationId] INT NOT NULL,
    [ISBN] VARCHAR (50) NULL, 
    CONSTRAINT PK_Books_Id PRIMARY KEY ([Id]),
    CONSTRAINT FK_Books_Infos FOREIGN KEY ([InfoId])
    REFERENCES [dbo].[Infos] ([Id])
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT FK_Books_Publications FOREIGN KEY ([PublicationId])
    REFERENCES [dbo].[Publications] ([Id])
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Newspapers]
(
	[Id] INT NOT NULL,
    [InfoId] INT NOT NULL,
    [PublicationId] INT NOT NULL,
    [Number] INT NOT NULL, 
    [Date] DATETIME NOT NULL, 
    [ISSN] VARCHAR(9) NULL, 
    CONSTRAINT PK_Newspapers_Id PRIMARY KEY ([Id]),
    CONSTRAINT FK_Newspapers_Infos FOREIGN KEY ([InfoId])
    REFERENCES [dbo].[Infos] ([Id])
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT FK_Newspapers_Publications FOREIGN KEY ([PublicationId])
    REFERENCES [dbo].[Publications] ([Id])
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Patents]
(
	[Id] INT NOT NULL, 
    [InfoId] INT NOT NULL,
    [RegistrationNumber] VARCHAR(9) NOT NULL,
    [FilingDate] DATETIME NOT NULL,
    [PublicationDate] DATETIME NOT NULL,
    CONSTRAINT PK_Patents_Id PRIMARY KEY ([Id]),
    CONSTRAINT FK_Patents_Infos FOREIGN KEY ([InfoId])
    REFERENCES [dbo].[Infos] ([Id])
    ON DELETE CASCADE
    ON UPDATE CASCADE,
);