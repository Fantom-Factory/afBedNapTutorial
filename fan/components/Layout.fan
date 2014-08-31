using afIoc::Inject
using afBedSheet::Text
using afEfan::Efan
using afEfan::EfanTemplate

class Layout {
	// ---- Boilerplate Code --------------------

	private EfanTemplate	template 
	
	new make(Efan efan) {
		templateFile := Pod.of(this).file(`/fan/components/Layout.efan`) 
		template = efan.compileFromFile(templateFile, Layout#)
	}
	
	Text render() {
		html := template.render(this)
		return Text.fromHtml(html)
	}



	// ---- Layout Specific Code ----------------
	
	Str? title

	Void initRender(Str title) {
		this.title = title
	}
}
