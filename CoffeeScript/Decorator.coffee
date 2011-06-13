###
Design Pattern:		Decorator
Type:				Structural
Definition:			Attach additional responsibilities to an object dynamically. 
					Decorators provide a flexible alternative to subclassing for extending functionality. 
###

class Book
	constructor: (@author, @title, @numCopies) ->

	display: ->
		console.log """Book
		\t Author: #{@author}
		\t Title: #{@title}
		\t # Copies: #{@numCopies}"""

class Video
	constructor: (@director, @title, @numCopies, @playTime) ->

	display: ->
		console.log """Video
		 \t Director: #{@director}
		 \t Title: #{@title}
		 \t # Copies: #{@numCopies}
		 \t Play Time: #{@playTime}"""

class Decorator
	constructor: (@libraryItem) ->
	
	display: ->
		@libraryItem.display()

class Borrowable extends Decorator
	constructor: (@libraryItem) ->

	borrowers: []

	addBorrower: (borrower) ->
		@borrowers.push borrower

	removeBorrower: (borrower) ->
		@borrowers[t..t] = [] if (t = @borrowers.indexOf(borrower)) > -1
	
	borrowItem: (name) ->
		@addBorrower name
		@libraryItem.numCopies--

	returnItem: (name) ->
		@removeBorrower name
		@libraryItem.numCopies++

	display: ->
		super()
		console.log "Borrowers: \n\t #{borrower for borrower in @borrowers}"

### 
Usage
###

book = new Book("Dostoevsky", "Crime and punishment", 5)
book.display()

video = new Video("JJ Abrams", "Star Trek", 17, 126)
video.display()

console.log "Making video borrowable:"

borrowVideo = new Borrowable(video)
borrowVideo.borrowItem("Customer #1")
borrowVideo.borrowItem("Customer #2")

borrowVideo.display()
