using afIoc::Inject
using afBedSheet::Text
using afEfan::Efan
using afEfan::EfanTemplate

const class ViewPage {
	@Inject private const Efan	efan
			private const EfanTemplate	template 
	
	new make(Efan efan, |This|in) {
		in(this) 
		efanFile := Pod.of(this).file(`/fan/pages/ViewPage.efan`) 
		template = efan.compileFromFile(efanFile, Visit#)
	}
	
	Text render(Visit visit) {
		html := template.render(visit)
		return Text.fromHtml(html)
	}
}
