export
exportFieldDefinition: fieldDef
	dataStream nextPut: CodeFieldDefinition.
	self export: fieldDef home name.
	self export: fieldDef name.