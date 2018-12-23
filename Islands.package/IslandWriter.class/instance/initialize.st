initialize
initialize
	super initialize.
	unblessed := IdentitySet new.
	archive := ZipArchive new.
	splObjects := IdentityDictionary new.
	splObjects at: TextStyle default put: #TextStyle::Default.
	TextStyle actualTextStyles keysAndValuesDo:[:key :val|
		splObjects at: val put: ('TextStyle::', key) asSymbol.
	].
	Cursor classPool keysAndValuesDo:[:key :val|
		(val isKindOf: Cursor) ifTrue:[
			splObjects at: val put: ('Cursor::', key) asSymbol.
		].
	].
	Smalltalk at: #CCursorLibrary ifPresent:[:aClass|
		aClass default keysAndValuesDo:[:key :val|
			splObjects at: val put: ('CCursorLibrary::', key) asSymbol.
		].
	].
	Smalltalk at: #CIconLibrary ifPresent:[:aClass|
		aClass default icons keysAndValuesDo:[:key :val|
			splObjects at: val put: ('CIconLibrary::Default::', key) asSymbol.
		].
	].
	Smalltalk at: #MenuIcons ifPresent:[:mic|
		(mic classPool at: #Icons) keysAndValuesDo:[:key :val|
			splObjects at: val put: ('MenuIcons::', key) asSymbol.
		].
	].
	Smalltalk at: #ScriptingSystem ifPresent:[:scs|
		scs formDictionary keysAndValuesDo:[:key :val|
			splObjects at: val put: ('ScriptingSystem::Forms::', key) asSymbol.
		].
	].
	Smalltalk at: #CIdentityTransform ifPresent:[:aClass|
		splObjects 
			at: (aClass classPool at: #Default) 
			put: #'CIdentityTransform::Default'.
	].
	Smalltalk at: #IdentityTransform ifPresent:[:aClass|
		splObjects 
			at: (aClass classPool at: #Default) 
			put: #'IdentityTransform::Default'.
	].