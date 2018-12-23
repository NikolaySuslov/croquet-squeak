accessing
extraProperties
	"This will always create the properties if they do not exist"
	^myProperties ifNil:[myProperties := self newExtraProperties].