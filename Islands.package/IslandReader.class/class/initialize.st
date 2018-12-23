class initialization
initialize
	"IslandReader initialize"
	(Smalltalk includesKey: #ByteString) ifFalse:[
		Smalltalk declare: #ByteString from: Undeclared.
		Smalltalk declare: #WideString from: Undeclared.
		Smalltalk at: #ByteString put: 'hello' class.
	].
	IslandWriter initialize.
	ImportCodes := Array new: 256 withAll: #errorInvalidCode.
	IslandWriter classPool keysAndValuesDo:[:key :code|
		(key beginsWith: 'Code') ifTrue:[
			ImportCodes at: code put: ('import', (key allButFirst: 4)) asSymbol.
		].
	].