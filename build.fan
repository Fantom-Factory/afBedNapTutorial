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
			"sys        1.0", 
			"concurrent 1.0", 
			"web        1.0", 

			"afConcurrent 1.0.14 - 1.0",
			"afIoc        3.0.2  - 3.0",
			"afBedSheet   1.5.2  - 1.5"
		]

		srcDirs = [`fan/`, `fan/pages/`]
		resDirs = [,]
	}
}
