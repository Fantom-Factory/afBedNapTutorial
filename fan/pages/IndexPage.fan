using afIoc
using afBedSheet
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
		
		html.table
		html.tr
		html.th.w("Name").thEnd
		html.th.w("Date").thEnd
		html.th.w("Rating").thEnd
		html.trEnd
		
		visitService.all.each {
			html.tr
			html.td.w(it.name).tdEnd
			html.td.w(it.date).tdEnd
			html.td.w(it.rating).tdEnd
			html.trEnd			
		}

		html.tableEnd
		html.bodyEnd		
		html.htmlEnd

		return Text.fromHtml(htmlBuf.toStr)
	}
}