
CREATE PROCEDURE [dbo].[Delete]
    @id INT,
    @markAsDeleted bit = 1
AS
BEGIN

BEGIN TRY
    BEGIN TRAN
        IF @markAsDeleted = 1
        UPDATE [dbo].[Infos] SET [IsDeleted] = 1
        WHERE [Id] = @id AND [IsDeleted] = 0
        ELSE
        DELETE FROM [dbo].[Infos]
        WHERE [Id] = @id
    COMMIT TRAN
END TRY
BEGIN CATCH
    ROLLBACK
    PRINT '[Delete] ROLLBACK'
END CATCH
END
