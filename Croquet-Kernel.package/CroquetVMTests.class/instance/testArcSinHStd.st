float tests
testArcSinHStd
	| inputA resultA inputB resultB |
	{	"test input value"	"test result plus"		"test result minus"
		{	0.0.				'0000000000000000'.	'8000000000000000'	}.
		{	1.0.				'3FEC34366179D427'.	'BFEC34366179D427'	}.
		{	2.0.				'3FF719218313D087'.	'BFF719218313D087'	}.
		{	Float infinity.	'7FF0000000000000'.	'FFF0000000000000'	}.
		{	Float nan.		nil.					nil	}.
	} do:[:spec|
		inputA := self copysign: spec first from: 1.0.
		resultA := [inputA arcSinH hex] on: Error do:[:ex| ex return: nil].
		inputB := self copysign: spec first from: -1.0.
		resultB := [inputB arcSinH hex] on: Error do:[:ex| ex return: nil].
		self assert: spec second = resultA.
		self assert: spec third = resultB.
	].