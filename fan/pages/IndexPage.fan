using afBedSheet

class IndexPage {
	
	Text render() {
		html := """<html>
		           <head>
		           </head>
		           <body>
		               <h1>Bed Nap Tutorial</h1>
		           </body>
		           </html>
		           """
		return Text.fromHtml(html)
	}
}