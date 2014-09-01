using afEfanXtra::EfanComponent
using afEfanXtra::InitRender

const mixin Layout : EfanComponent{	
	abstract Str? title

	@InitRender
	Void initRender(Str title) {
		this.title = title
	}
}
