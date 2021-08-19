CREATE TABLE [dbo].[Patents] (
    [Id]                 INT         NOT NULL,
    [CountryId]          INT         NOT NULL,
    [RegistrationNumber] VARCHAR (9) NOT NULL,
    [FilingDate]         DATETIME    NOT NULL,
    [PublicationDate]    DATETIME    NOT NULL,
    CONSTRAINT [PK_Patents_Id] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Patents_Countries] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Countries] ([Id]),
    CONSTRAINT [FK_Patents_Infos] FOREIGN KEY ([Id]) REFERENCES [dbo].[Infos] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_Patents_CountryId]
    ON [dbo].[Patents]([CountryId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Patents_RegistrationNumber_PublicationDate]
    ON [dbo].[Patents]([RegistrationNumber] ASC, [PublicationDate] ASC);

