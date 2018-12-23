stepping
step
	| trans transform |
	spin ifNil:["stop stepping"
		stepping := false.
		^self].
	trans := self translation.
	self translationX: 0.0 y:0.0 z:0.0.
	transform := self localTransform.
	transform := transform composeWith: spin.
	100 atRandom = 1 ifTrue:[transform normalize]. "renormalize once in a while"
	self localTransform: transform.
	self translation: trans.
	(self future: 50) step.