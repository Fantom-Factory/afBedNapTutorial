using afIoc
using afBounce::BedServer
using afBounce::BedClient

abstract class WebTest : Test {

	BedClient? client
	
	override Void setup() {
		server := BedServer(AppModule#).addModule(TestModule#).startup
		server.injectIntoFields(this)
		client = server.makeClient
	}
	
	override Void teardown() {
		client.shutdown
	}
}


class TestModule {
	@Contribute { serviceType=RegistryStartup# }
	static Void contributeRegistryStartup(Configuration config) {
		config.remove("bednap.createSampleData")
	}
}