dynamic lookup
doesNotUnderstand: aMessage
	"WARNING: DON'T TRY THIS AT HOME!
	If you grok this method you are seriously ready for meta-programming.
	If you don't you shouldn't worry either - it's not your fault ;-)"
	| method ffiCall extension |

	"see if that method is really there"
	method := OGLExtManager class "(!)" compiledMethodAt: aMessage selector ifAbsent:[nil].
	method ifNil:[^super doesNotUnderstand: aMessage].

	"see if it's an FFI call"
	(method numLiterals > 0 and:[(method literalAt: 1) isKindOf: ExternalFunction])
		ifFalse:[^super doesNotUnderstand: aMessage].

	"grab the ffi call from the method"
	ffiCall := method literalAt: 1.
	"see if it describes some extension (module needs to be empty)"
	ffiCall module isNil ifFalse:[^super doesNotUnderstand: aMessage].

	"look up the extension"
	extension := OGLExtManager class organization categoryOfElement: aMessage selector.

	"load the extension"
	self loadExtension: extension.

	"and reinvoke method"
	(self respondsTo: aMessage selector) ifTrue:[
		^self perform: aMessage selector withArguments: aMessage arguments
	].
	^super doesNotUnderstand: aMessage