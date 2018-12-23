accessing
find: blockTest
	| list |
	blockTest ifNil:[^ nil].
	list := OrderedCollection new.
	self find: blockTest into: list.
	^ list.