class initialization
forwardExtMethod: aSelector
	"Compile a forwarder method in OpenGL"
	| code parser fwdCode |
	code := self class sourceCodeAt: aSelector.
	parser := self parserClass new.
	parser parseSelector: code.
	code := code copyFrom: 1 to: (parser endOfLastToken min: code size).
	fwdCode := String streamContents:[:s|
		s nextPutAll: code.
		s crtab; nextPutAll: '"This method was automatically generated"'.
		s crtab; nextPutAll: '^glExt '; nextPutAll: code.
	].
	(OpenGL sourceCodeAt: aSelector ifAbsent:['']) = fwdCode ifTrue:[^self]. "no change"
	OpenGL compile: fwdCode classified: (self class organization categoryOfElement: aSelector).
