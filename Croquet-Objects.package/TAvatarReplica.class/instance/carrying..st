accessing
carrying: aFrame

	originalTransforms at: aFrame put: aFrame localTransform copy.

	aFrame parent ifNotNil:[aFrame parent removeChild: aFrame.].
	carrying ifNil:[carrying := TAvatarCarry new. self addChild: carrying.].
	carrying addChild: aFrame.
