using afIoc::Inject
using afEfanXtra::EfanComponent
using afPillow::Pages
using afPillow::Page

@Page
const mixin IndexPage : EfanComponent {
	@Inject abstract VisitService	visitService
	@Inject abstract Pages			pages
	
	Uri viewUrl(Visit visit) {
		pages.pageMeta(ViewPage#, [visit]).pageUrl
	}
}
