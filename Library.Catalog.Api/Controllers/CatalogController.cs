using AutoMapper;
using Library.Catalog.Api.Models;
using Library.Catalog.Core.Contracts;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Library.Catalog.Api.Controllers
{
	[AllowAnonymous]
	[ApiController]
	[Route("api/catalog")]
	public class CatalogController : ControllerBase
	{
		private readonly ILogger<CatalogController> _logger;
		private readonly ICatalogService catalogService;
		private readonly IMapper mapper;

		public CatalogController(ILogger<CatalogController> logger,
			ICatalogService catalogService,
			IMapper mapper)
		{
			_logger = logger ?? throw new ArgumentNullException(nameof(logger));
			this.catalogService = catalogService ?? throw new ArgumentNullException(nameof(catalogService));
			this.mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
		}

		[HttpGet]
		[Route("/search/{name}")]
		public async Task<List<EntryModel>> SearchByNameAsync(string name)
		{
			var collection = await catalogService.SearchByNameAsync(name);
			return mapper.Map<List<EntryModel>>(collection);
		}
	}
}
