
CREATE PROCEDURE [dbo].[AddNewspaper]
	@newspaper [dbo].[NewspaperTableType] READONLY
AS
BEGIN
    DECLARE @newspaperId int;
    DECLARE @cityId int;
    DECLARE @publisherId int;

BEGIN TRY
    BEGIN TRAN
        INSERT INTO [dbo].[Infos]([Name],[Pages],[Description]) 
        SELECT [Name],[Pages],[Description] FROM @newspaper
        SET @newspaperId = @@IDENTITY

        INSERT INTO [dbo].[Cities]([Name]) 
        SELECT [City] FROM @newspaper
        SET @cityId = @@IDENTITY

        INSERT INTO [dbo].[Publishers]([Name])
        SELECT [PublisherName] FROM @newspaper
        SET @publisherId = @@IDENTITY
        
        INSERT INTO [dbo].[Newspapers]([Id],[CityId],[PublisherId],[Year],[Number],[Date],[ISSN]) 
        SELECT @newspaperId,@cityId,@publisherId,[Year],[Number],[Date],[ISSN] FROM @newspaper
    COMMIT TRAN
END TRY
BEGIN CATCH
    ROLLBACK
    PRINT '[AddNewspaper] ROLLBACK'
END CATCH
END
