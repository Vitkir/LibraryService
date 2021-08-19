CREATE TABLE [dbo].[Types] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (10) NOT NULL,
    CONSTRAINT [PK_Types_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);

