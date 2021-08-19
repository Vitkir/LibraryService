CREATE TABLE [dbo].[Authors] (
    [Id]      INT            IDENTITY (1, 1) NOT NULL,
    [Name]    NVARCHAR (50)  NOT NULL,
    [Surname] NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_Authors_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Authors_Surname_Name]
    ON [dbo].[Authors]([Surname] ASC, [Name] ASC);

