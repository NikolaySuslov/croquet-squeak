parse
parse: aStream announcing: announcement
	| max tree |
	self reset.
	max := aStream size.
	announcement
		displayProgressAt: Sensor cursorPoint
		from: 0
		to: max
		during: [:bar | tree := self parseTree: aStream bar: bar. bar value: max.].
	^tree.