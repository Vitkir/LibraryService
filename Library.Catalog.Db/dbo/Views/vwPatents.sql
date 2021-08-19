
CREATE VIEW [dbo].[vwPatents]
WITH SCHEMABINDING
AS 
SELECT i.[Id],i.[Name],c.[Name] AS [Country],[Pages],[Description],[RegistrationNumber],[FilingDate],[PublicationDate] 
FROM [dbo].[Infos] AS i
	JOIN [dbo].[Patents] AS p ON i.[Id] = p.[Id]
	JOIN [dbo].[Countries] AS c ON  c.[Id] = p.[CountryId]
    WHERE i.[IsDeleted] = 0
