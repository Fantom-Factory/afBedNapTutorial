using afIoc::Inject
using afBedSheet::Text
using afEfan::Efan

const class ViewPage {
	@Inject private const Efan	efan
	
	new make(|This|in) { in(this) }
	
	Text render(Visit visit) {
		file := Pod.of(this).file(`/fan/pages/ViewPage.efan`) 
		html := efan.renderFromFile(file, visit)
		return Text.fromHtml(html)
	}
}
