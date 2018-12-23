fileIn/Out
postImportFromIslandCopier: importer
	super postImportFromIslandCopier: importer.
	tform ifNotNil:[
		"Ensure that we only have one copy of the target tform in the current island"
		| formKey existing |
		formKey := tform sha asSymbol.
		existing := self island at: formKey.
		existing ifNil:[self island at: formKey put: (existing := tform)].
		tform := existing.
	].