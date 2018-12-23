fileIn/Out
postImportFromIslandCopier: importer
	| pseudoSHA |
	"Copies get their own apps and own state (including their own tform)."
	appID := (TObjectID for: self).
	pseudoSHA := TFormManager generateSHA: (TObjectID for: 'TembeddedDisplay>>pseudoSHA').
	tform := TForm new
		initialize: nil sha: pseudoSHA
		form: (Form extent: 32@32 depth: 32)
		mipmap: false shrinkFit: true extension: nil.	
	tform bThumb: true.

	"The above should be done before super stuff, which might mess with the form."
	super postImportFromIslandCopier: importer.
	self registerApp.