using System.Collections.Generic;

namespace Library.Catalog.Core.Dto
{
	public class CatalogDto
	{
		public List<EntryDto> Entries { get; set; }
		public List<AuthorDto> Authors { get; set; }
	}
}
