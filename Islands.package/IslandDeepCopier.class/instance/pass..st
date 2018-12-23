copying
pass: obj
	"Bring the object here, and do not allow FarRefs"

	| how |
	obj isFarRef ifTrue:[^ super pass: obj].
	how := obj class howToPassAsArgument.
	how = #passByProxy: ifTrue: [how := #passByCopy:].	"resolve all refs"
	^ self perform: how with: obj