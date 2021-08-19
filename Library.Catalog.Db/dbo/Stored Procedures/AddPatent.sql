
CREATE PROCEDURE [dbo].[AddPatent]
	@patent [dbo].[PatentTableType] READONLY,
    @authors [dbo].[AuthorTableType] READONLY
AS
BEGIN
    DECLARE @patentId int;
    DECLARE @countryId int;
    DECLARE @authorIds table (Id int);

BEGIN TRY
    BEGIN TRAN
        INSERT INTO [dbo].[Infos]([Name],[Pages],[Description]) 
        SELECT [Name],[Pages],[Description] FROM @patent
        SET @patentId = @@IDENTITY

        INSERT INTO [dbo].[Countries]([Name]) 
        SELECT [Country] FROM @patent
        SET @countryId = @@IDENTITY
        
        INSERT INTO [dbo].[Authors]([Name],[Surname]) 
        OUTPUT INSERTED.ID INTO @authorIds(Id) 
        SELECT [Name],[Surname] FROM @authors
        
        INSERT INTO [dbo].[Patents]([Id],[CountryId],[RegistrationNumber],[FilingDate],[PublicationDate]) 
        SELECT @patentId,@countryId,[RegistrationNumber],[FilingDate],[PublicationDate] FROM @patent

        INSERT INTO [dbo].[InfoAuthors]([InfoId],[AuthorId]) SELECT @patentId, AIds.Id FROM @authorIds AS AIds
    COMMIT TRAN
END TRY
BEGIN CATCH
    ROLLBACK
    PRINT '[AddPatent] ROLLBACK'
END CATCH
END
