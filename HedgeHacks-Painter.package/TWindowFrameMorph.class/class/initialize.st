instance creation
initialize
	"TWindowFrameMorph initialize"
	| proto |
	proto := (ScriptingSystem formAtKey: 'expandBox').
	proto ifNotNil:[
		ExpandButtonForm := proto rotateBy: #left centerAt: 0@0.
	].
	proto := ScriptingSystem formAtKey:'Halo-Dismiss'.
	proto ifNotNil:[
		CloseButtonForm := Form extent: proto extent depth: 8.
		(BitBlt toForm: CloseButtonForm) sourceForm: proto; combinationRule: 3; copyBits.
	].