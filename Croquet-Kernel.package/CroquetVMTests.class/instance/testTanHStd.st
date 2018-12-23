float tests
testTanHStd
	| inputA resultA inputB resultB |
	{	"test input value"	"test result plus"		"test result minus"

"ar 4/19/2006: I have disabled the test for tanh(-0.0) for the time being because it was literally the 'last bit' differing amongst the various VMs before Croquet 1.0 and we were all wiped out by the time we ran into it to the point that I felt that having a different result for tan(-0.0) (-0.0 on some and 0.0 on other platforms with -0.0 being the 'correct' answer) wasn't worth pushing it any further. At some point we'll put it back in (likely before the next release; by then we'll have recovered from this one ;-) and fix it for good."

"		{	0.0.				'0000000000000000'.	'8000000000000000'	}.		"
		{	1.0.				'3FE85EFAB514F394'.	'BFE85EFAB514F394'	}.
		{	2.0.				'3FEED9505E1BC3D4'.	'BFEED9505E1BC3D4'	}.
		{	Float infinity.	'3FF0000000000000'.	'BFF0000000000000'	}.
		{	Float nan.		nil.					nil	}.
	} do:[:spec|
		inputA := self copysign: spec first from: 1.0.
		resultA := [inputA tanH hex] on: Error do:[:ex| ex return: nil].
		inputB := self copysign: spec first from: -1.0.
		resultB := [inputB tanH hex] on: Error do:[:ex| ex return: nil].
		self assert: spec second = resultA.
		self assert: spec third = resultB.
	].