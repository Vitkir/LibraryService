using System.Collections.Generic;

namespace Library.Catalog.Core.Dto
{
	public class CatalogDto
	{
		public List<BookDto> Books { get; set; }
		public List<NewspaperDto> Newspapers { get; set; }
		public List<PatentDto> Patents { get; set; }
	}
}
