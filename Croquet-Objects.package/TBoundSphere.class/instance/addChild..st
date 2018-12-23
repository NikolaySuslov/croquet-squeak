access
addChild: child

	children ifNil:[children := OrderedCollection new.].
	children add: child.