using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Library.Catalog.Core.Contracts
{
	public interface ICatalogService
	{
		async Task<CatalogModel> SearchByNameAsync(string name)
	}
}
