initialize-release
terminate
	| list |
	self isDone ifTrue:[^self].
	self isActiveProcess ifFalse:[
		"avoid runaway"
		list := self suspend.
		list ifNotNil:[priority := priority - 1].
	].
	self stopScriptProcess: nil.
	super terminate.