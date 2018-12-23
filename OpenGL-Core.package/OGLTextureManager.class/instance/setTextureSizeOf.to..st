accessing
setTextureSizeOf: aTForm to: aPoint
	| handle |
	handle := self textureHandleOf: aTForm ifAbsent:[nil].
	handle ifNil:[^nil]. "unknown"
	^handle scaledSize: aPoint