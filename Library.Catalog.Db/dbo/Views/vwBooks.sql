
CREATE VIEW [dbo].[vwBooks]
WITH SCHEMABINDING
AS 
SELECT i.[Id],i.[Name],c.[Name] AS [City],[Pages],[Description],[ISBN],p.[Name] AS [Publisher],[Year] FROM [dbo].[Infos] AS i
	JOIN [dbo].[Books] AS b ON i.[Id] = b.[Id]
	JOIN [dbo].[Publishers] AS p ON  p.[Id] = b.[PublisherId]
	JOIN [dbo].[Cities] AS c ON  c.[Id] = b.[CityId]
    WHERE i.[IsDeleted] = 0
