utilities
new: aClass constructor: aSymbol arguments: args
	"Create an instance of aClass"
	^aClass perform: aSymbol withArguments: args