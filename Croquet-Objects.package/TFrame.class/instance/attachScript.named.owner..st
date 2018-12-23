scripts
attachScript: scriptCode named: scriptName owner: avatar
	"Attach the given script to the receiver"
	| mgr |
	mgr := self root scriptManager.
	mgr ifNotNil:[mgr attachScript: scriptCode named: scriptName to: self owner: avatar].