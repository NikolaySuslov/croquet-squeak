math functions
divideByArray: array

	1 to: self size do:[:i | self at: i put: (self at: i)/(array at: i).].