*logging-core
logDetailedOn: stream
	self hasContentsInExplorer ifFalse: [ ^ self printOn: stream ].
 
	(self respondsTo: #explorerContents)
		ifTrue: [ 
			self explorerContents do: [ :each | stream << each asString; cr ].
			^ self
		].
	"For all others, show named vars first, then indexed vars"
	self class allInstVarNames keysAndValuesDo: [:index :each |
		stream << each << ': ' << (self instVarAt: index) printString ; << ' '.
	].
	(1 to: self basicSize) do: [:index |
		stream << index << ': ' << (self basicAt: index) printString << ' '.
	].
		 