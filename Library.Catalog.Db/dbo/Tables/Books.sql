CREATE TABLE [dbo].[Books] (
    [Id]          INT          NOT NULL,
    [PublisherId] INT          NOT NULL,
    [CityId]      INT          NOT NULL,
    [Year]        NVARCHAR (4) NOT NULL,
    [ISBN]        VARCHAR (50) NULL,
    CONSTRAINT [PK_Books_Id] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Books_Cities] FOREIGN KEY ([CityId]) REFERENCES [dbo].[Cities] ([Id]),
    CONSTRAINT [FK_Books_Infos] FOREIGN KEY ([Id]) REFERENCES [dbo].[Infos] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_Books_Publishers] FOREIGN KEY ([PublisherId]) REFERENCES [dbo].[Publishers] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Books_PublisherId]
    ON [dbo].[Books]([PublisherId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Books_CityId]
    ON [dbo].[Books]([CityId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Books_ISBN]
    ON [dbo].[Books]([ISBN] ASC) WHERE ([ISBN] IS NOT NULL);

