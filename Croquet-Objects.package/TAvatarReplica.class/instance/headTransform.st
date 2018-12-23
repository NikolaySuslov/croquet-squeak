accessing
headTransform

	^ head ifNil:[Matrix4x4 identity] ifNotNil:[head localTransform].