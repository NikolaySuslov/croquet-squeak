copying
copyToCurrentIsland
	"Return a copy of my value, completely resolved to be in the current Island."

	| copier |
	copier := CDeepCopier new initialize: self initialDeepCopierSize.
	copier forbiddenIsland: myIsland.
	^ self veryDeepCopyWith: copier