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


target = new Adapter
target.request()

