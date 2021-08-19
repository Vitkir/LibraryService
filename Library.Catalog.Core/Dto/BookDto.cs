using System.Collections.Generic;

namespace Library.Catalog.Core.Dto
{
	public class BookDto
	{
		public string Name { get; set; }
		public List<AuthorDto> Authors { get; set; }
		public string City { get; set; }
		public string Publisher { get; set; }
		public string Year { get; set; }
		public int Pages { get; set; }
		public string Description { get; set; }
		public string ISBN { get; set; }
	}
}
