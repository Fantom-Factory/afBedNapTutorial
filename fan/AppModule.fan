using concurrent
using afConcurrent
using afIoc
using afBedSheet
using afEfan

const class AppModule {

	Void defineServices(RegistryBuilder bob) {
		bob.addService(VisitService#)
		bob.addService(Efan#)
	}
	
	@Contribute { serviceType=Routes# }
	Void contributeRoutes(Configuration config) {
		config.add(Route(`/`,		IndexPage#render))
		config.add(Route(`/view/**`, ViewPage#render))
	}
	
	@Contribute { serviceType=ValueEncoders# }
	Void contributeValueEncoders(Configuration config) {
		config[Visit#] = config.build(VisitEncoder#)
	}
	
	@Contribute { serviceType=ActorPools# }
	Void contributeActorPools(Configuration config) {
		config["bednap.visits"] = ActorPool() { it.name = "bednap.visits"; it.maxThreads = 1 }
	}
	
	Void onRegistryStartup(Configuration config, VisitService visitService) {
		config["bednap.createSampleData"] = |->| { 
			visitService.save(Visit("Traci Lords",		Date(1986, Month.feb, 22), 5, "Loved the free back massage and exfoliating strawberry scrub!"))
			visitService.save(Visit("Ginger Lynn", 		Date(1996, Month.mar, 23), 3, "Room was large and clean but average."))
			visitService.save(Visit("Vanessa del Rio",	Date(2006, Month.apr, 24), 1, "Terrible. Occupants of the local prison have a better view."))
		}
	}
}
