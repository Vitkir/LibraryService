using System.Collections.Generic;

namespace Library.Catalog.Api.Models
{
	public class CatalogModel
	{
		public List<BookModel> Books { get; set; }
		public List<NewspaperModel> Newspapers { get; set; }
		public List<PatentModel> Patents { get; set; }
	}
}
