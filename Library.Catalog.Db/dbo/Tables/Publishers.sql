CREATE TABLE [dbo].[Publishers] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_Publishers_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UID_Publishers_Name]
    ON [dbo].[Publishers]([Name] ASC);

