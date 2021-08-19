using System;
using System.Collections.Generic;

namespace Library.Catalog.Core.Dto
{
	public class PatentDto
	{
		public string Name { get; set; }
		public List<AuthorDto> Authors { get; set; }
		public string Country { get; set; }
		public int RegistrationNumber { get; set; }
		public DateTime FillingDate { get; set; }
		public DateTime PublicationDate { get; set; }
		public int Pages { get; set; }
		public string Description { get; set; }
	}
}
