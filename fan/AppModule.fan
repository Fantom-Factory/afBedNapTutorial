using afIoc
using afBedSheet

const class AppModule {
	
	@Contribute { serviceType=Routes# }
	Void contributeRoutes(Configuration config) {
		config.add(Route(`/`, IndexPage#render))
	}
}
