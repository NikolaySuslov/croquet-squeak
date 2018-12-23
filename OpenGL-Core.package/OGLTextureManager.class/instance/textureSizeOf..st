accessing
textureSizeOf: aTForm
	| handle |
	handle := self textureHandleOf: aTForm ifAbsent:[nil].
	handle ifNil:[^nil]. "unknown"
	^handle scaledSize