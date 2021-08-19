using Library.Catalog.Api.Models;
using Library.Catalog.Core.Contracts;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Threading.Tasks;

namespace Library.Catalog.Api.Controllers
{
	[ApiController]
	[Route("api/catalog")]
	public class CatalogController : ControllerBase
	{
		private readonly ILogger<CatalogController> _logger;
		private readonly ICatalogService catalogService;

		public CatalogController(ILogger<CatalogController> logger, 
			ICatalogService catalogService)
		{
			_logger = logger ?? throw new ArgumentNullException(nameof(logger));
			this.catalogService = catalogService ?? throw new ArgumentNullException(nameof(catalogService));
		}

		[HttpGet]
		[Route("/search/{name}")]
		public async Task<CatalogModel> SearchByNameAsync(string name)
		{
			throw new NotImplementedException();
		}
	}
}
