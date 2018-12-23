instance creation
new
	"To use OGLExtManager we must always create a new anonymous subclass"
	| baseClass newClass |
	self == OGLExtManager ifFalse:[self error: 'OGLExtManager: Cannot create instances of subclasses'].
	baseClass := OGLExtManager. "hardcoded for a reason"
	"Create a new anonymous subclass"
	newClass := ClassBuilder new
		newSubclassOf: baseClass
		type: baseClass typeOfClass
		instanceVariables: ''
		from: nil.
	baseClass removeSubclass: newClass.
	baseClass addObsoleteSubclass: newClass.
	newClass setName: '*', baseClass name.
	^newClass basicNew
