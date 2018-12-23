float tests
testExpStd
	| inputA resultA inputB resultB |
	{	"test input value"		"test result plus"		"test result minus"
		{	0.0.				'3FF0000000000000'.	'3FF0000000000000'	}.
		{	1.0.				'4005BF0A8B14576A'.	'3FD78B56362CEF38'	}.
		{	2.0.				'401D8E64B8D4DDAE'.	'3FC152AAA3BF81CC'	}.
		{	Float infinity.	'7FF0000000000000'.	'0000000000000000'	}.
		{	Float nan.		nil.					nil	}.
	} do:[:spec|
		inputA := self copysign: spec first from: 1.0.
		resultA := [inputA exp hex] on: Error do:[:ex| ex return: nil].
		inputB := self copysign: spec first from: -1.0.
		resultB := [inputB exp hex] on: Error do:[:ex| ex return: nil].
		self assert: spec second = resultA.
		self assert: spec third = resultB.
	].