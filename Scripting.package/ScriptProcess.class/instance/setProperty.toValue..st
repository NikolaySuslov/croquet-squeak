properties
setProperty: propName toValue: aValue
	"These special cases move old properties into named fields of the extension"
	properties == nil ifTrue: [properties := IdentityDictionary new].
	properties at: propName put: aValue.
