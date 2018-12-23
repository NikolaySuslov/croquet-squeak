pool initialization
initialize
	"GLExtConstants initialize"
	self class selectors do:[:each|
		(each ~~ #initialize and:[each beginsWith: 'initialize']) ifTrue:[
			self perform: each.
		].
	].