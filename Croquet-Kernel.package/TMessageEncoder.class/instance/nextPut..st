encoding
nextPut: obj
	"@@@@ FIXME: This needs to follow the rules in IslandArgumentCopier to the letter. 
	Right now it doesn't (or where it does it is by chance) @@@@"
	| ref |
	(obj class howToPassAsArgument) == #passByProxy: ifTrue:[
		ref := obj isFarRef ifTrue:[obj] ifFalse:[obj island asFarRef: obj].
		^super nextPut: ref
	].
	^super nextPut: obj