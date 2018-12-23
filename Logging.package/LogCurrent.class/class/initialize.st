as yet unclassified
initialize
 	
	default := nil.
	Protect := Semaphore forMutualExclusion.
	"Protect := Monitor new."
	
	Preferences addPreference: #enableTemporaryDebugMessages
		categories: #('logging') default: true 
		balloonHelp: 'Enable logging of temporary debug messages'.
		
	"Preferences addPreference: #logDebug
		categories: #('logging') default: true 
		balloonHelp: 'Enable logging of debug messages'."
	
	Levels := IdentityDictionary new.

	"Same as Toothpick list"
	#(#none #off #fatal #panic #emergency #alert #critical #error #warn #notice #info #debug #temp #all) 

	keysAndValuesDo: [ :n :l | Levels at: l put: n ].