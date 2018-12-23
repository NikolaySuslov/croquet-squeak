float tests
testSinHStd
	| inputA resultA inputB resultB |
	{	"test input value"	"test result plus"		"test result minus"
		{	0.0.				'0000000000000000'.	'8000000000000000'	}.
		{	1.0.				'3FF2CD9FC44EB982'.	'BFF2CD9FC44EB982'	}.
		{	2.0.				'400D03CF63B6E1A0'.	'C00D03CF63B6E1A0'	}.
		{	Float infinity.	'7FF0000000000000'.	'FFF0000000000000'	}.
		{	Float nan.		nil.					nil	}.
	} do:[:spec|
		inputA := self copysign: spec first from: 1.0.
		resultA := [inputA sinH hex] on: Error do:[:ex| ex return: nil].
		inputB := self copysign: spec first from: -1.0.
		resultB := [inputB sinH hex] on: Error do:[:ex| ex return: nil].
		self assert: spec second = resultA.
		self assert: spec third = resultB.
	].