events
keyDown: event

	| c v |
	v := event keyValue.
	c := Character value: v.

	v = 32 ifTrue:[ self reset. thirdBody stop.].
	c = $r ifTrue:[ saveVelocity ifNotNil:[
					self reset.	
					thirdBody velocity: saveVelocity.
					thirdBody translation: savePosition.
					].
				].
	c = $+ ifTrue:[ self speed: speed + 1.0. ^ self].
	c = $- ifTrue:[ self speed: speed - 1.0.  ^ self].
	c isDigit ifTrue:[self reset. ].
	c = $1 ifTrue:[  thirdBody velocity: 4@5@-5.
					thirdBody translation: 9@29@44.
					].
	c = $2 ifTrue:[  thirdBody velocity: -7@0@3.
					thirdBody translation: 50@10@25.
				].
	c = $3 ifTrue:[  thirdBody velocity: -6@-4.0@5.
					thirdBody translation: 49@7@36.
				].

	c = $4 ifTrue:[  thirdBody velocity: -6@3@6.
					thirdBody translation: 38@14@7.
				].
	c = $5 ifTrue:[  thirdBody velocity: -2@-4@6.
					thirdBody translation: 45@44@17.
				].
	c = $6 ifTrue:[  thirdBody velocity: 5@-2@-1.
					thirdBody translation: 24@3@42.
				].
	c = $7 ifTrue:[  thirdBody velocity: 5@4@-6.
					thirdBody translation: 20@22@33.
				].
	c = $8 ifTrue:[  thirdBody velocity: -2@0@6.
					thirdBody translation: 31@10@21.
				].
	c =$9 ifTrue:[  thirdBody velocity: 
					(saveVelocity := 7- ((14 atRandom)@7@(14 atRandom))).
				thirdBody translation: 
					(savePosition := (50 atRandom)@10@(50 atRandom)).
				].	
	c =$0 ifTrue:[  thirdBody velocity: 
					(saveVelocity := 7- ((14 atRandom)@(14 atRandom)@(14 atRandom))).
				thirdBody translation: 
					(savePosition := (50 atRandom)@(50 atRandom)@(50 atRandom)).
				].