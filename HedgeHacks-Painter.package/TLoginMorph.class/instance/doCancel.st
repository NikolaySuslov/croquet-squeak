actions
doCancel

	self delete.
	cancelBlock ifNotNil:[cancelBlock value].