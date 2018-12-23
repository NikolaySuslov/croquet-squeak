fileIn/Out
prepareToExportOnIslandCopier: exporter
	super prepareToExportOnIslandCopier: exporter.
	
	"Clean up event map, which has FarRefs. Registering on import will bring them back."
	myProperties := myProperties copy.  "Otherwise the next line will clobber the original!!."
	self myEventMap: IdentityDictionary new. "Will be filled in by registerApp postImport."


