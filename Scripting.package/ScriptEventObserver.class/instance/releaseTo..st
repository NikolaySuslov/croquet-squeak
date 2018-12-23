initialize-release
releaseTo: aHandler
	aHandler == self ifTrue:[^self].
	self release.
	^nextHandler ifNotNil:[nextHandler releaseTo: aHandler].