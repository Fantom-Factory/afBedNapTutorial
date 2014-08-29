using afBedSheet::Text
using web::WebOutStream

const class ViewPage {
	
	Text render(Visit visit) {
		htmlBuf := StrBuf()
		html	:= WebOutStream(htmlBuf.out)
		
		html.docType5
		html.html
		html.head
		html.title.w("Bed Nap View Page").titleEnd
		html.headEnd
		html.body
		
		html.h1.w("Bed Nap Tutorial").h1End
		html.h2.w("Visit View Page").h2End
		
		html.div("class='t-name'").w("${visit.name} said:").divEnd
		html.div("class='t-comment'").w(visit.comment).divEnd
		html.div("class='t-date'").w("on ${visit.date}").divEnd
		html.div("class='t-rate'").w("${visit.rating} / 5 stars").divEnd
		
		html.div
		html.a(`/`).w("&lt; Back").aEnd
		html.divEnd
		
		html.bodyEnd		
		html.htmlEnd

		return Text.fromHtml(htmlBuf.toStr)
	}
}
