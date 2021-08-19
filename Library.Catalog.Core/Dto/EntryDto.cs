using System;
using System.Collections.Generic;

namespace Library.Catalog.Core.Dto
{
	public class EntryDto
	{
		public int Id { get; set; }
		public string Name { get; set; }
		public string City { get; set; }
		public string Publisher { get; set; }
		public string Year { get; set; }
		public int Pages { get; set; }
		public string Description { get; set; }
		public string ISBN { get; set; }
		public int Number { get; set; }
		public DateTime Date { get; set; }
		public string ISSN { get; set; }
		public string Country { get; set; }
		public int RegistrationNumber { get; set; }
		public DateTime FillingDate { get; set; }
		public DateTime PublicationDate { get; set; }
		public EntryTypes Type { get; set; }
		public List<AuthorDto> Authors { get; set; }
	}
}
