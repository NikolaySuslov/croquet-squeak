importing
importGlobalRef
	| className uid globalName |
	uid := self importNext.
	globalName := self importNext.
	className := self importNext.
	uid. globalName. className.
	^nil
