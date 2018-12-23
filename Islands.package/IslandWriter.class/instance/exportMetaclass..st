export
exportMetaclass: aClass
	"Export class/version"
	dataStream nextPut: CodeMetaclass.
	self exportClass: aClass theNonMetaClass.