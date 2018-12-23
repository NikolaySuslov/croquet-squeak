vm version
testVMBuildVersion
	"Ensure that the VM reports a build string (getSystemAttribute: 1006)"
	self deny: (Smalltalk getSystemAttribute: 1006) isEmptyOrNil