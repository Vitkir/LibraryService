
CREATE PROCEDURE [dbo].[AddBook]
	@book [dbo].[BookTableType] READONLY,
    @authors [dbo].[AuthorTableType] READONLY
AS
BEGIN
    DECLARE @bookId int;
    DECLARE @cityId int;
    DECLARE @pablisherkId int;
    DECLARE @authorIds table (Id int);

BEGIN TRY
    BEGIN TRAN
        INSERT INTO [dbo].[Infos]([Name],[Pages],[Description]) 
        SELECT [Name],[Pages],[Description] FROM @book
        SET @bookId = @@IDENTITY
    
        INSERT INTO [dbo].[Cities]([Name]) 
        SELECT [City] FROM @book
        SET @cityId = @@IDENTITY
        
        INSERT INTO [dbo].[Authors]([Name],[Surname]) 
        OUTPUT INSERTED.ID INTO @authorIds(Id) 
        SELECT [Name],[Surname] FROM @authors
    
        INSERT INTO [dbo].[Publishers]([Name])
        SELECT [PublisherName] FROM @book
        SET @pablisherkId = @@IDENTITY
        
        INSERT INTO [dbo].[Books]([Id],[CityId],[PublisherId],[Year],[ISBN]) 
        SELECT @bookId,@cityId,@pablisherkId,[Year],[ISBN] FROM @book
    
        INSERT INTO [dbo].[InfoAuthors]([InfoId],[AuthorId]) SELECT @bookId, AIds.Id FROM @authorIds AS AIds
    COMMIT TRAN
END TRY
BEGIN CATCH
    ROLLBACK
    PRINT '[AddBook] ROLLBACK'
END CATCH
END
