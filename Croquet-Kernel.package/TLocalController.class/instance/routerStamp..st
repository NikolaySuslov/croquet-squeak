actions
routerStamp: timeValue
	"ROUTERSTAMP: Change the router's time stamp"
	| p |
	timeStamp := timeValue.
	"Create a resolved promise to adhere to the protocol"
	p := TPromise new.
	p resolve: true.
	^p