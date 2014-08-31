using afIoc::Inject
using afBedSheet::Text
using afEfan::Efan
using afEfan::EfanTemplate

const class IndexPage {
	@Inject private const VisitService	visitService
			private const EfanTemplate	template
			private const EfanTemplate	layout
	
	new make(Efan efan, |This|in) {
		in(this) 
		templateFile := Pod.of(this).file(`/fan/pages/IndexPage.efan`) 
		template = efan.compileFromFile(templateFile, IndexPageCtx#)

		layoutFile := Pod.of(this).file(`/fan/pages/Layout.efan`) 
		layout   = efan.compileFromFile(layoutFile, Str#)
	}

	Text render() {
		ctx  := IndexPageCtx() { it.layout = this.layout; it.visits = visitService.all }
		html := template.render(ctx)
		return Text.fromHtml(html)
	}
}

class IndexPageCtx {
	EfanTemplate	layout
	Visit[]			visits
	
	new make(|This|in) { in(this) }
}