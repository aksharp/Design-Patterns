###
Design Pattern:		Decorator
Type:				Structural
Definition:			Attach additional responsibilities to an object dynamically. 
					Decorators provide a flexible alternative to subclassing for extending functionality. 
###

class Book
	constructor: (@author, @title, @numCopies) ->

	display: ->
		console.log "Book"
		console.log " Author: #{@author}"
		console.log " Title: #{@title}"
		console.log " # Copies: #{@numCopies}"

class Video
	constructor: (@director, @title, @numCopies, @playTime) ->

	display: ->
		console.log "Video"
		console.log " Director: #{@director}"
		console.log " Title: #{@title}"
		console.log " # Copies: #{@numCopies}"
		console.log " Play Time: #{@playTime}"

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
		@[t..t] = [] if (t = @.indexOf(borrower)) > -1
	
	borrowItem: (name) ->
		@addBorrower name
		@libraryItem.numCopies--

	returnItem: (name) ->
		@removeBorrower name
		@libraryItem.numCopies++

	display: ->
		super()
		console.log borrower for borrower in @borrowers

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
