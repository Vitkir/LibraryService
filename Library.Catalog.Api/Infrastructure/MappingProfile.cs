using AutoMapper;
using Library.Catalog.Api.Models;
using Library.Catalog.Core.Dto;

namespace Library.Catalog.Api.Infrastructure
{
	public class MappingProfile : Profile
	{
		public MappingProfile()
		{
			CreateMap<AuthorDto, AuthorModel>();
			CreateMap<EntryDto, EntryModel>();
		}
	}
}
