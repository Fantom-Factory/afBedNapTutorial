using afIoc::Inject
using afBedSheet::Text
using afEfan::Efan
using afEfan::EfanTemplate

const class ViewPage {
	private const EfanTemplate	template 
	private const EfanTemplate	layout

	new make(Efan efan) {
		templateFile := Pod.of(this).file(`/fan/pages/ViewPage.efan`) 
		template = efan.compileFromFile(templateFile, ViewPageCtx#)

		layoutFile := Pod.of(this).file(`/fan/pages/Layout.efan`) 
		layout   = efan.compileFromFile(layoutFile, Str#)
	}
	
	Text render(Visit visit) {
		ctx  := ViewPageCtx() { it.layout = this.layout; it.visit = visit }
		html := template.render(ctx)
		return Text.fromHtml(html)
	}
}

class ViewPageCtx {
	EfanTemplate	layout
	Visit			visit
	
	new make(|This|in) { in(this) }
}