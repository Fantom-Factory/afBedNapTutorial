using concurrent::AtomicInt
using afConcurrent::SynchronizedMap
using afIoc::Inject

const class VisitService {
	@Inject { id="bednap.visits"; type=Int:Visit# }
    private const SynchronizedMap	visits
	private const AtomicInt			lastId := AtomicInt()

	new make(|This| f) { f(this) }
	
	Visit[] all() {
		visits.vals
	}

	Visit save(Visit visit) {
		if (visit.id == null) {
			nextId := lastId.incrementAndGet
			visit   = Visit(visit.name, visit.date, visit.rating, visit.comment, nextId) 
		}

		visits[visit.id] = visit
		return visit
	}
	
	Visit get(Int id) {
		visits[id]
	}
}
