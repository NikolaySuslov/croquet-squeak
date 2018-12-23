accessing
objectProperties
	"This will always create the properties if they do not exist"
	^myCobaltObjectProperties ifNil:[myCobaltObjectProperties := self newCobaltObjectProperties].