using afIoc::Inject
using afBounce::Element

class TestViewPage : WebTest {

	@Inject VisitService? visitService
	
	Void testDetailsAreShown() {
		// given
		visit := Visit("Butcher", Date(1969, Month.mar, 23), 5, "Sausages", 8)
		visitService.save(visit)
		
		// when
		client.get(`/view/8`)

		// then
		Element(".t-name"   ).verifyTextEq("Butcher said:")
		Element(".t-comment").verifyTextEq("Sausages")
		Element(".t-date"   ).verifyTextEq("on 1969-03-23")
		Element(".t-rate"   ).verifyTextEq("5 / 5 stars")		
	}
}
