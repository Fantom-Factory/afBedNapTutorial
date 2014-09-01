using concurrent
using afIoc
using afBedSheet
using afEfanXtra

class AppModule {

	static Void bind(ServiceBinder binder) {
		binder.bind(VisitService#)
	}
	
	@Contribute { serviceType=Routes# }
	static Void contributeRoutes(Configuration config) {
		config.add(Route(`/`,		 PageRoutes#renderIndexPage))
		config.add(Route(`/view/**`, PageRoutes#renderViewPage))
	}

	@Contribute { serviceType=EfanLibraries# }
	static Void contributeEfanLibs(Configuration config) {
		config["app"] = Pod.find("bednap")
	}
	
	@Contribute { serviceType=ValueEncoders# }
	static Void contributeValueEncoders(Configuration config) {
		config[Visit#] = config.autobuild(VisitEncoder#)
	}
	
	@Contribute { serviceType=ActorPools# }
	static Void contributeActorPools(Configuration config) {
		config["bednap.visits"] = ActorPool() { it.name = "bednap.visits"; it.maxThreads = 1 }
	}
	
	@Contribute { serviceType=RegistryStartup# }
	static Void contributeRegistryStartup(Configuration config, VisitService visitService) {
		config["bednap.createSampleData"] = |->| { 
			visitService.save(Visit("Traci Lords",		Date(1986, Month.feb, 22), 5, "Loved the free back massage and exfoliating strawberry scrub!"))
			visitService.save(Visit("Ginger Lynn", 		Date(1996, Month.mar, 23), 3, "Room was large and clean but average."))
			visitService.save(Visit("Vanessa del Rio",	Date(2006, Month.apr, 24), 1, "Terrible. Occupants of the local prison have a better view."))
		}
	}
}
