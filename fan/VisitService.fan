using afIoc
using afConcurrent

const class VisitService {
	@Inject { id="bednap.visits"; type=Visit[]# }
	private const SynchronizedList	visits

	new make(|This| f) { f(this) }
	
	Visit[] all() {
		visits.list
	}

	Void save(Visit visit) {
		visits.add(visit)
	}
}
