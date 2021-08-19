using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Library.Catalog.Api.Models
{
	public class PatentModel
	{
		public string Name { get; set; }
		public List<AuthorModel> Authors { get; set; }
		public string Country { get; set; }
		public int RegistrationNumber { get; set; }
		public DateTime FillingDate { get; set; }
		public DateTime PublicationDate { get; set; }
		public int Pages { get; set; }
		public string Description { get; set; }
	}
}
