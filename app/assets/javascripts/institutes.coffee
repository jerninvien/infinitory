jQuery ->
	# if gon?
	test = {"name":"Renner-Kirlin","children":[{"name":"ryan.beer@marksroob.name","size":8},{"name":"kali_zemlak@ruecker.info","size":12},{"name":"kaelyn@bayerschneider.biz","size":6},{"name":"tiffany@thompson.net","size":12},{"name":"O'Kon Group","children":[{"name":"agnes@schmeler.com","size":12},{"name":"broderick@lebsack.biz","size":12},{"name":"flo_damore@krishansen.biz","size":8},{"name":"orion@champlin.biz","size":6},{"name":"bonnie.bechtelar@robel.name","size":10},{"name":"sammy_bashirian@rosenbaum.biz","size":9}]},{"name":"Schoen-Cummings","children":[{"name":"gladyce_runolfsdottir@kris.name","size":12},{"name":"price@goyettetowne.net","size":6},{"name":"elmo.rosenbaum@swaniawski.com","size":10},{"name":"kurt.kunde@hagenesbatz.com","size":11},{"name":"devonte_connelly@stromanschneider.org","size":13}]}],"labs":[{"name":"ryan.beer@marksroob.name","size":8},{"name":"kali_zemlak@ruecker.info","size":12},{"name":"kaelyn@bayerschneider.biz","size":6},{"name":"tiffany@thompson.net","size":12}]}	
	myFlower = new CodeFlower("#visualization", 350, 350)
	myFlower.update(test)

	console.log test