instance creation
new
	Smalltalk platformName = 'Win32' ifTrue:[^OGLWin32 basicNew initialize].
	Smalltalk platformName = 'unix'
		ifTrue:
			[(Smalltalk windowSystemName = 'Quartz')
				"implicitly big endian"
				ifTrue: [^OGLUnixQuartz basicNew initialize].
				"default to X11 window system"
				Smalltalk isLittleEndian
					ifTrue: [^OGLUnixX11LE basicNew initialize]
					ifFalse: [^OGLUnixX11BE basicNew initialize]].
	Smalltalk platformName = 'Mac OS' ifTrue:[
		Smalltalk osVersion asNumber < 1000 
			ifTrue: [^OGLMacOS9 basicNew initialize]
			ifFalse:[^OGLMacOSX basicNew initialize].
	].
	^self error:'Cannot identify platform'