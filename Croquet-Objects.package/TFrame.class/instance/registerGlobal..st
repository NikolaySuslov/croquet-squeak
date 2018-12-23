Islands
registerGlobal: name

	| nm |
	"
		nm := Processor activeIsland globalNameAt:self ifAbsent:[nil].
		nm ifNotNil:[Processor activeIsland removeGlobal: nm].
	"
	^ Processor activeIsland at:name put: self.
	