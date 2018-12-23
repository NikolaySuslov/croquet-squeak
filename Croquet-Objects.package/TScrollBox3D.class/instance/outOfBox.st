initialize
outOfBox

	| p |
	contents localTransform: (self localTransform composeWith: contents localTransform).
	p := self parent.
	p ifNotNil:[
		p removeChild: self.
		p addChild: contents.
	] ifNil:[self removeChild: contents.].