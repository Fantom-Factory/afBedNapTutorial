using afIoc
using afBedSheet

class AppModule {
	
	@Contribute { serviceType=Routes# }
	static Void contributeRoutes(Configuration config) {
		config.add(Route(`/`, IndexPage#render))
	}
}
