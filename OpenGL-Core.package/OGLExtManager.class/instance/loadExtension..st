dynamic lookup
loadExtension: extName
	"Load and install the extension with the given name"

	| selectors callType method ffiCall ffiAddr methodCopy |
	ogl ifNil:[^self error: 'OGLExtManager must be bound to a specific context'].

	"see if the extension is present"
	(ogl extensions includes: extName) ifFalse:[^self error: extName, ' is not present'].

	"verify that we're an anonymous subclass of OGLExtManager"
	(self class superclass ~~ OGLExtManager or:[
		OGLExtManager subclasses includes: self class]) 
			ifTrue:[^self error: 'Must be anonymous'].

	"pick up the selectors"
	selectors := OGLExtManager class "!" organization listAtCategoryNamed: extName.

	"get the calling convention"
	callType := ogl glExtCallingConvention.

	"install the methods"
	selectors do:[:sel|
		method := OGLExtManager class compiledMethodAt: sel ifAbsent:[nil].
		(method notNil 
			and:[method numLiterals > 0 
				and:[(ffiCall := method literalAt: 1) isKindOf: ExternalLibraryFunction]]) 
					ifTrue:[

			"clone the method"
			methodCopy := method shallowCopy.

			"set up a new ffi function"
			ffiCall := ExternalLibraryFunction new 
				name: ffiCall name 
				module: (ogl glExtModule ifNil: [ffiCall module]) "see glExtModule"
				flags: callType 
				argTypes: ffiCall argTypes.

			"Lookup address through OpenGL, unless we use a regular FFI lookup."
			ogl glExtModule ifNil: [
				"get the address of the extension function"
				ffiAddr := ogl glExtGetProcAddress: ffiCall name asString.
				(ffiAddr == nil or:[ffiAddr = 0]) ifTrue:[
					self error: 'Failed to find ', ffiCall name.
				] ifFalse:[
					ffiAddr := ExternalAddress new fromInteger: ffiAddr.
				].
				ffiCall setHandle: ffiAddr].

			"install the new ffi call"
			methodCopy literalAt: 1 put: ffiCall.

			"add the copy to our method dictionary"
			self class addSelectorSilently: sel withMethod: methodCopy.
		].
	].
