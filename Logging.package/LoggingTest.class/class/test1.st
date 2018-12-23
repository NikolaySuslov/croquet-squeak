regression-tests
test1
	"LogTest test1"
	| lc lc2 |
	self LogClient reset.
	lc := LogClient for: 'RegressionTest1'.
	lc2 := LogClient for: 'RegressionTest2'.
	lc2 debug: 'test2 Printed first'.
	lc debug: 'test1 Printed for second'.
	lc info: 'You can also print lines where code is called!'.
	lc info: ' Info level'.
	lc error: 'Error level'.
	self test2.
	LogClient reset