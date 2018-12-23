transform
globalTransform: gTrans
	
	frameChanged := false.
	globalTransform := gTrans.
	self globalTransformUpdate.
	^ globalTransform.