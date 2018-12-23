as yet unclassified
loadIcon: iconName defaultExtent: defaultExtent
	| iconFile icon |
	iconFile := [(FileDirectory default directoryNamed: 'icons') readOnlyFileNamed: iconName]
		on: Error do:[:ex| ex return: nil].
	iconFile ifNil:[^Form extent: defaultExtent depth: 8].
	icon := Form fromBinaryStream: iconFile.
	iconFile close.
	^icon