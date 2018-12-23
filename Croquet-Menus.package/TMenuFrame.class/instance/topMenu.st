accessing
topMenu
	"Answer the top menu in this menu chain"
	^(parentMenu ifNil:[^self]) topMenu