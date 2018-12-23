searching
gcTrace: todo label: aString
	"Search for a reference path to the goals"
	| obj max step next now |
	aString
		displayProgressAt: Sensor cursorPoint 
		from: 0 to: 200 during:[:bar|

		bar value: 0.
		max := objCount.
		step := (max // 200) max: 1.
		next := step.
		now := 0.
		[todo isEmpty] whileFalse:[
			(now := now + 1) > next ifTrue:[
				bar value: next // step.
				next := next + step.
			].
			obj := todo removeLast.
			self markAndTrace: obj with: todo.
		].
	].