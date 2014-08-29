using afIoc::Inject
using afBedSheet::Text
using web::WebOutStream

const class IndexPage {
	
	@Inject private const VisitService visitService
	
	new make(|This|in) { in(this) }
	
	Text render() {
		htmlBuf := StrBuf()
		html	:= WebOutStream(htmlBuf.out)
		
		html.docType5
		html.html
		html.head
		html.title.w("Bed Nap Index Page").titleEnd
		html.headEnd
		html.body
		
		html.h1.w("Bed Nap Tutorial").h1End
		html.h2.w("Summary Page").h2End
		
		html.table
		html.tr
		html.th.w("Name").thEnd
		html.th.w("Date").thEnd
		html.th.w("Rating").thEnd
		html.th.thEnd
		html.trEnd
		
		visitService.all.each {
			html.tr
			html.td("class='t-name'").w(it.name).tdEnd
			html.td("class='t-date'").w(it.date).tdEnd
			html.td("class='t-rate'").w(it.rating).tdEnd
			html.td
			html.a(`/view/${it.id}`, "class='t-view'").w("view").aEnd
			html.tdEnd
			html.trEnd
		}

		html.tableEnd
		html.bodyEnd		
		html.htmlEnd

		return Text.fromHtml(htmlBuf.toStr)
	}
}