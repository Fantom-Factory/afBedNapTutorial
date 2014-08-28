using afConcurrent
using afIoc

const class VisitService {
	private const SynchronizedList	visits
	
	new make(ActorPools actorPools) { 
		visits = SynchronizedList(actorPools["bednap.visits"]) { it.listType = Visit# }
	}
	
	Visit[] all() {
		visits.list
	}

	Void save(Visit visit) {
		visits.add(visit)
	}
}
