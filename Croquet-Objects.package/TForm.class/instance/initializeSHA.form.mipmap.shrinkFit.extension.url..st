initialize
initializeSHA: shaName form: baseForm mipmap: bMM shrinkFit: bSF extension: ext url: u
	url := u.
	bMipmap := bMM.
	bShrinkFit := bSF.
	extension := ext.
	objectID := TObjectID new.
	sha := shaName.
	self setupForm: baseForm.