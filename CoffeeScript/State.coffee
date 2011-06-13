###
Design Pattern:		State
Type:				Behavioral
Definition:			Allow an object to alter its behavior when its internal state changes. 
					The object will appear to change its class.
###

class State
	balance: null
	account: null
	interest: null
	lowerLimit: null
	upperLimit: null
	name: null

	deposit: (amount) ->
	withdraw: (amount) ->
	payInterest: ->

class RedState extends State
	constructor: (state) ->
		@balance = state.balance
		@account = state.account
		@initialize()
		@name = "Red State"

	initialize: ->
		@interest = 0.0
		@lowerLimit = -100.00
		@upperLimit = 0.0
		@serviceFee = 15.00

	deposit: (amount) ->
		@balance = @balance + amount
		@stateChangeCheck()

	withdraw: (amount) ->
		amount = amount - @serviceFee
		console.log "No funds available for withdrawal!"

	payInterest: ->
		
	stateChangeCheck: ->
		if @balance > @upperLimit then @account.state = new SilverState(@)

class SilverState extends State
	constructor: (one, two) ->
		switch arguments.length
			when 1
				@balance = one.balance
				@account = one.account
			when 2
				@balance = one
				@account = two
		@initialize()
		@name = "Silver State"

	initialize: ->
		@interest = 0.0
		@lowerLimit = 0.0
		@upperLimit = 1000.00

	deposit: (amount) ->
		@balance = @balance + amount
		@stateChangeCheck()

	withdraw: (amount) ->
		@balance = @balance - amount
		@stateChangeCheck()

	payInterest: ->
		@balance = @balance + @interest * @balance
		@stateChangeCheck()
		
	stateChangeCheck: ->
		if @balance < @lowerLimit then @account.state = new RedState(@) else 
		if (@balance > @upperLimit) then account.state = new GoldState(@)
		
class GoldState extends State
	constructor: (one, two) ->
		switch arguments.length
			when 1
				@balance = one.balance
				@account = one.account
			when 2
				@balance = one
				@account = two
		@initialize()
		@name = "Gold State"

	initialize: ->
		@interest = 0.05
		@lowerLimit = 1000.00
		@upperLimit = 1000000.00

	deposit: (amount) ->
		@balance = @balance + amount
		@stateChangeCheck()

	withdraw: (amount) ->
		@balance = @balance - amount
		@stateChangeCheck()

	payInterest: ->
		@balance = @balance + @interest * @balance
		@stateChangeCheck()

	stateChangeCheck: ->
		if @balance < 0.0 then @account.state = new RedState(@) else if @balance < @lowerLimit then @account.state = new SilverState(@)

class Account
	constructor: (@owner) ->
		@state = new SilverState(0.0, @)

	balance: ->
		@state.balance

	deposit: (amount) ->
		@state.deposit amount
		console.log """Deposited #{amount}
					\t Balance = #{@balance()}
					\t Status = #{@state.name}"""

	withdraw: (amount) ->
		@state.withdraw amount
		console.log """Withdrew #{amount}
					\t Balance = #{@balance()}
					\t Status = #{@state.name}"""

	payInterest: ->
		@state.payInterest
		console.log """Interest paid
					\t Balance = #{@balance()}
					\t Status = #{@state.name}"""

### 
Usage
###

account = new Account "Dave Smith"
account.deposit 500.0
account.deposit 300.0
account.deposit 550.0
account.payInterest();
account.withdraw 2000.00
account.withdraw 1100.00