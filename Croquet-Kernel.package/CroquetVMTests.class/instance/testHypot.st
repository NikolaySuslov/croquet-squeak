float tests
testHypot
	| hash |
	hash := self floatTest:[:f| f hypot: f+1].
	self assert: hash = 217113721886532765853628735806816720346