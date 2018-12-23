as yet unclassified
acceptance

	self log error test: 1.
	self log this.
	self log test: 3.
	self log myown test: 4.
	self log error myown  test: 5.

	^ self output	
"
self new acceptance.
"  