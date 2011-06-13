###
Design Pattern:		Chain of Responsibility
Type:				Behavioral
Definition:			Avoid coupling the sender of a request to its receiver by giving more than one object a chance to handle the request. 
					Chain the receiving objects and pass the request along the chain until an object handles it. 
###

class Handler
	successor: "test"

	handle: (request) ->
		console.log "abstract handle method"

	getName: ->
		"Abstract Handler"

	getMessage: ->
		console.log "#{@getName()} handled #{request}"



class ConcreteHandler1 extends Handler
	handle: (request) ->
		if (request >=0 and request < 10)
			@getMessage()
		else if @successor?
			@successor.handle request

	getName: ->
		"Concrete Handler 1"


class ConcreteHandler2 extends Handler
	handle: (request) ->
		if (request >=10 and request < 20)
			@getMessage()
		else if @successor?
			@successor.handle request

	getName: ->
		"Concrete Handler 2"

class ConcreteHandler3 extends Handler
	handle: (request) ->
		if (request >=20 and request < 30)
			@getMessage()
		else if successor?
			@successor.handle request

	getName: ->
		"Concrete Handler 3"

### 
Usage
###

h1 = new ConcreteHandler1()
h2 = new ConcreteHandler2()
h3 = new ConcreteHandler3()
h1.successor = h2
h2.successor = h3

requests = [1, 7, 10, 18, 21, 2, 9, 22, 25]

h1.handle request for request in requests 
