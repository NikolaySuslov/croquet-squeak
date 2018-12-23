accessing
contents
	"Answer the binary contents of the exporter"
	^ByteArray streamContents:[:s| self writeDataOn: s].