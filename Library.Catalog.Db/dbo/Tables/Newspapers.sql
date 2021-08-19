CREATE TABLE [dbo].[Newspapers] (
    [Id]          INT          NOT NULL,
    [PublisherId] INT          NOT NULL,
    [CityId]      INT          NOT NULL,
    [Year]        NVARCHAR (4) NOT NULL,
    [Number]      INT          NOT NULL,
    [Date]        DATETIME     NOT NULL,
    [ISSN]        VARCHAR (9)  NULL,
    CONSTRAINT [PK_Newspapers_Id] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Newspapers_Cities] FOREIGN KEY ([CityId]) REFERENCES [dbo].[Cities] ([Id]),
    CONSTRAINT [FK_Newspapers_Infos] FOREIGN KEY ([Id]) REFERENCES [dbo].[Infos] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_Newspapers_Publishers] FOREIGN KEY ([PublisherId]) REFERENCES [dbo].[Publishers] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Newspapers_PublisherId]
    ON [dbo].[Newspapers]([PublisherId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Newspapers_CityId]
    ON [dbo].[Newspapers]([CityId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Newspapers_ISSN]
    ON [dbo].[Newspapers]([ISSN] ASC) WHERE ([ISSN] IS NOT NULL);

