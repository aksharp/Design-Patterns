###
Design Pattern:		Facade
Type:				Structural
Definition:			Provide a unified interface to a set of interfaces in a subsystem. 
					Facade defines a higher-level interface that makes the subsystem easier to use.
###

class Customer
	constructor: (@name) ->

class Bank
	@hasSufficientSavings: (customer, amount) ->
		console.log "\t Check bank for #{customer.name}"
		true

class Credit
	@hasGoodCredit: (customer) ->
		console.log "\t Check credit for #{customer.name}"
		true

class Loan
	@hasNoBadLoans: (customer) ->
		console.log "\t Check loans for #{customer.name}"
		true

class Mortgage
	isEligible: (customer, amount) ->
		console.log "#{customer.name} applies for $#{amount} loan"
		
		Bank.hasSufficientSavings(customer, amount) and Credit.hasGoodCredit(customer) and Loan.hasNoBadLoans(customer)

### 
Usage
###

mortgage = new Mortgage()
customer = new Customer("Jack London")
eligible = mortgage.isEligible(customer, 300000)
console.log "#{customer.name} has been #{if eligible then 'approved' else 'declined'}"