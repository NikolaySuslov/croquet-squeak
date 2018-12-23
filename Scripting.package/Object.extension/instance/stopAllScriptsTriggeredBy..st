*Scripting-Extensions
stopAllScriptsTriggeredBy: receiver
	"Stop all the scripts that are triggered by the given receiver. I.e.,
		self startScript: #onFoo when: {rcvr. #foo}.
		self startScript: #onBar when: {rcvr. #bar}.
	...
		self stopAllScriptsTriggeredBy: rcvr.
	will stop the scripts registered earlier."
	| scripts |
	scripts := (self myScripts ifNil:[^self]) select:[:each| each isTriggeredBy: receiver].
	scripts do:[:sc| self stopScript: sc].
	^scripts