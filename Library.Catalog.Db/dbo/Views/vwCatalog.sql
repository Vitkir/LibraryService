
CREATE VIEW [dbo].[vwCatalog]
WITH SCHEMABINDING
AS
SELECT i.[Id],i.[Name],c.[City],pc.[Name] AS [Country],[Pages],[Description],[ISBN],[ISSN],bn.[Publisher],c.[Year],[RegistrationNumber],[FilingDate],[PublicationDate]  FROM [dbo].[Infos] AS i
	LEFT JOIN [dbo].[Books] AS b ON i.[Id] = b.[Id]
	LEFT JOIN [dbo].[Newspapers] AS n ON i.[Id] = n.[Id]
	LEFT JOIN (SELECT b.[Id],p.[Name] AS [Publisher],c.[Name] AS [City] FROM [dbo].[Books] AS b
                    LEFT JOIN [dbo].[Publishers] AS p ON p.[Id] = b.[PublisherId]
	                LEFT JOIN [dbo].[Cities] AS c ON  c.[Id] = b.[CityId]
                UNION 
                SELECT n.[Id],p.[Name] AS [Publisher],c.[Name] AS [City] FROM [dbo].[Newspapers] AS n
                    LEFT JOIN [dbo].[Publishers] AS p ON p.[Id] = n.[PublisherId]
	                LEFT JOIN [dbo].[Cities] AS c ON  c.[Id] = n.[CityId]) AS bn ON  i.[Id] = bn.[Id]
    LEFT JOIN (SELECT b.[Id],c.[Name] AS [City] ,[Year] FROM [dbo].[Books] AS b
	                LEFT JOIN [dbo].[Cities] AS c ON  c.[Id] = b.[CityId]
                UNION
                SELECT n.[Id],c.[Name] AS [City] ,[Year] FROM [dbo].[Newspapers] AS n
	                LEFT JOIN [dbo].[Cities] AS c ON  c.[Id] = n.[CityId]) AS c ON i.[Id] = c.[Id]
	LEFT JOIN [dbo].[Patents] AS p ON i.[Id] = p.[Id]
	LEFT JOIN [dbo].[Countries] AS pc ON  pc.[Id] = p.[CountryId]
    WHERE i.[IsDeleted] = 0
