USE [master]
GO

/****** Object:  Database [Catalog]    Script Date: 8/18/2021 12:18:39 PM ******/
CREATE DATABASE [Catalog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Catalog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Catalog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Catalog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Catalog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Catalog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Catalog] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Catalog] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Catalog] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Catalog] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Catalog] SET ARITHABORT OFF 
GO

ALTER DATABASE [Catalog] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Catalog] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Catalog] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Catalog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Catalog] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Catalog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Catalog] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Catalog] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Catalog] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Catalog] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Catalog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Catalog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Catalog] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Catalog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Catalog] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Catalog] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Catalog] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Catalog] SET RECOVERY FULL 
GO

ALTER DATABASE [Catalog] SET  MULTI_USER 
GO

ALTER DATABASE [Catalog] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Catalog] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Catalog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Catalog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Catalog] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Catalog] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Catalog] SET  READ_WRITE 
GO


use [Catalog]
GO

CREATE TABLE [dbo].[Types]
(
	[Id] INT NOT NULL IDENTITY(1,1), 
    [Name] NVARCHAR(10) NOT NULL, 
    CONSTRAINT PK_Types_Id PRIMARY KEY ([Id]),
);

CREATE TABLE [dbo].[Infos]
(
	[Id] INT NOT NULL IDENTITY(1,1), 
    [Name] NVARCHAR(300) NOT NULL, 
    [Pages] INT NOT NULL, 
    [Description] NVARCHAR(2000) NULL,
    [TypeId] INT NOT NULL,
    [IsDeleted] BIT NOT NULL DEFAULT 0, 
    CONSTRAINT PK_Infos_Id PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Infos_TypeId] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[Types] ([Id])
);

CREATE TABLE [dbo].[Countries]
(
	[Id] INT NOT NULL IDENTITY(1,1), 
    [Name] NVARCHAR(200) NOT NULL, 
    CONSTRAINT PK_Countries_Id PRIMARY KEY ([Id])
);

CREATE TABLE [dbo].[Cities]
(
	[Id] INT NOT NULL IDENTITY(1,1), 
    [Name] NVARCHAR(200) NOT NULL, 
    CONSTRAINT PK_Cities_Id PRIMARY KEY ([Id])
);

CREATE TABLE [dbo].[Publishers]
(
	[Id] INT NOT NULL IDENTITY(1,1), 
    [Name] NVARCHAR(300) NOT NULL, 
    CONSTRAINT PK_Publishers_Id PRIMARY KEY ([Id])
);

CREATE TABLE [dbo].[Authors]
(
    [Id] INT NOT NULL IDENTITY(1,1),
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
    [PublisherId] INT NOT NULL,
    [CityId] INT NOT NULL,
    [Year] NVARCHAR(4) NOT NULL, 
    [ISBN] VARCHAR (50) NULL, 
    CONSTRAINT PK_Books_Id PRIMARY KEY ([Id]),
    CONSTRAINT FK_Books_Infos FOREIGN KEY ([Id])
    REFERENCES [dbo].[Infos] ([Id])
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Books_Publishers FOREIGN KEY ([PublisherId])
    REFERENCES [dbo].[Publishers] ([Id]),
    CONSTRAINT FK_Books_Cities FOREIGN KEY ([CityId])
    REFERENCES [dbo].[Cities] ([Id])
);

CREATE TABLE [dbo].[Newspapers]
(
	[Id] INT NOT NULL,
    [PublisherId] INT NOT NULL,
    [CityId] INT NOT NULL,
    [Year] NVARCHAR(4) NOT NULL, 
    [Number] INT NOT NULL, 
    [Date] DATETIME NOT NULL, 
    [ISSN] VARCHAR(9) NULL, 
    CONSTRAINT PK_Newspapers_Id PRIMARY KEY ([Id]),
    CONSTRAINT FK_Newspapers_Infos FOREIGN KEY ([Id])
    REFERENCES [dbo].[Infos] ([Id])
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Newspapers_Publishers FOREIGN KEY ([PublisherId])
    REFERENCES [dbo].[Publishers] ([Id]),
    CONSTRAINT FK_Newspapers_Cities FOREIGN KEY ([CityId])
    REFERENCES [dbo].[Cities] ([Id])
);

CREATE TABLE [dbo].[Patents]
(
	[Id] INT NOT NULL, 
    [CountryId] INT NOT NULL, 
    [RegistrationNumber] VARCHAR(9) NOT NULL,
    [FilingDate] DATETIME NOT NULL,
    [PublicationDate] DATETIME NOT NULL,
    CONSTRAINT PK_Patents_Id PRIMARY KEY ([Id]),
    CONSTRAINT FK_Patents_Infos FOREIGN KEY ([Id])
    REFERENCES [dbo].[Infos] ([Id])
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Patents_Countries FOREIGN KEY ([CountryId])
    REFERENCES [dbo].[Countries] ([Id])
);

CREATE INDEX IX_Infos_Name ON [dbo].[Infos]([Name])

CREATE UNIQUE INDEX UIX_Authors_Surname_Name ON [dbo].[Authors]([Surname],[Name])

CREATE UNIQUE INDEX UID_Publishers_Name ON [dbo].[Publishers]([Name])

CREATE UNIQUE INDEX UIX_Cities_Name ON [dbo].[Cities]([Name])
CREATE UNIQUE INDEX UIX_Countries_Name ON [dbo].[Countries]([Name])

CREATE INDEX IX_Books_PublisherId ON [dbo].[Books]([PublisherId])
CREATE INDEX IX_Books_CityId ON [dbo].[Books]([CityId])
CREATE UNIQUE INDEX UIX_Books_ISBN ON [dbo].[Books]([ISBN])
    WHERE ([ISBN] IS NOT NULL)

CREATE INDEX IX_Newspapers_PublisherId ON [dbo].[Newspapers]([PublisherId])
CREATE INDEX IX_Newspapers_CityId ON [dbo].[Newspapers]([CityId])
CREATE UNIQUE INDEX UIX_Newspapers_ISSN ON [dbo].[Newspapers]([ISSN])
    WHERE ([ISSN] IS NOT NULL)

CREATE INDEX IX_Patents_CountryId ON [dbo].[Patents]([CountryId])
CREATE UNIQUE INDEX UIX_Patents_RegistrationNumber_PublicationDate ON [dbo].[Patents]([RegistrationNumber],[PublicationDate])
GO

CREATE VIEW [dbo].[vwBooks]
WITH SCHEMABINDING
AS 
SELECT i.[Id],i.[Name],c.[Name] AS [City],[Pages],[Description],[ISBN],p.[Name] AS [Publisher],[Year] FROM [dbo].[Infos] AS i
	JOIN [dbo].[Books] AS b ON i.[Id] = b.[Id]
	JOIN [dbo].[Publishers] AS p ON  p.[Id] = b.[PublisherId]
	JOIN [dbo].[Cities] AS c ON  c.[Id] = b.[CityId]
    WHERE i.[IsDeleted] = 0
GO

CREATE VIEW [dbo].[vwNewspapers]
WITH SCHEMABINDING
AS 
SELECT i.[Id],i.[Name],c.[Name] AS [City],[Pages],[Description],[ISSN],p.[Name] AS [Publisher],[Number],[Date],[Year] FROM [dbo].[Infos] AS i
	JOIN [dbo].[Newspapers] AS n ON i.[Id] = n.[Id]
	JOIN [dbo].[Publishers] AS p ON p.[Id] = n.[PublisherId]
	JOIN [dbo].[Cities] AS c ON  c.[Id] = n.[CityId]
    WHERE i.[IsDeleted] = 0
GO

CREATE VIEW [dbo].[vwPatents]
WITH SCHEMABINDING
AS 
SELECT i.[Id],i.[Name],c.[Name] AS [Country],[Pages],[Description],[RegistrationNumber],[FilingDate],[PublicationDate] 
FROM [dbo].[Infos] AS i
	JOIN [dbo].[Patents] AS p ON i.[Id] = p.[Id]
	JOIN [dbo].[Countries] AS c ON  c.[Id] = p.[CountryId]
    WHERE i.[IsDeleted] = 0
GO

CREATE VIEW [dbo].[vwCatalog]
WITH SCHEMABINDING
AS
SELECT i.[Id],i.[Name],t.[Name] AS [Type],c.[City],pc.[Name] AS [Country],[Pages],[Description],[ISBN],[ISSN],bn.[Publisher],c.[Year],[RegistrationNumber],[FilingDate],[PublicationDate]  FROM [dbo].[Infos] AS i
	LEFT JOIN [dbo].[Types] AS t ON i.[TypeId] = t.[Id]
	LEFT JOIN [dbo].[Books] AS b ON i.[Id] = b.[Id]
	LEFT JOIN [dbo].[Newspapers] AS n ON i.[Id] = n.[Id]
	LEFT JOIN (SELECT b.[Id],p.[Name] AS [Publisher],c.[Name] AS [City] FROM [dbo].[Books] AS b
                    LEFT JOIN [dbo].[Publishers] AS p ON p.[Id] = b.[PublisherId]
	                LEFT JOIN [dbo].[Cities] AS c ON  c.[Id] = b.[CityId]
                UNION 
                SELECT n.[Id],p.[Name] AS [Publisher],c.[Name] AS [City] FROM [dbo].[Newspapers] AS n
                    LEFT JOIN [dbo].[Publishers] AS p ON p.[Id] = n.[PublisherId]
	                LEFT JOIN [dbo].[Cities] AS c ON  c.[Id] = n.[CityId]) AS bn ON  i.[Id] = bn.[Id]
    LEFT JOIN (SELECT b.[Id],c.[Name] AS [City] ,[Year] FROM [dbo].[Books] AS b
	                LEFT JOIN [dbo].[Cities] AS c ON  c.[Id] = b.[CityId]
                UNION
                SELECT n.[Id],c.[Name] AS [City] ,[Year] FROM [dbo].[Newspapers] AS n
	                LEFT JOIN [dbo].[Cities] AS c ON  c.[Id] = n.[CityId]) AS c ON i.[Id] = c.[Id]
	LEFT JOIN [dbo].[Patents] AS p ON i.[Id] = p.[Id]
	LEFT JOIN [dbo].[Countries] AS pc ON  pc.[Id] = p.[CountryId]
    WHERE i.[IsDeleted] = 0
GO

CREATE TYPE [dbo].[BookTableType] AS table
(
    [Name] NVARCHAR(300) NOT NULL, 
    [Pages] INT NOT NULL, 
    [Description] NVARCHAR(2000) NULL,
    [PublisherName] NVARCHAR(300) NOT NULL, 
    [City] NVARCHAR(200) NOT NULL,
    [Year] NVARCHAR(4) NOT NULL, 
    [ISBN] VARCHAR (50) NULL 
)
GO

CREATE TYPE [dbo].[NewspaperTableType] AS table
(
    [Name] NVARCHAR(300) NOT NULL, 
    [Pages] INT NOT NULL, 
    [Description] NVARCHAR(2000) NULL,
    [PublisherName] NVARCHAR(300) NOT NULL, 
    [City] NVARCHAR(200) NOT NULL,
    [Year] NVARCHAR(4) NOT NULL, 
    [Number] INT NOT NULL, 
    [Date] DATETIME NOT NULL, 
    [ISSN] VARCHAR(9) NULL
)
GO

CREATE TYPE [dbo].[PatentTableType] AS table
(
    [Name] NVARCHAR(300) NOT NULL, 
    [Pages] INT NOT NULL, 
    [Description] NVARCHAR(2000) NULL,
    [Country] NVARCHAR(200) NOT NULL, 
    [RegistrationNumber] VARCHAR(9) NOT NULL,
    [FilingDate] DATETIME NOT NULL,
    [PublicationDate] DATETIME NOT NULL
)
GO

CREATE TYPE [dbo].[AuthorTableType] AS table
(
    [Name] NVARCHAR(50) NOT NULL,
    [Surname] NVARCHAR(200) NOT NULL
)
GO

CREATE PROCEDURE [dbo].[AddBook]
	@book [dbo].[BookTableType] READONLY,
    @authors [dbo].[AuthorTableType] READONLY
AS
BEGIN
    DECLARE @bookId int;
    DECLARE @cityId int;
    DECLARE @pablisherkId int;
    DECLARE @authorIds table (Id int);

BEGIN TRY
    BEGIN TRAN
        INSERT INTO [dbo].[Infos]([Name],[Pages],[Description],[TypeId]) 
        SELECT [Name],[Pages],[Description],1 FROM @book
        SET @bookId = @@IDENTITY
    
        INSERT INTO [dbo].[Cities]([Name]) 
        SELECT [City] FROM @book
        SET @cityId = @@IDENTITY
        
        INSERT INTO [dbo].[Authors]([Name],[Surname]) 
        OUTPUT INSERTED.ID INTO @authorIds(Id) 
        SELECT [Name],[Surname] FROM @authors
    
        INSERT INTO [dbo].[Publishers]([Name])
        SELECT [PublisherName] FROM @book
        SET @pablisherkId = @@IDENTITY
        
        INSERT INTO [dbo].[Books]([Id],[CityId],[PublisherId],[Year],[ISBN]) 
        SELECT @bookId,@cityId,@pablisherkId,[Year],[ISBN] FROM @book
    
        INSERT INTO [dbo].[InfoAuthors]([InfoId],[AuthorId]) SELECT @bookId, AIds.Id FROM @authorIds AS AIds
    COMMIT TRAN
END TRY
BEGIN CATCH
    ROLLBACK
    PRINT '[AddBook] ROLLBACK'
END CATCH
END
GO

CREATE PROCEDURE [dbo].[AddNewspaper]
	@newspaper [dbo].[NewspaperTableType] READONLY
AS
BEGIN
    DECLARE @newspaperId int;
    DECLARE @cityId int;
    DECLARE @publisherId int;

BEGIN TRY
    BEGIN TRAN
        INSERT INTO [dbo].[Infos]([Name],[Pages],[Description],[TypeId]) 
        SELECT [Name],[Pages],[Description],2 FROM @newspaper
        SET @newspaperId = @@IDENTITY

        INSERT INTO [dbo].[Cities]([Name]) 
        SELECT [City] FROM @newspaper
        SET @cityId = @@IDENTITY

        INSERT INTO [dbo].[Publishers]([Name])
        SELECT [PublisherName] FROM @newspaper
        SET @publisherId = @@IDENTITY
        
        INSERT INTO [dbo].[Newspapers]([Id],[CityId],[PublisherId],[Year],[Number],[Date],[ISSN]) 
        SELECT @newspaperId,@cityId,@publisherId,[Year],[Number],[Date],[ISSN] FROM @newspaper
    COMMIT TRAN
END TRY
BEGIN CATCH
    ROLLBACK
    PRINT '[AddNewspaper] ROLLBACK'
END CATCH
END
GO

CREATE PROCEDURE [dbo].[AddPatent]
	@patent [dbo].[PatentTableType] READONLY,
    @authors [dbo].[AuthorTableType] READONLY
AS
BEGIN
    DECLARE @patentId int;
    DECLARE @countryId int;
    DECLARE @authorIds table (Id int);

BEGIN TRY
    BEGIN TRAN
        INSERT INTO [dbo].[Infos]([Name],[Pages],[Description],[TypeId]) 
        SELECT [Name],[Pages],[Description],3 FROM @patent
        SET @patentId = @@IDENTITY

        INSERT INTO [dbo].[Countries]([Name]) 
        SELECT [Country] FROM @patent
        SET @countryId = @@IDENTITY
        
        INSERT INTO [dbo].[Authors]([Name],[Surname]) 
        OUTPUT INSERTED.ID INTO @authorIds(Id) 
        SELECT [Name],[Surname] FROM @authors
        
        INSERT INTO [dbo].[Patents]([Id],[CountryId],[RegistrationNumber],[FilingDate],[PublicationDate]) 
        SELECT @patentId,@countryId,[RegistrationNumber],[FilingDate],[PublicationDate] FROM @patent

        INSERT INTO [dbo].[InfoAuthors]([InfoId],[AuthorId]) SELECT @patentId, AIds.Id FROM @authorIds AS AIds
    COMMIT TRAN
END TRY
BEGIN CATCH
    ROLLBACK
    PRINT '[AddPatent] ROLLBACK'
END CATCH
END
GO

CREATE PROCEDURE [dbo].[Delete]
    @id INT,
    @markAsDeleted bit = 1
AS
BEGIN

BEGIN TRY
    BEGIN TRAN
        IF @markAsDeleted = 1
        UPDATE [dbo].[Infos] SET [IsDeleted] = 1
        WHERE [Id] = @id AND [IsDeleted] = 0
        ELSE
        DELETE FROM [dbo].[Infos]
        WHERE [Id] = @id
    COMMIT TRAN
END TRY
BEGIN CATCH
    ROLLBACK
    PRINT '[Delete] ROLLBACK'
END CATCH
END
GO

CREATE PROCEDURE [dbo].[FindByName]
    @name nvarchar(300)
AS
BEGIN
	SET NOCOUNT ON
     SELECT * INTO #tempCatalog FROM [dbo].[vwCatalog]
    WHERE [Name] = @name

    SELECT * FROM #tempCatalog
    
    SELECT [InfoId],[AuthorId] FROM #tempCatalog AS i
    JOIN [dbo].[InfoAuthors] AS ia ON i.[Id] = ia.[InfoId]

    SELECT a.[Id],a.[Name],a.[Surname] FROM #tempCatalog AS i
    JOIN [dbo].[InfoAuthors] AS ia ON i.[Id] = ia.[InfoId]
    JOIN [dbo].[Authors] AS a ON ia.[AuthorId] = a.[Id]
END
GO

INSERT INTO [dbo].[Types]([Name]) VALUES('Book')
INSERT INTO [dbo].[Types]([Name]) VALUES('Newspaper')
INSERT INTO [dbo].[Types]([Name]) VALUES('Patent')