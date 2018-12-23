menu
showFrameRateString
	^(self fpsMorph ifNil:['<off>'] ifNotNil:['<on>']), 'show frame rate'