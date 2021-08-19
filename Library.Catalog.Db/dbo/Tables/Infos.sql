CREATE TABLE [dbo].[Infos] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (300)  NOT NULL,
    [Pages]       INT             NOT NULL,
    [Description] NVARCHAR (2000) NULL,
    [IsDeleted]   BIT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Infos_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Infos_Name]
    ON [dbo].[Infos]([Name] ASC);

