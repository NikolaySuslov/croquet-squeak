float tests
testArcCosStd
	| inputA resultA inputB resultB |
	{	"test input value"		"test result plus"		"test result minus"
		{	0.0.				'3FF921FB54442D18'.	'3FF921FB54442D18'	}.
		{	1.0.				'0000000000000000'.	'400921FB54442D18'	}.
		{	2.0.				nil.					nil	}.
		{	Float infinity.	nil.					nil	}.
		{	Float nan.		nil.					nil	}.
	} do:[:spec|
		inputA := self copysign: spec first from: 1.0.
		resultA := [inputA arcCos hex] on: Error do:[:ex| ex return: nil].
		inputB := self copysign: spec first from: -1.0.
		resultB := [inputB arcCos hex] on: Error do:[:ex| ex return: nil].
		self assert: spec second = resultA.
		self assert: spec third = resultB.
	].