private
finalizeValues

	mutex critical: [
		| length oldIndex newIndex element |
		length := array size.
		1 to: length do:[:index|
			(array at: index) ifNil:[
				tally := tally - 1.
				oldIndex := index.
				[oldIndex = length
					ifTrue: [oldIndex := 1]
					ifFalse: [oldIndex := oldIndex + 1].
				(element := array at: oldIndex) == flag] whileFalse:[
					newIndex := self findElementOrFlag: element.
					oldIndex = newIndex ifFalse: [array swap: oldIndex with: newIndex].
				].
			].
		].
	].