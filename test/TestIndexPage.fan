using afIoc::Inject
using afBounce::Element
using afBounce::Link

class TestIndexPage : WebTest {

	@Inject VisitService? visitService
	
	Void testMultipleVisitSummariesAreShown() {
		// given
		visit1 := visitService.save(Visit("User 1", Date(2000, Month.jan, 1), 1, "", 1))
		visit2 := visitService.save(Visit("User 2", Date(2000, Month.jan, 2), 2, "", 2))
		visit3 := visitService.save(Visit("User 3", Date(2000, Month.jan, 3), 3, "", 3))

		// when
		client.get(`/`)

		// then
		Element(".t-name")[0].verifyTextEq("User 1")
		Element(".t-date")[0].verifyTextEq("2000-01-01")
		Element(".t-rate")[0].verifyTextEq("1")

		Element(".t-name")[1].verifyTextEq("User 2")
		Element(".t-date")[1].verifyTextEq("2000-01-02")
		Element(".t-rate")[1].verifyTextEq("2")

		Element(".t-name")[2].verifyTextEq("User 3")
		Element(".t-date")[2].verifyTextEq("2000-01-03")
		Element(".t-rate")[2].verifyTextEq("3")
	}
	
	Void testViewPageLink() {
		// given
		visit := visitService.save(Visit("Emma", Date(1969, Month.mar, 23), 5, "Sausages", 8))

		// when
		client.get(`/`)
		Link(".t-view").click
		
		// then
		// check we're on the right page
		Element("title").verifyTextEq("Bed Nap View Page")
		
		// check the right details are displayed
		Element(".t-name").verifyTextContains("Emma")
	}
}
