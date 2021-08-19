
CREATE PROCEDURE [dbo].[FindByName]
    @name nvarchar(300)
AS
BEGIN
	SET NOCOUNT ON
    SELECT * FROM [dbo].[vwCatalog]
    WHERE [Name] = @name
END