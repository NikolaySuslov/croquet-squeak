parsing
getChildNamed: childName from: parent

	| theChild nameParts |
	(parent objectName sameAs: childName) ifTrue: [ ^parent].

	nameParts := childName findTokens: ' '.
	(nameParts first sameAs: parent objectName) ifTrue: [nameParts removeFirst].
	theChild := parent.
	nameParts do: [:aName|
		theChild := theChild frameChildren detect:[:any| any objectName sameAs: aName].
	].
	^ theChild.