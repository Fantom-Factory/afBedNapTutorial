using afIoc::Inject
using afEfanXtra::EfanComponent
using afPillow::Page

@Page
const mixin IndexPage : EfanComponent {
	@Inject abstract VisitService visitService	
}
