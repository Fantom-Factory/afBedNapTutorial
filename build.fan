using build

class Build : BuildPod {

	new make() {
		podName = "bednap"
		summary = "The Bed Nap Tutorial"
		version = Version("1.0.0")

		meta = [
			"org.name"		: "Fantom-Factory",
			"org.uri"		: "http://www.fantomfactory.org/",

			"proj.name"		: "Bed Nap Tutorial",
			"afIoc.module"	: "bednap::AppModule"
		]

		depends = [
			"sys 1.0", 
			"concurrent 1.0", 
			"web 1.0", 

			// ---- Core ------------------------
			"afConcurrent 1.0",
			"afIoc 1.7",
			
			// ---- Web -------------------------
			"afBedSheet 1.3",
			
			// ---- Test ------------------------
			"afBounce 1.0"
		]

		srcDirs = [`test/`, `fan/`, `fan/pages/`]
		resDirs = [,]
	}
}
