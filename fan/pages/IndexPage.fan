using afIoc::Inject
using afBedSheet::Text
using afEfan::Efan

const class IndexPage {
	@Inject private const VisitService	visitService
	@Inject private const Efan 			efan
	
	new make(|This|in) { in(this) }
	
	Text render() {
		ctx  := visitService.all
		file := Pod.of(this).file(`/fan/pages/IndexPage.efan`) 
		html := efan.renderFromFile(file, ctx)
		return Text.fromHtml(html)
	}
}