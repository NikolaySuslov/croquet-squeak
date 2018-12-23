actions
moveBox: event

		self translation: self translation +
			(self orientation localPointToGlobal: (selectedFrame orientation localPointToGlobal: event selectedPoint-selectedPoint)).

	ghostFrame ifNotNil:[
		contents localTransform: (self localTransform composeWith: ghostChild localTransform).
		].
