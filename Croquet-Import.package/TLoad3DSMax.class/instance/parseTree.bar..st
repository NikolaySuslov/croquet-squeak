parse
parseTree: aStream bar: bar 
	| pair name value list count |
	bar value: aStream position.
	list := LinkedList new.  "Uses linked list for performance - GC was thrashing on large OrderedCollections"
	count := 0.
	[pair := self nextOn: aStream.
	name := pair first.
	value := pair second.
	name = #EOF
		ifTrue: [^ list].
	name = #BEGIN
		ifTrue: ["Override last value"
				(list lastLink) value: (self parseTree: aStream bar: bar)
				]
		ifFalse: [name = #END
				ifTrue: [^ list]
				ifFalse: [list addLast: (T3DSParseNode name: name value: value)]
			].
		count := count + 1.
		(count > 250) ifTrue: [count := 0. bar value: aStream position.].
		] repeat.
		bar value: aStream position.