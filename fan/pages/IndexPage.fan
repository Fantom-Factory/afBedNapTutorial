using afIoc::Inject
using afBedSheet::Text
using afEfan::Efan
using afEfan::EfanTemplateMeta

const class IndexPage {
	@Inject private const VisitService		visitService
			private const EfanTemplateMeta	template
			private const EfanTemplateMeta	layout
	
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
	EfanTemplateMeta	layout
	Visit[]				visits
	
	new make(|This|in) { in(this) }
}