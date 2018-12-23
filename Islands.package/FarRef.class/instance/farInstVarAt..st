debugging
farInstVarAt: index 
	"instVarAt: for far references"
	^self send: #instVarAt: with: index