initialize
initialize
	splObjects := IdentityDictionary new.
	splObjects at: #TextStyle::Default put: TextStyle default.
	TextStyle actualTextStyles keysAndValuesDo:[:key :val|
		splObjects at: ('TextStyle::', key) asSymbol put: val.
	].
	Cursor classPool keysAndValuesDo:[:key :val|
		(val isKindOf: Cursor) ifTrue:[
			splObjects at: ('Cursor::', key) asSymbol put: val.
		].
	].
	Smalltalk at: #CCursorLibrary ifPresent:[:aClass|
		aClass default keysAndValuesDo:[:key :val|
			splObjects at: ('CCursorLibrary::', key) asSymbol put: val.
		].
	].
	Smalltalk at: #CIconLibrary ifPresent:[:aClass|
		aClass default icons keysAndValuesDo:[:key :val|
			splObjects at: ('CIconLibrary::Default::', key) asSymbol put: val.
		].
	].
	Smalltalk at: #MenuIcons ifPresent:[:mic|
		(mic classPool at: #Icons) keysAndValuesDo:[:key :val|
			splObjects at: ('MenuIcons::', key) asSymbol put: val.
		].
	].
	Smalltalk at: #ScriptingSystem ifPresent:[:scs|
		scs formDictionary keysAndValuesDo:[:key :val|
			splObjects at: ('ScriptingSystem::Forms::', key) asSymbol put: val.
		].
	].
	Smalltalk at: #CIdentityTransform ifPresent:[:aClass|
		splObjects 
			at: #'CIdentityTransform::Default'
			put: (aClass classPool at: #Default).
	].
	Smalltalk at: #IdentityTransform ifPresent:[:aClass|
		splObjects 
			at: #'IdentityTransform::Default'
			put: (aClass classPool at: #Default).
	].
	unblessed := IdentitySet new.