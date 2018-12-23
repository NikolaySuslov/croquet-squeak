initialization
updateField: field

	selectedField ifNotNil:[
		self invalidRect: (selectedField bounds translateBy:(-2@0))].
	selectedField := nil.
