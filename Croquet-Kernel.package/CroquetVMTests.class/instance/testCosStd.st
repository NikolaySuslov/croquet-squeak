float tests
testCosStd
	| inputA resultA inputB resultB |
	{	"test input value"	"test result plus"		"test result minus"
		{	0.0.				'3FF0000000000000'.	'3FF0000000000000'	}.
		{	1.0.				'3FE14A280FB5068C'.	'3FE14A280FB5068C'	}.
		{	2.0.				'BFDAA22657537205'.	'BFDAA22657537205'	}.
		{	Float infinity.	nil.					nil	}.
		{	Float nan.		nil.					nil	}.
	} do:[:spec|
		inputA := self copysign: spec first from: 1.0.
		resultA := [inputA cos hex] on: Error do:[:ex| ex return: nil].
		inputB := self copysign: spec first from: -1.0.
		resultB := [inputB cos hex] on: Error do:[:ex| ex return: nil].
		self assert: spec second = resultA.
		self assert: spec third = resultB.
	].