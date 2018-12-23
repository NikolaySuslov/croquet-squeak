stepping
step
	| trans transform |
	spin ifNil:[^stepping := false]. "done stepping"
	trans := self translation.
	self translationX: 0.0 y:0.0 z:0.0.
	transform := self localTransform.
	transform := transform composeWith: spin.
	self localTransform: transform.
	self translation: trans.
	(self future: 50) step.