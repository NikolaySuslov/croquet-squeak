parse
parseTree: aStream
	| pair name value list count |
	list := LinkedList new.  "Uses linked list for performance - GC was thrashing on large OrderedCollections"
	count := 0.
	[
	pair := self nextOn: aStream.
	name := pair first.
	value := pair second.
	name = #EOF
		ifTrue: [^ list].
	name = #BEGIN
		ifTrue: ["Override last value"
				(list lastLink) value: (self parseTree: aStream)
				]
		ifFalse: [name = #END
				ifTrue: [^ list]
				ifFalse: [list addLast: (T3DSParseNode new name: name; value: value; yourself)]
			].
		count := count + 1.
		(count > 250) ifTrue: [count := 0.].
		] repeat.
