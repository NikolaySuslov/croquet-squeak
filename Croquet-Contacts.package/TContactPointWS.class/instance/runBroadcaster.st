broadcaster
runBroadcaster
	| delay |
	
	"wsBroadcaster := WebClient webSocketTo: 'http://localhost:8080/broadcast'."
	delay := Delay forSeconds: 5.

	[true] whileTrue:[
		broadcastContacts do:[:bc |
			|obj sendObj ws |
			
			ws := WebClient webSocketTo: self hostName "'http://localhost:8080/broadcast'".
			sendObj := Dictionary new.
			sendObj  at: 'msg' put: 'CRQT';
							at: 'id' put: bc id hex;
							at: 'name' put: bc name;
							at: 'address' put:  bc address hex;
							at: 'port' put: bc port;
							yourself.
							
				obj :=	WebUtils jsonEncode: sendObj.
				"Transcript show: 'send contact'; cr. "
				ws send: obj.
				ws close.
	].

		delay wait.
	].