public
stack
"Log a stack trace"

"
This code was donated by Giovanni Giorgi (jj@objectsroot.com)  http://gioorgi.com/projects/
LogEngine and this snipped LogRouterAbstract-#stack is licenced MIT.
"
	"Call Example:
	stack==	an OrderedCollection('LogRouter>>buildStackTrace' '[] in LogClient>>privateBuildLineLimitedTo:usingID:obj:' 'String class(SequenceableCollection class)>>streamContents:limitedTo:' 'LogClient>>privateBuildLineLimitedTo:usingID:obj:' 'LogClient>>privateInfo:msg:' 'LogClient>>info:' '[] in LogTest class>>DoIt' '[] in BlockContext>>newProcess')"
	| stack |
	stack := LogException signal.	
	1 to: (stack size) do:[:i|
		('LogRouter(LogRouterAbstract)>>stack' = (stack at:i) )
		ifTrue:[ ^ self detailed: (stack copyFrom: i+2 to: stack size)]].

	^ self << 'No stack trace found??' ; endEntry