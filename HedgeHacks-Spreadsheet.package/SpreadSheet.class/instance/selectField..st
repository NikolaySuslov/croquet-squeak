initialization
selectField: field

	selectedField := field.
	selectedField ifNotNil:[
		self invalidRect: (selectedField bounds translateBy:(-2@0)).
		self highlightFields: {field}.
	].