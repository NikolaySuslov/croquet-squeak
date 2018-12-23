accessing
isPassByIdentity: obj
	"Answer whether this object is a legal #passByIdentity: Object"

	^ (obj class howToPassAsArgument == #passByIdentity:) 