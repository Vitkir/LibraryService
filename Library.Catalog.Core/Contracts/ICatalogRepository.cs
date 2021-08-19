using Library.Catalog.Core.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Library.Catalog.Core.Contracts
{
	public interface ICatalogRepository
	{
		Task<List<EntryDto>> FindByNameAsync(string name);
	}
}
