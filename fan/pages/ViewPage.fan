using afEfanXtra::InitRender
using afEfanXtra::EfanComponent
using afPillow::Page

@Page
const mixin ViewPage : EfanComponent {
	abstract Visit visit
	
	@InitRender
	Void initRender(Visit visit) {
		this.visit = visit
	}
}
