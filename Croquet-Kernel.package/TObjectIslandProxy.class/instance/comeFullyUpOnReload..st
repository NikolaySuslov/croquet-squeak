as yet unclassified
comeFullyUpOnReload: refStream
	"Reconstitute me"
self halt.
	refStream class == TMessageEncoder
		ifTrue:[
			^refStream island
				lookup: self
				ifAbsent:[refStream island errorNoSuchObject: self].
		]	.