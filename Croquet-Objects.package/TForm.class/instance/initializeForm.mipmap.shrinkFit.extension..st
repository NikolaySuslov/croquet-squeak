initialize
initializeForm: baseForm mipmap: bMM shrinkFit: bSF extension: ext

	bMipmap := bMM.
	bShrinkFit := bSF.
	extension := ext.
	objectID := TObjectID for: self.
	self setupForm: baseForm.