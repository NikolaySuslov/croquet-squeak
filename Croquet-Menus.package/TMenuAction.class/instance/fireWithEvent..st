evaluating
fireWithEvent: anEvent
	"Fire this message with the given event"
	| nArgs args |
	nArgs := selector numArgs.
	args := self arguments ifNil:[#()].
	nArgs = arguments size ifTrue:[
		^receiver perform: selector withArguments: args].
	nArgs = (arguments size + 1) ifTrue:[
		^receiver perform: selector withArguments: (args copyWith: anEvent)].
	"For now, raise an error. We can always extend it later."
	^self error: 'Invalid number of arguments'