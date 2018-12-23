copying
veryDeepCopyWith: aDeepCopier
	"I refer to an object in another project.  Replicate that object here, with no references to the source project."

	| new |
	aDeepCopier references at: self ifPresent: [:newer | ^ newer]. 	"already did him"
	aDeepCopier forbiddenIsland = myIsland
		ifTrue: [new := (IslandDeepCopier new from: myIsland to: Processor activeIsland) 
					pass: myValue.	"always copies"
				aDeepCopier references at: self put: new.	"remember"
				aDeepCopier newGuys add: new.	"remember"
				^ new]
		ifFalse: [^ self]	"always OK to share FarRefs"