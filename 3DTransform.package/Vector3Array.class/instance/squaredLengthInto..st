math functions
squaredLengthInto: target

	1 to: self size do:[:i | target at: i put: (self at: i) squaredLength.].