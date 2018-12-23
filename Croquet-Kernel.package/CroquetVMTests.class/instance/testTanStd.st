float tests
testTanStd
	| inputA resultA inputB resultB |
	{	"test input value"		"test result plus"		"test result minus"
		{	0.0.				'0000000000000000'.	'8000000000000000'	}.
		{	1.0.				'3FF8EB245CBEE3A6'.	'BFF8EB245CBEE3A6'	}.
		{	2.0.				'C0017AF62E0950F8'.	'40017AF62E0950F8'	}.
		{	Float infinity.	nil.					nil	}.
		{	Float nan.		nil.					nil	}.
	} do:[:spec|
		inputA := self copysign: spec first from: 1.0.
		resultA := [inputA tan hex] on: Error do:[:ex| ex return: nil].
		inputB := self copysign: spec first from: -1.0.
		resultB := [inputB tan hex] on: Error do:[:ex| ex return: nil].
		self assert: spec second = resultA.
		self assert: spec third = resultB.
	].