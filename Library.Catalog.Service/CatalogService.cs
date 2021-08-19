using Library.Catalog.Core.Contracts;
using Library.Catalog.Core.Dto;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Library.Catalog.Service
{
	public class CatalogService : ICatalogService
	{
		private readonly ILogger<CatalogService> logger;
		private readonly ICatalogRepository catalogRepository;

		public CatalogService(ILogger<CatalogService> logger, ICatalogRepository catalogRepository)
		{
			this.logger = logger ?? throw new ArgumentNullException(nameof(logger));
			this.catalogRepository = catalogRepository ?? throw new ArgumentNullException(nameof(catalogRepository));
		}

		public async Task<List<EntryDto>> SearchByNameAsync(string name)
		{
			return await catalogRepository.FindByNameAsync(name);
		}
	}
}
