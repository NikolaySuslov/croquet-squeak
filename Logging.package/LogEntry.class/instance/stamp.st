accessing
stamp
	"Answer the value of stamp"

	^ stamp ifNil: [stamp := DateAndTime now]