using concurrent::AtomicInt
using afConcurrent::SynchronizedMap
using afIoc::ActorPools

const class VisitService {
	private const AtomicInt			lastId := AtomicInt()
	private const SynchronizedMap	visits
	
	new make(ActorPools actorPools) { 
		visits = SynchronizedMap(actorPools["bednap.visits"]) { it.keyType = Int#; it.valType = Visit# }
	}
	
	Visit[] all() {
		visits.vals
	}

	Void save(Visit visit) {
		if (visit.id == null) {
			nextId := lastId.incrementAndGet
			visit   = Visit(visit.name, visit.date, visit.rating, visit.comment, nextId) 
		}

		visits[visit.id] = visit
	}
	
	Visit get(Int id) {
		visits[id]
	}
}
