###
Design Pattern:		Bridge
Type:				Structural
Definition:			Decouple an abstraction from its implementation so that the two can vary independently.
###

class Implementor
	operation: -> null

class ConcreteImplementorA extends Implementor
	operation: ->
		console.log "ConcreteImplementorA operation"
		
class ConcreteImplementorB extends Implementor
	operation: ->
		console.log "ConcreteImplementorB operation"

class Abstraction
	implementor: null
	operation: ->
		@implementor.operation()

class RefinedAbstraction extends Abstraction
	operation: ->
		@implementor.operation()

### 
Usage
###

ab = new RefinedAbstraction

ab.implementor = new ConcreteImplementorA
ab.operation()

ab.implementor = new ConcreteImplementorB
ab.operation()

