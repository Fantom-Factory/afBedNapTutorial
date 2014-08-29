
const class Visit {
	const Int?	id
	const Str	name
	const Date	date
	const Int	rating
	const Str	comment
	
	new make(Str name, Date date, Int rating, Str comment, Int? id := null) {
		this.id      = id
		this.name    = name
		this.date    = date
		this.rating  = rating
		this.comment = comment
	}
}
