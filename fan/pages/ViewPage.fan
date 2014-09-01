using afIoc::Inject
using afEfanXtra::InitRender
using afEfanXtra::EfanComponent
using afPillow::Page
using afPillow::Pages
using afPillow::PageContext

@Page
const mixin ViewPage : EfanComponent {
	@PageContext	abstract Visit	visit	
	@Inject 		abstract Pages	pages
}
