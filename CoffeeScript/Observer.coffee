###
Design Pattern:		Observer
Type:				Behavioral
Definition:			Define a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically. 
###

class Stock
	constructor: (@symbol, @price) ->

	investors: []

	add: (investor) ->
		@investors.push investor

	remove: (investor) ->
		@investors[t..t] = [] if (t = @investors.indexOf(investor)) > -1

	attach: (investor) ->
		@add investor

	detach: (investor) ->
		@remove investor

	notify: ->
		investor.update @ for investor in @investors

	getPrice: ->
		@price

	setPrice: (price) ->
		@price = price
		@notify()

class APPL extends Stock
	constructor: (symbol, price) ->
		super()
	

class Investor
	constructor: (@name) ->

	update: (stock) ->		
		console.log "Notified #{@name} of #{stock.symbol} change to $#{stock.getPrice()}"


### 
Usage
###

appl = new APPL "APPL", 240.00
tim = new Investor "Tim Morse"
appl.attach tim
appl.attach new Investor "Bill Gates"
appl.attach new Investor "Sergey Brin"
appl.setPrice 240.50
appl.setPrice 230.00
appl.detach tim
appl.setPrice 260.00
