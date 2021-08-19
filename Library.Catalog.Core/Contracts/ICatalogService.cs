using Library.Catalog.Core.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Library.Catalog.Core.Contracts
{
	public interface ICatalogService
	{
		Task<List<EntryDto>> SearchByNameAsync(string name);
	}
}
