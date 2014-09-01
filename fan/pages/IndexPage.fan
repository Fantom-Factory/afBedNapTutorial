using afIoc::Inject
using afEfanXtra::EfanComponent

const mixin IndexPage : EfanComponent {
	@Inject abstract VisitService visitService	
}
