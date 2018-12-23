private
filteredMessages
	self haltOnce.
	^ self messages inject: OrderedCollection new into: [:coll :each |
		((self testClass: each) and:
		[self testSeverity: each] and:
		[self testFilter: each])
		ifTrue: [coll add: each value value].
		coll
	]