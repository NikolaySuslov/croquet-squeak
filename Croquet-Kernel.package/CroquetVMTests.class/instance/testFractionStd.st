float tests
testFractionStd
	| inputA resultA inputB resultB |
	{	"test input value"	"test result plus"		"test result minus"
		{	0.0.				'0000000000000000'.	'8000000000000000'	}.
		{	1.0.				'0000000000000000'.	'8000000000000000'	}.
		{	2.0.				'0000000000000000'.	'8000000000000000'	}.
		{	Float infinity.	'0000000000000000'.	'8000000000000000'	}.
		{	Float nan.		'0000000000000000'.	'8000000000000000'	}.
	} do:[:spec|
		inputA := self copysign: spec first from: 1.0.
		resultA := [inputA fractionPart hex] on: Error do:[:ex| ex return: nil].
		inputB := self copysign: spec first from: -1.0.
		resultB := [inputB fractionPart hex] on: Error do:[:ex| ex return: nil].
		self assert: spec second = resultA.
		self assert: spec third = resultB.
	].