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

			"afIoc 1.7",
			"afBedSheet 1.3"
		]

		srcDirs = [`test/`, `fan/`, `fan/pages/`]
		resDirs = [,]
	}
}
