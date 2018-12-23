printing
storeXMLOn: writer
	| obj instSize |
	writer startTag: refClass name.
	writer attribute:'id' value: id abs asString.
	id < 0 ifTrue:[^writer endEmptyTag: refClass name].
	id := id negated.
	binary ifNotNil:[^self storeBinaryXMLOn: writer].
	writer endTag.
	instSize := instShape size.
	instShape keysAndValuesDo:[:i :attr|
		(obj := self at: i) ifNil:[
			writer startTag: attr; endEmptyTag: attr.
		] ifNotNil:[
			obj class == TIslandCopyData ifTrue:[
				writer startTag: attr; endTag.
				obj storeXMLOn: writer.
				writer endTag: attr.
			] ifFalse:[
				writer startTag: attr.
				writer attribute: 'value' value: obj asString.
				writer endEmptyTag: attr.
			].
		].
	].
	(indexedSize > 0) ifTrue:[
		writer startTag:'indexed-values'; endTag.
		1 to: indexedSize do:[:i|
			(obj := self at: instSize+i) ifNotNil:[
				obj class == TIslandCopyData ifTrue:[
					obj storeXMLOn: writer.
				] ifFalse:[
					writer startTag: obj class name.
					writer attribute: 'value' value: obj asString.
					writer endEmptyTag: obj class name.
				].
			].
		].
		writer endTag:'indexed-values'.
	].
	writer endTag: refClass name.