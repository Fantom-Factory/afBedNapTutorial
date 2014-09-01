using afEfanXtra::InitRender
using afEfanXtra::EfanComponent
using afPillow::Page
using afPillow::PageContext

@Page
const mixin ViewPage : EfanComponent {
	@PageContext abstract Visit visit	
}
