CREATE TABLE [dbo].[InfoAuthors] (
    [InfoId]   INT NOT NULL,
    [AuthorId] INT NOT NULL,
    CONSTRAINT [PK_InfoAuthors_InfoId_AuthorId] PRIMARY KEY CLUSTERED ([InfoId] ASC, [AuthorId] ASC)
);

