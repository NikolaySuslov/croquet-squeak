comparing
squaredErrorDistanceTo: anotherMatrix
	| result temp |
	result := self - anotherMatrix.
	temp := 0.
	1 to: 4 do: [:i | 1 to: 4 do: [:j| temp := temp + ((result at: i-1*4+j) squared)]].
	^temp sqrt.