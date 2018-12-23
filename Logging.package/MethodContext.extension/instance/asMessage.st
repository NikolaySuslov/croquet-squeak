*logging
asMessage
	| selector |
	selector := self selector.
	^ selector isUnary
		ifTrue: [Message selector: selector]
		ifFalse: [Message selector: selector arguments:
		((1 to: selector keywords size) collect: [:i | self at: i])]