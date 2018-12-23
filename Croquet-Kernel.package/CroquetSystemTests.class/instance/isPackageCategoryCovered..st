sanity
isPackageCategoryCovered: catName
	"Answer true if this category is covered by an MC package"
	| map cat idx |
	map := MCWorkingCopy registry.
	cat := catName.
	[map includesKey: (MCPackage named: cat)] whileFalse:[
		idx := cat lastIndexOf: $- ifAbsent:[^false].
		cat := cat copyFrom: 1 to: idx-1.
	].
	^true