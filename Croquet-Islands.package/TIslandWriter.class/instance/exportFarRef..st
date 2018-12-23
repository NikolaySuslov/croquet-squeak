exporting
exportFarRef: farRef
	"Check if this is a global"
	| island globalName |
	island := farRef island.
	globalName := island globalNameAt: farRef ifAbsent:[nil].
	globalName ifNil:[^self exportProhibited: farRef].
	dataStream nextPut: CodeGlobalRef.
	self export: farRef island uid.
	self export: globalName.
	self export: (farRef send: #class) name.
