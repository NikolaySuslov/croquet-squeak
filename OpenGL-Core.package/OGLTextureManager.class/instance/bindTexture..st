accessing
bindTexture: aTForm
	| handle |
	handle := self textureHandleOf: aTForm.
	handle timeStamp = ogl timeStamp ifFalse:[
		handle timeStamp: ogl timeStamp.
		memFrame := memFrame + handle bytesUsed.
	].
	ogl glBindTexture: aTForm target with: handle glID.