accessing
releaseTexture: aTForm
	| binding |
	binding := textures associationAt: aTForm sha ifAbsent:[^self].
	binding key: nil. "clean up after frame completed"
