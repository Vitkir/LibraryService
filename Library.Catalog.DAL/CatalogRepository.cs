using Library.Catalog.Core.Contracts;
using Library.Catalog.Core.Dto;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Library.Catalog.DAL
{
	public class CatalogRepository : ICatalogRepository
	{
		private readonly ILogger<CatalogRepository> logger;
		private readonly IConfiguration configuration;

		public CatalogRepository(ILogger<CatalogRepository> logger,
			IConfiguration configuration)
		{
			this.logger = logger ?? throw new ArgumentNullException(nameof(logger));
			this.configuration = configuration ?? throw new ArgumentNullException(nameof(configuration));
		}

		public async Task<List<EntryDto>> FindByNameAsync(string name)
		{
			var entries = new List<EntryDto>();
			var entryAuthors = new List<KeyValuePair<int, int>>();
			var authors = new List<AuthorDto>();

			using (SqlConnection connection = new SqlConnection(configuration.GetConnectionString("Default")))
			{
				var command = connection.CreateCommand();
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.Add(new SqlParameter("name", name));

				connection.Open();

				var reader = await command.ExecuteReaderAsync();
				while (reader.Read())
				{
					var entry = new EntryDto
					{
						Id = (int)reader["Id"],
						Name = (string)reader["Name"],
						Pages = (int)reader["Pages"],
						Description = (string)reader["Description"],
						City = (string)reader["City"],
						Country = (string)reader["Country"],
						Publisher = (string)reader["Publisher"],
						Year = (string)reader["Year"],
						ISBN = (string)reader["ISBN"],
						ISSN = (string)reader["ISSN"],
						Number = (int)reader["Number"],
						RegistrationNumber = (int)reader["RegistrationNumber"],
						Date = (DateTime)reader["Date"],
						FillingDate = (DateTime)reader["FillingDate"],
						PublicationDate = (DateTime)reader["PublicationDate"],
						Type = (EntryTypes)reader["Type"],
					};
					entries.Add(entry);
				}

				await reader.NextResultAsync();
				while (reader.Read())
				{
					entryAuthors.Add(new KeyValuePair<int, int>((int)reader["InfoId"], (int)reader["AuthorId"]));
				}

				await reader.NextResultAsync();
				while (reader.Read())
				{
					var author = new AuthorDto
					{
						Id = (int)reader["Id"],
						Name = (string)reader["Name"],
						Surname = (string)reader["Surname"],
					};
					authors.Add(author);
				}
			}
			return CombineEntriesAndAuthors(entries, authors, entryAuthors);
		}

		public List<EntryDto> CombineEntriesAndAuthors(List<EntryDto> entries, List<AuthorDto> authors, List<KeyValuePair<int, int>> entryAuthors)
		{
			foreach (var item in entries)
			{
				var authorIds = entryAuthors.Where(x => x.Key == item.Id).Select(x => x.Value);
				item.Authors.AddRange(authors.Where(x => authorIds.Contains(x.Id)));
			}
			return entries;
		}
	}
}
