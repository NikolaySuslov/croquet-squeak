transform
transformBy: m4x4

	localTransform := localTransform composedWithLocal: m4x4.	
	self frameChanged.
	^ localTransform.
