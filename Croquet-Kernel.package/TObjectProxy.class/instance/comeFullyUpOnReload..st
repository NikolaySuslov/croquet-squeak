accessing
comeFullyUpOnReload: refStream
	"Reconstitute me"
	refStream class == TMessageEncoder ifTrue:[
		^refStream island lookup: self ifAbsent:[refStream island errorNoSuchObject: self].
	].