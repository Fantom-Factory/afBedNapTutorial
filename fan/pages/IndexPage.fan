using afBedSheet

const class IndexPage {
	
	Text render() {
		html := """<!DOCTYPE html>
		           <html>
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