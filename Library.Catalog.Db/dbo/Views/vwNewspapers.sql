
CREATE VIEW [dbo].[vwNewspapers]
WITH SCHEMABINDING
AS 
SELECT i.[Id],i.[Name],c.[Name] AS [City],[Pages],[Description],[ISSN],p.[Name] AS [Publisher],[Number],[Date],[Year] FROM [dbo].[Infos] AS i
	JOIN [dbo].[Newspapers] AS n ON i.[Id] = n.[Id]
	JOIN [dbo].[Publishers] AS p ON p.[Id] = n.[PublisherId]
	JOIN [dbo].[Cities] AS c ON  c.[Id] = n.[CityId]
    WHERE i.[IsDeleted] = 0
