float tests
testArcTanStd
	| inputA resultA inputB resultB |
	{	"test input value"	"test result plus"		"test result minus"
		{	0.0.				'0000000000000000'.	'8000000000000000'	}.
		{	1.0.				'3FE921FB54442D18'.	'BFE921FB54442D18'	}.
		{	2.0.				'3FF1B6E192EBBE44'.	'BFF1B6E192EBBE44'	}.
		{	Float infinity.	'3FF921FB54442D18'.	'BFF921FB54442D18'	}.
		{	Float nan.		nil.					nil	}.
	} do:[:spec|
		inputA := self copysign: spec first from: 1.0.
		resultA := [inputA arcTan hex] on: Error do:[:ex| ex return: nil].
		inputB := self copysign: spec first from: -1.0.
		resultB := [inputB arcTan hex] on: Error do:[:ex| ex return: nil].
		self assert: spec second = resultA.
		self assert: spec third = resultB.
	].