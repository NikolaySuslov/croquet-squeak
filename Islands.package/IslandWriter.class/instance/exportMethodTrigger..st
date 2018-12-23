export
exportMethodTrigger: aTrigger
	dataStream nextPut: CodeMethodTrigger.
	self export: aTrigger home name.
	self export: aTrigger selector.