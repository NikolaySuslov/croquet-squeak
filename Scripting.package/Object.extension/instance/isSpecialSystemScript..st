*Scripting-Extensions
isSpecialSystemScript: scriptDescriptor
	"A fall-back for special system scripts which need to be handled in slightly different ways"
	^scriptDescriptor == #runTicking:at: