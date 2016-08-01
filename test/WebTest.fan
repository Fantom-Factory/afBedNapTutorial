using afIoc
using afBounce::BedServer
using afBounce::BedClient

abstract class WebTest : Test {

	BedClient? client
	
	override Void setup() {
		server := BedServer("bednap").addModule(TestModule#).startup
		server.inject(this)
		client = server.makeClient
	}
	
	override Void teardown() {
		client.shutdown
	}
}


const class TestModule {
	Void onRegistryStartup(Configuration config) {
		config.remove("bednap.createSampleData")
	}
}