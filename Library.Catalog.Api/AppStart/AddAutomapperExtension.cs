using AutoMapper;
using Library.Catalog.Api.Infrastructure;
using Microsoft.Extensions.DependencyInjection;

namespace Library.Catalog.Api.AppStart
{
	public static class AddAutomapperExtension
	{
		public static void AddAutoMapper(this IServiceCollection services)
		{
			var mappingConfig = new MapperConfiguration(c =>
			{
				c.AddProfile(new MappingProfile());
			});

			IMapper mapper = mappingConfig.CreateMapper();
			services.AddSingleton(mapper);
		}
	}
}
