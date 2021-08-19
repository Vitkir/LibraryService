CREATE TYPE [dbo].[PatentTableType] AS TABLE (
    [Name]               NVARCHAR (300)  NOT NULL,
    [Pages]              INT             NOT NULL,
    [Description]        NVARCHAR (2000) NULL,
    [Country]            NVARCHAR (200)  NOT NULL,
    [RegistrationNumber] VARCHAR (9)     NOT NULL,
    [FilingDate]         DATETIME        NOT NULL,
    [PublicationDate]    DATETIME        NOT NULL);

