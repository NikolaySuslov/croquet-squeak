float tests
testSinStd
	| inputA resultA inputB resultB |
	{	"test input value"		"test result plus"		"test result minus"
		{	0.0.				'0000000000000000'.	'8000000000000000'	}.
		{	1.0.				'3FEAED548F090CEE'.	'BFEAED548F090CEE'	}.
		{	2.0.				'3FED18F6EAD1B446'.	'BFED18F6EAD1B446'	}.
		{	Float infinity.	nil.					nil	}.
		{	Float nan.		nil.					nil	}.
	} do:[:spec|
		inputA := self copysign: spec first from: 1.0.
		resultA := [inputA sin hex] on: Error do:[:ex| ex return: nil].
		inputB := self copysign: spec first from: -1.0.
		resultB := [inputB sin hex] on: Error do:[:ex| ex return: nil].
		self assert: spec second = resultA.
		self assert: spec third = resultB.
	].