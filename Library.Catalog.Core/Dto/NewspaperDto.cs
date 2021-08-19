using System;

namespace Library.Catalog.Core.Dto
{
	public class NewspaperDto
	{
		public string Name { get; set; }
		public string City { get; set; }
		public string Publisher { get; set; }
		public string Year { get; set; }
		public int Pages { get; set; }
		public string Description { get; set; }
		public int Number { get; set; }
		public DateTime Date { get; set; }
		public string ISSN { get; set; }
	}
}
