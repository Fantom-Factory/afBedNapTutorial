using afIoc::Inject
using afBedSheet::ValueEncoder

const class VisitEncoder : ValueEncoder {

	@Inject private const VisitService visitService
	
	new make(|This|in) { in(this) }

	override Str toClient(Obj? value) {
		visit := (Visit) value
		return visit.id.toStr
	}

	override Obj? toValue(Str clientValue) {
		id := clientValue.toInt
		return visitService.get(id)
	}
}
