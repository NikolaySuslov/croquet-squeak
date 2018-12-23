float tests
testArcCosHStd
	| inputA resultA inputB resultB |
	{	"test input value"	"test result plus"		"test result minus"
		{	0.0.				nil.					nil	}.
		{	1.0.				'0000000000000000'.	nil	}.
		{	2.0.				'3FF5124271980434'.	nil	}.
		{	Float infinity.	'7FF0000000000000'.	nil	}.
		{	Float nan.		nil.					nil	}.
	} do:[:spec|
		inputA := self copysign: spec first from: 1.0.
		resultA := [inputA arcCosH hex] on: Error do:[:ex| ex return: nil].
		inputB := self copysign: spec first from: -1.0.
		resultB := [inputB arcCosH hex] on: Error do:[:ex| ex return: nil].
		self assert: spec second = resultA.
		self assert: spec third = resultB.
	].