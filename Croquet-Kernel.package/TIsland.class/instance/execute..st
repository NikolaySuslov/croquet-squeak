event loop
execute: aTMessage
	| result id promised |
	id := aTMessage id.
	result := aTMessage receiver 
		perform: aTMessage selector 
		withArguments: aTMessage arguments.
	id ifNotNil:[
		"Name the result accordingly"
		promised := nameMap at: id ifAbsentPut:[TFarRef new].
		promised privateValue: result island: self.
		"Recycle farRef if possible"
		self asFarRef: result put: promised.
		self signal: id asSymbol with: result.
	].
