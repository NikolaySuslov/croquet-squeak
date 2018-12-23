initialization
highlightFields: fields
	| val tfield |
	tfield := OrderedCollection new.
	fields do:[ :field |
		val := [field text asNumber] on: Error do:[:ex| ex return: nil].
		val ifNotNil:[
			tfield add: (field bounds->val).
		].
	].
	texture ifNotNil:[texture future highlightFields: tfield].
