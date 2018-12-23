class initialization
initialize
	"OGLExtManager initialize"
	"Initialize all registered extensions. Please see the class comment."
	self class selectorsAndMethodsDo:[:sel :meth|
		(sel ~= #initialize and:[sel beginsWith: 'initialize']) ifTrue:[self perform: sel].
		((sel beginsWith: 'gl') and:[meth numLiterals > 0 and:[(meth literalAt: 1) isKindOf: ExternalLibraryFunction]]) ifTrue:[
			self forwardExtMethod: sel.
		].
	].
	GLExtConstants initialize.