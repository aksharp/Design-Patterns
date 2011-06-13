###
Design Pattern:		Adapter
Type:				Structural
Definition:			Convert the interface of a class into another interface clients expect. 
					Adapter lets classes work together that couldn't otherwise because of incompatible interfaces.
###

class Target
	request: ->
		console.log "Called Target request()"

class Adaptee
	specificRequest: ->
		console.log "Called specificRequest()"

class Adapter extends Target
	request: ->
		adaptee = new Adaptee
		adaptee.specificRequest()

### 
Usage
###

target = new Adapter
target.request()