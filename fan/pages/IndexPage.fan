using afIoc::Inject
using afBedSheet::Text
using afEfan::Efan
using afEfan::EfanTemplate

const class IndexPage {
	@Inject private const VisitService	visitService
			private const EfanTemplate	template 
	
	new make(Efan efan, |This|in) {
		in(this) 
		efanFile := Pod.of(this).file(`/fan/pages/IndexPage.efan`) 
		template = efan.compileFromFile(efanFile, Visit[]#)
	}
	
	Text render() {
		ctx  := visitService.all
		html := template.render(ctx)
		return Text.fromHtml(html)
	}
}