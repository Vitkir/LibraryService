CREATE TYPE [dbo].[BookTableType] AS TABLE (
    [Name]          NVARCHAR (300)  NOT NULL,
    [Pages]         INT             NOT NULL,
    [Description]   NVARCHAR (2000) NULL,
    [PublisherName] NVARCHAR (300)  NOT NULL,
    [City]          NVARCHAR (200)  NOT NULL,
    [Year]          NVARCHAR (4)    NOT NULL,
    [ISBN]          VARCHAR (50)    NULL);

