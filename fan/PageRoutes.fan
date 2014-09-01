using afIoc::Inject
using afBedSheet::Text
using afEfanXtra::EfanXtra

const class PageRoutes {
	@Inject private const EfanXtra efanXtra
	
	new make(|This|in) { in(this) }
	
	Text renderIndexPage() {
		html := efanXtra.component(IndexPage#).render
		return Text.fromHtml(html)
	}

	Text renderViewPage(Visit visit) {
		html := efanXtra.component(ViewPage#).render([visit])
		return Text.fromHtml(html)
	}
}
